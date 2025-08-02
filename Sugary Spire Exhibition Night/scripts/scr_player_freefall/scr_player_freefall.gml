function state_player_freefall()
{
    static cloudeffect = 8;
    static mach3effect = 5;
    static piledrivereffect = 15;
    static afterimage_timer = 2;
    
    if (place_meeting(x, y, obj_vertical_hallway))
        exit;
    
    landAnim = true;
    var is_divebomb = sprite_index == spr_diveBombstart || sprite_index == spr_diveBombfall;
    
    if (vsp >= 2)
    {
        if (global.blastmode)
        {
            if (vsp < 16)
            {
                vsp = approach(vsp, 16, 0.65);
                freeFallSmash += 2.5;
            }
            else if (vsp >= 16)
            {
                vsp += 0.5;
            }
        }
        else
        {
            vsp += 0.5;
        }
        
        if (movespeed > 7 && global.blastmode)
            movespeed = 7;
        
        if (verticalMovespeed > 17)
        {
            if (!mach3effect--)
            {
                with (create_afterimage(choose(1, 2), xscale, true))
                    basicAfterimage = false;
                
                mach3effect = 5;
            }
            
            if (!cloudeffect--)
            {
                create_particle(x, y, spr_cloudEffect, 25);
                cloudeffect = 8;
            }
            
            if (!piledrivereffect--)
            {
                instance_create(x, y, obj_piledrivereffect, 
                {
                    playerID: id
                });
                piledrivereffect = 15;
            }
        }
    }
    
    if (vsp > 0)
        freeFallSmash++;
    else if (vsp < 0)
        freeFallSmash = -14;
    
    move = key_left + key_right;
    
    if (!grounded)
    {
        hsp = (sprite_index == spr_player_PZ_fall_outOfControl || sprite_index == spr_player_PN_fall_outOfControl) ? 0 : (move * movespeed);
        
        if (move != xscale && momentum && movespeed != 0)
            movespeed -= 0.05;
        
        if (movespeed == 0)
            momentum = false;
        
        if (move != dir && move != 0)
        {
            dir = move;
            movespeed = 0;
        }
        
        if ((move == 0 && !momentum) || scr_solid(x + hsp, y))
            movespeed = 0;
        
        if (move != 0 && movespeed < 7)
            movespeed += 0.25;
        
        if (movespeed > 7)
            movespeed -= 0.05;
        
        if (scr_solid(x + move, y) && move != 0)
            movespeed = 0;
        
        if (move != 0 && !is_divebomb)
            xscale = move;
    }
    
    if (sprite_index != spr_player_PZ_fall_outOfControl && sprite_index != spr_player_PN_fall_outOfControl)
    {
    }
    
    if (sprite_index == spr_groundPoundstart && sprite_animation_end())
    {
        image_index = 0;
        sprite_index = spr_groundPoundfall;
    }
    
    if (sprite_index == spr_diveBombstart && sprite_animation_end())
    {
        image_index = 0;
        sprite_index = spr_diveBombfall;
    }
    
    if (grounded && (freeFallSmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + vsp, obj_destructibles))
    {
        if (slopeCheck(x, y) && !place_meeting(x, y, obj_dashpad) && (!buffedpoundcancel || (buffedpoundcancel && !key_attack)))
        {
            state = 12;
            
            if (buffedpoundcancel)
            {
                if (scr_solid(x + xscale, y, true))
                {
                    state = 33;
                    sprite_index = spr_rollgetup;
                }
                else
                {
                    sprite_index = spr_machroll3intro;
                }
                
                mach3Roll = mach3RollMax;
            }
            else
            {
                sprite_index = spr_crouchslip;
            }
            
            if (buffedpoundcancel)
                movespeed = 13;
            else
                movespeed = (freeFallSmash > 20) ? 12 : 8;
            
            if (global.blastmode && !key_down)
            {
                timesboosted = 0;
                speedreducebuffer = 20;
                buffersavespeed = 0;
            }
            
            xscale = -slopeMomentum_direction();
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
        }
        else if (!(slopeCheck(x, y) && !place_meeting(x, y, obj_dashpad) && !buffedpoundcancel))
        {
            if (!slopeCheck(x, y + 1))
                event_play_oneshot("event:/SFX/player/groundpound", x, y);
            
            if (!buffedpoundcancel)
            {
                image_index = 0;
                state = 38;
                jumpAnim = true;
                jumpStop = false;
                
                if (global.blastmode)
                {
                    instance_create(x, y + 10, obj_bombExplosionPlayer);
                    timesboosted = 0;
                    speedreducebuffer = 20;
                    buffersavespeed = 0;
                }
            }
            else if (!slopeCheck(x, y + 1))
            {
                fmod_studio_event_instance_start(sndCrouchslide);
                sprite_index = spr_player_PN_fastfall_bounce_start;
                image_index = 0;
                vsp = -8;
                
                if (key_attack)
                    movespeed = 13 * xscale;
                
                state = 78;
                
                with (instance_create(x, y, obj_puffEffect))
                    sprite_index = spr_highJumpCloud1;
            }
            else
            {
                fmod_studio_event_instance_start(sndCrouchslide);
                
                if (move != 0)
                    xscale = move;
                
                if (dir != 0)
                    xscale = dir;
                else
                    xscale *= -1;
                
                movespeed = 13;
                mach3Roll = mach3RollMax;
                
                if (global.playerCharacter == 0 || (global.playerCharacter == 1 && (!scr_solid(x + xscale, y, true) || key_down)))
                    state = 12;
                
                image_index = 0;
                
                if (scr_solid(x + xscale, y, true) && !key_down)
                {
                    state = 33;
                    sprite_index = spr_rollgetup;
                }
                else
                {
                    sprite_index = spr_machroll3intro;
                }
                
                buffedpoundcancel = 0;
            }
            
            if (!slopeCheck(x, y + 1))
            {
                with (obj_parent_enemy)
                {
                    if (bbox_in_camera(id, view_camera[0]) && grounded)
                    {
                        vsp = -7;
                        hsp = 0;
                        movespeed = 0;
                        
                        if (other.freeFallSmash >= 10)
                        {
                            state = 4;
                            vsp = -11;
                            image_xscale *= -1;
                            
                            if (baddieStunTimer < 60)
                                baddieStunTimer = 60;
                        }
                    }
                }
                
                camera_shake_add(10, 30);
            }
            
            combo = 0;
            
            if (!slopeCheck(x, y + 1))
            {
                with (instance_create(x, y, obj_landcloud))
                    sprite_index = spr_groundpoundLandEffect;
            }
            
            freefallstart = 0;
            image_index = 0;
            var landing_sprite_transitions = [[spr_groundPoundfall, spr_groundPoundland], [spr_groundPoundstart, spr_groundPoundland], [spr_player_PZ_fall_outOfControl, spr_player_PZ_freeFall_land], [spr_diveBombfall, spr_diveBombland], [spr_diveBombstart, spr_diveBombland]];
            
            for (var i = 0; i < array_length(landing_sprite_transitions); i++)
            {
                if (sprite_index == landing_sprite_transitions[i][0])
                    sprite_index = landing_sprite_transitions[i][1];
            }
        }
    }
    
    image_speed = 0.35;
    
    if (freeFallSmash >= 10)
    {
        if (!instance_exists(groundpoundEffect))
        {
            groundpoundEffect = instance_create(x, y + 32, obj_groundPoundEffect, 
            {
                playerID: id
            });
        }
        
        if (!instance_exists(obj_verticalHoopEffect))
        {
            instance_create(x, y, obj_verticalHoopEffect, 
            {
                playerID: id,
                image_angle: -90
            });
        }
    }
    
    afterimage_timer = max(afterimage_timer - 1, 0);
    
    if (afterimage_timer <= 0)
    {
        with (create_afterimage(0, xscale, 0))
        {
            gonealpha = 0.8;
            alarm[0] = 1;
            alarm[1] = 60;
        }
        
        afterimage_timer = 2;
    }
}
