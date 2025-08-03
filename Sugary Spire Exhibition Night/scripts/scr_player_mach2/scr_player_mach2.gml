function state_player_mach2()
{
    static sparkle_effect = 2;
    static afterimage_timer = 2;
    
    if (global.playerCharacter == Characters.Pizzano && (sprite_index == spr_player_PN_kungfu_air_1_start || sprite_index == spr_player_PN_kungfu_air_2_start || sprite_index == spr_player_PN_kungfu_air_3_start || sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3 || sprite_index == spr_player_PN_divejump_start || sprite_index == spr_player_PN_divejump || sprite_index == spr_player_PN_divejump_fall_start || sprite_index == spr_player_PN_divejump_fall))
    {
        if (sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump && sprite_index != spr_player_PN_divejump_fall_start && sprite_index != spr_player_PN_divejump_fall)
        {
            if (sparkle_effect-- < 0)
            {
                sparkle_effect = 5;
                
                with (instance_create(x, y, obj_bangEffect))
                {
                    depth = -8;
                    image_xscale = choose(1, -1);
                    sprite_index = spr_shineeffect;
                    image_speed = 0.35;
                }
            }
        }
        
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
    }
    
    windingAnim = min(windingAnim + 1, 2000);
    machTwo = 35;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    move = key_right + key_left;
    move2 = key_right2 + key_left2;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && sprite_index != spr_player_PN_superJump_cancel && sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump && sprite_index != spr_player_PN_divejump_fall_start && sprite_index != spr_player_PN_divejump_fall)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump && ((!key_up && global.playerCharacter == Characters.Pizzano) || global.playerCharacter == Characters.Pizzelle))
    {
        if (move != -xscale && key_attack)
        {
            image_index = 0;
            sprite_index = spr_secondjump1;
        }
        
        inputBufferJump = 0;
        fmod_studio_event_instance_start(sndJump);
        vsp = -11;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
    }
    
    var mach_sprite;
    
    if (global.playerCharacter == Characters.Pizzano)
        mach_sprite = spr_mach2;
    else
        mach_sprite = (movespeed >= 8) ? spr_mach2 : spr_mach1;
    
    var mach_jumpsprite = spr_secondjump1;
    
    if (grounded)
    {
        if (global.playerCharacter == Characters.Pizzano)
        {
            if (sprite_index == spr_mach1 && sprite_animation_end())
            {
                sprite_index = spr_mach2;
                image_index = 0;
            }
            else if (sprite_index != mach_sprite && sprite_index != spr_mach1 && sprite_index != spr_mach3player && ((sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump) || (sprite_index == spr_player_PN_divejump && vsp > 0)))
            {
                if (sprite_index != spr_rollgetup)
                    sprite_index = mach_sprite;
            }
        }
        else if (sprite_index != mach_sprite && sprite_index != spr_mach3player && ((sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump) || (sprite_index == spr_player_PN_divejump && vsp > 0)))
        {
            if (sprite_index != spr_rollgetup && ((sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump) || (sprite_index == spr_player_PN_divejump && vsp > 0)))
                sprite_index = mach_sprite;
        }
    }
    
    if (!grounded)
    {
        machPunchAnim = false;
        
        if (!can_jump && key_up && inputBufferJump > 0 && !noglider && !key_down && global.playerCharacter == Characters.Pizzano && !global.blastmode)
        {
            fmod_studio_event_instance_start(sndCrouchslide);
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            
            if (!instance_exists(obj_verticalHoopEffect))
            {
                instance_create(x, y, obj_verticalHoopEffect, 
                {
                    playerID: id,
                    image_angle: 90
                });
            }
            
            inputBufferJump = 0;
            
            if (move != 0)
            {
                if (move == xscale)
                {
                    if (movespeed > 16)
                        movespeed = 16;
                }
                else
                {
                    movespeed = 13;
                }
                
                xscale = move;
            }
            else if (movespeed > 16)
            {
                movespeed = 16;
            }
            
            nodivejump = 0;
            divejumped = 0;
            gliderminus = 0;
            state = PlayerState.costumenormal;
            sprite_index = spr_player_PN_glider_up_start;
            image_index = 0;
            vsp = -18;
        }
    }
    
    if (grounded)
    {
        if (slopeCheck(x, y) && hsp != 0 && movespeed > 8)
            player_slopeMomentum(0.1, 0);
        
        if (movespeed < 12)
            movespeed += 0.1;
        
        if (abs(hsp) >= 12 && sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump && sprite_index != spr_player_PN_divejump_fall_start && sprite_index != spr_player_PN_divejump_fall)
        {
            movespeed = max(movespeed, 12);
            state = PlayerState.mach3;
            flash = true;
            
            if (sprite_index != spr_rollgetup && sprite_index != spr_mach3hit)
                sprite_index = spr_mach3player;
            
            if (global.playerCharacter == Characters.Pizzelle)
                fmod_studio_event_instance_start(sndMachStart);
            
            instance_create(x, y, obj_jumpdust, 
            {
                playerID: id
            });
        }
    }
    
    if (movespeed >= 8)
    {
        if (grounded && vsp >= 0)
        {
            if (!key_attack)
            {
                event_play_oneshot(sfx_enginesoundskid, x, y);
                sprite_index = spr_machslidestart;
                image_index = 0;
                state = PlayerState.machslide;
            }
            
            if (move == -xscale)
            {
                event_play_oneshot(pz_machdrift, x, y);
                sprite_index = spr_machslideboost;
                image_index = 0;
                state = PlayerState.machslide;
            }
        }
    }
    else if (movespeed < 8 && (grounded && vsp >= 0))
    {
        if (!key_attack)
            state = PlayerState.normal;
        
        if (move == -xscale)
        {
            xscale *= -1;
            movespeed = 6;
        }
    }
    
    if ((key_down && sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump) || ((key_down2 && (sprite_index == spr_player_PN_divejump_start || sprite_index == spr_player_PN_divejump)) && !key_slap2 && !place_meeting(x, y, obj_dashpad)))
    {
        flash = false;
        state = PlayerState.machroll;
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
    
    if (bump_wall(xscale) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        if (!grounded || slopeCheck(x + xscale, y))
        {
            var _ledge = snap_to_ledge(xscale, 40);
            var _ledge2 = ledge_bump(32, abs(hsp) + 1);
            
            if (global.playerCharacter == Characters.Pizzano)
            {
                if (_ledge2)
                {
                    event_play_multiple("event:/SFX/player/mach2bump", x, y);
                    instance_create(x, y + 10, obj_pizzanoeffect);
                    vsp = -(17 * (1 - (spinminus * 0.075)));
                    spinminus++;
                    wallbuffer = 0;
                    noglider = 0;
                    state = PlayerState.costumebreeze;
                    xscale *= -1;
                    sprite_index = spr_player_PN_wallBounce;
                    image_index = 0;
                    
                    if (spinminus < 8)
                        movespeed = (4 + spinminus) * xscale;
                    else
                        movespeed = 12 * xscale;
                    
                    with (instance_create(x, y, obj_puffEffect))
                        sprite_index = spr_highJumpCloud1;
                }
            }
            else
            {
                verticalMovespeed = movespeed;
                
                if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
                    verticalMovespeed -= vsp;
                
                grabClimbBuffer = 0;
                state = PlayerState.climbwall;
            }
        }
        else
        {
            var _ledge = snap_to_ledge();
            
            if (!_ledge)
            {
                state = PlayerState.bump;
                image_index = 0;
                sprite_index = spr_splat;
                event_play_oneshot("event:/SFX/player/splat", x, y);
                movespeed = 0;
            }
        }
    }
    
    if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true))
    {
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
    }
    
    if (!instance_exists(dashCloudID) && grounded)
    {
        dashCloudID = instance_create(x, y, obj_dashCloud, 
        {
            image_xscale: xscale,
            sprite_index: (movespeed >= 8) ? spr_dashcloud2 : spr_dashCloud
        });
    }
    
    if (!grounded && sprite_index != spr_wallJumpCancelIntro && sprite_index != spr_wallJumpCancel && sprite_index != spr_airdash2 && sprite_index != spr_secondjump2 && sprite_index != spr_mach2_spinJump && sprite_index != spr_longJump_intro && sprite_index != spr_longJump && sprite_index != spr_player_PN_superJump_cancel && sprite_index != spr_player_PZ_bumped && sprite_index != spr_player_PN_kungfu_air_1_start && sprite_index != spr_player_PN_kungfu_air_2_start && sprite_index != spr_player_PN_kungfu_air_3_start && sprite_index != spr_player_PN_kungfu_air_1 && sprite_index != spr_player_PN_kungfu_air_2 && sprite_index != spr_player_PN_kungfu_air_3 && sprite_index != spr_player_PN_superJump && sprite_index != spr_player_PN_wallBounce && sprite_index != spr_player_PN_divejump_start && sprite_index != spr_player_PN_divejump && sprite_index != spr_player_PN_divejump_fall_start && sprite_index != spr_player_PN_divejump_fall && sprite_index != spr_player_PN_glider_up && sprite_index != spr_player_PN_glider_up_start && sprite_index != spr_player_PN_dive)
        sprite_index = mach_jumpsprite;
    
    if (sprite_animation_end())
    {
        if (sprite_index == spr_wallJumpCancelIntro)
            sprite_index = spr_wallJumpCancel;
        
        if (sprite_index == spr_secondjump1 && global.playerCharacter == Characters.Pizzelle)
            sprite_index = spr_secondjump2;
    }
    
    if (grounded && sprite_animation_end() && sprite_index == spr_rollgetup)
        sprite_index = spr_mach2;
    
    if (sprite_animation_end() && sprite_index == spr_longJump_intro)
        sprite_index = spr_longJump;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_1_start)
        sprite_index = spr_player_PN_kungfu_air_1;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_2_start)
        sprite_index = spr_player_PN_kungfu_air_2;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_3_start)
        sprite_index = spr_player_PN_kungfu_air_3;
    
    if (sprite_index == spr_player_PN_divejump_start)
    {
        divejumped = 1;
        
        if (sprite_animation_end())
        {
            sprite_index = spr_player_PN_divejump;
            image_index = 0;
            divejumpbuffer = 0;
        }
    }
    
    if (sprite_index == spr_player_PN_divejump && vsp > 0 && sprite_index != spr_player_PN_divejump_fall_start && sprite_index != spr_player_PN_divejump_fall)
    {
        sprite_index = spr_player_PN_divejump_fall_start;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_PN_divejump_fall_start && sprite_animation_end())
        sprite_index = spr_player_PN_divejump_fall;
    
    do_grab(PlayerState.mach2);
    do_taunt(PlayerState.mach2);
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_longJump_intro || sprite_index == spr_longJump || sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3 || sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3)
        image_speed = 0.4;
    else if (sprite_index == spr_wallJumpCancelIntro || sprite_index == spr_player_PN_divejump_start || sprite_index == spr_player_PN_divejump || sprite_index == spr_player_PN_divejump_fall_start || sprite_index == spr_player_PN_divejump_fall || sprite_index == spr_player_PN_divejump)
        image_speed = 0.35;
    else if (sprite_index == spr_player_PN_superJump_cancel)
        image_speed = 0.5;
    else
        image_speed = abs(movespeed) / 15;
    
    if (grounded)
    {
        upsideDownJump = false;
        floatyGrab = 18;
    }
}
