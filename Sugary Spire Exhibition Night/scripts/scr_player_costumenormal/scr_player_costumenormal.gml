function state_player_costumenormal()
{
    static afterimage_timer = 2;
    
    move = key_left + key_right;
    hsp = xscale * movespeed;
    gliderminus = clamp(gliderminus, 0, 2);
    
    if (movespeed < 6)
        movespeed = approach(movespeed, 6, 0.5);
    
    if (move != 0)
    {
        if (sprite_index == spr_player_PN_glider_up || sprite_index == spr_player_PN_glider_up_start)
        {
            if (movespeed < 10)
                movespeed += 0.25;
        }
        else if (move != 0 && move == xscale && movespeed < 16)
        {
            movespeed += 0.05;
        }
    }
    
    if (move != 0)
    {
        if (sprite_index == spr_player_PN_glider_up || sprite_index == spr_player_PN_glider_up_start)
        {
            if (move != xscale)
                movespeed = 0;
            
            xscale = move;
        }
    }
    
    if (vsp < 0)
        vsp += 0.025;
    else
        vsp = approach(vsp, 5, 0.35);
    
    if (sprite_index == spr_player_PN_glider_up_start && sprite_animation_end())
    {
        sprite_index = spr_player_PN_glider_up;
        image_index = 0;
    }
    
    if (vsp > 0 && sprite_index != spr_player_PN_glider && sprite_index != spr_player_PN_glider_transition)
    {
        sprite_index = spr_player_PN_glider_transition;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_PN_glider_transition && sprite_animation_end())
    {
        sprite_index = spr_player_PN_glider;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_PN_glider || sprite_index == spr_player_PN_glider_transition)
    {
        if (movespeed < 12)
            movespeed = approach(movespeed, 12, 0.3);
    }
    
    if (sprite_index != spr_player_PN_glider_up && sprite_index != spr_player_PN_glider_up_start)
    {
        if (inputBufferJump > 0 && (!key_up || gliderminus >= 2) && !scr_solid(x + xscale, y - 16, true))
        {
            fmod_studio_event_instance_start(sndJump);
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            sprite_index = spr_player_PN_divejump_start;
            image_index = 0;
            state = PlayerState.mach3;
            vsp = -10;
            noglider = 1;
            inputBufferJump = 0;
            alarm[8] = 3;
        }
    }
    
    if (key_up && !can_jump && inputBufferJump > 0 && sprite_index == spr_player_PN_glider && gliderminus < 2)
    {
        fmod_studio_event_instance_start(sndCrouchslide);
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        inputBufferJump = 0;
        vsp = -11 + (3 * gliderminus);
        gliderminus++;
        sprite_index = spr_player_PN_glider_up_start;
        image_index = 0;
    }
    
    if (key_down && !place_meeting(x, y, obj_dashpad))
    {
        flash = false;
        state = PlayerState.machroll;
        
        if (movespeed < 6)
            movespeed = 6;
        
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        image_index = 0;
        sprite_index = spr_machroll;
        
        if (!grounded)
        {
            sprite_index = spr_dive;
            fmod_studio_event_instance_start(sndDive);
        }
        
        vsp = 10;
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && (sprite_index == spr_player_PN_glider || sprite_index == spr_player_PN_glider_transition))
    {
        var _ledge = ledge_bump(32, abs(hsp) + 1);
        
        if (!grounded)
        {
            if (_ledge && !place_meeting(x, y + 1, obj_slope))
            {
                event_play_multiple("event:/SFX/player/mach2bump", x, y);
                instance_create(x, y + 10, obj_pizzanoeffect);
                vsp = -(17 * (1 - (spinminus * 0.075)));
                spinminus++;
                wallbuffer = 0;
                sprite_index = spr_player_PN_wallBounce;
                state = PlayerState.costumebreeze;
                xscale *= -1;
                
                if (spinminus < 8)
                    movespeed = (4 + spinminus) * xscale;
                else
                    movespeed = 12 * xscale;
                
                image_index = 0;
                
                with (instance_create(x, y, obj_puffEffect))
                    sprite_index = spr_highJumpCloud1;
            }
            else if (place_meeting(x, y + 1, obj_slope))
            {
                if (global.blastmode)
                {
                    event_play_oneshot("event:/SFX/player/groundpound", x, y);
                    vsp = -14;
                    sprite_index = spr_player_PN_fall_outOfControl;
                    state = PlayerState.jump;
                    
                    if (scr_solid(x + 1, y, true))
                        create_particle(x + 15, y, spr_bangEffect);
                    else if (scr_solid(x - 1, y, true))
                        create_particle(x - 15, y, spr_bangEffect);
                }
                else
                {
                    verticalMovespeed = movespeed;
                    
                    if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
                        verticalMovespeed -= vsp;
                    
                    grabClimbBuffer = 0;
                    inputBufferJump = 0;
                    state = PlayerState.climbwall;
                }
            }
        }
        else
        {
            _ledge = snap_to_ledge();
            
            if (!_ledge)
            {
                event_play_oneshot("event:/SFX/player/groundpound", x, y);
                camera_shake_add(20, 40);
                image_speed = 0.35;
                
                with (obj_parent_enemy)
                {
                    if (bbox_in_camera(id, view_camera[0]) && grounded)
                    {
                        stun = 1;
                        alarm[0] = 200;
                        ministun = 0;
                        vsp = -5;
                        hsp = 0;
                    }
                }
                
                flash = false;
                combo = 0;
                sprite_index = spr_mach3hitwall;
                state = PlayerState.bump;
                hsp = -6 * xscale;
                vsp = -6;
                machTwo = 0;
                image_index = 0;
                instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
            }
        }
    }
    
    if (grounded && vsp > 0)
    {
        sprite_index = spr_rollgetup;
        image_index = 0;
        
        if (movespeed < 12)
        {
            if (movespeed < 6)
                movespeed = 6;
            
            state = PlayerState.mach2;
        }
        else
        {
            state = PlayerState.mach3;
        }
    }
    
    image_speed = 0.35;
    afterimage_timer = max(afterimage_timer - 1, 0);
    
    if (afterimage_timer <= 0)
    {
        with (create_afterimage(AfterImageType.plain, xscale, 0))
        {
            image_index = max(other.image_index - 1, 0);
            vanish = true;
            gonealpha = 0.8;
            alarm[0] = 1;
            alarm[1] = 60;
        }
        
        afterimage_timer = 2;
    }
    
    do_grab(PlayerState.costumenormal);
    do_taunt(PlayerState.costumenormal);
}
