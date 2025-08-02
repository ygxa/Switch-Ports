function state_player_grabdash()
{
    static sparkle_effect = 0;
    static afterimage_timer = 2;
    
    move = key_left + key_right;
    landAnim = false;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_1_start)
        sprite_index = spr_player_PN_kungfu_air_1;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_2_start)
        sprite_index = spr_player_PN_kungfu_air_2;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_3_start)
        sprite_index = spr_player_PN_kungfu_air_3;
    
    var _falling_sprites = [spr_suplexdashFall, spr_suplexdashFallIntro];
    
    if ((floatyGrab-- > 0 && global.playerCharacter == Characters.Pizzelle) || global.playerCharacter == Characters.Pizzano)
    {
        if (global.playerCharacter == Characters.Pizzelle)
            vsp = min(vsp, 0);
        
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
    else if (!grounded && sprite_index != spr_suplexdashFallIntro && sprite_index != spr_suplexdashFall && global.playerCharacter == Characters.Pizzelle)
    {
        sprite_index = spr_suplexdashFallIntro;
        image_index = 0;
    }
    
    if ((sprite_index == spr_suplexdashFallIntro && sprite_animation_end()) || (!grounded && sprite_index == spr_suplexdashGround))
        sprite_index = spr_suplexdashFall;
    
    if (global.playerCharacter == Characters.Pizzano)
    {
        if (move != 0)
        {
            if (move != xscale && movespeed > -12)
                movespeed -= 1;
            else if (move == xscale && movespeed < 12)
                movespeed += 1;
        }
    }
    else if (movespeed < 10)
    {
        movespeed = approach(movespeed, 10, 0.5);
    }
    
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
    {
        jumpStop = false;
        floatyGrab = 18;
    }
    
    momentum = true;
    dir = xscale;
    
    if (move != xscale && move != 0 && global.playerCharacter == Characters.Pizzelle)
    {
        state = PlayerState.jump;
        image_index = 0;
        sprite_index = spr_suplexdashCancel;
        jumpAnim = true;
        momentum = false;
        machTwo = 0;
        floatyGrab = 0;
        xscale *= -1;
        event_play_oneshot("event:/SFX/player/grabcancel", x, y);
    }
    
    if (inputBufferJump > 0 && can_jump)
    {
        image_index = 0;
        
        if (global.playerCharacter == Characters.Pizzano)
            sprite_index = choose(spr_player_PN_kungfu_air_1_start, spr_player_PN_kungfu_air_2_start, spr_player_PN_kungfu_air_3_start);
        else
            sprite_index = spr_longJump_intro;
        
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        state = PlayerState.mach2;
        jumpStop = false;
        vsp = -11;
        grav = 0.3;
        fmod_studio_event_instance_start(sndJump);
        fmod_studio_event_instance_start(sndRollGetUp);
        
        if (move != 0 && global.playerCharacter == Characters.Pizzano)
        {
            if (movespeed <= 10)
                xscale = move;
            
            if (movespeed < 10)
                movespeed = 10;
            else
                hsp = movespeed * xscale;
        }
        else if (move == 0)
        {
            if (movespeed < 0)
            {
                movespeed *= -1;
                xscale *= -1;
                movespeed = 10;
            }
            
            if (movespeed >= 0 && movespeed < 10)
                movespeed = 10;
        }
        
        inputBufferJump = 0;
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        _ledge = snap_to_ledge();
        var _ledge2 = ledge_bump(32, abs(hsp) + 1);
        
        if (((!_ledge && global.playerCharacter == Characters.Pizzelle) || (_ledge2 && global.playerCharacter == Characters.Pizzano)) && !place_meeting(x + xscale, y, obj_destructibles))
        {
            if (!grounded || slopeCheck(x + xscale, y))
            {
                if (_ledge2 && global.playerCharacter == Characters.Pizzano)
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
                else
                {
                    verticalMovespeed = 7;
                    
                    if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
                        verticalMovespeed -= vsp;
                    
                    grabClimbBuffer = 10;
                    state = PlayerState.climbwall;
                    floatyGrab = 18;
                }
            }
            else
            {
                jumpStop = true;
                floatyGrab = 18;
                
                if (global.playerCharacter == Characters.Pizzelle)
                    vsp = -4;
                
                if (global.playerCharacter == Characters.Pizzano)
                {
                    sprite_index = spr_splat;
                    state = PlayerState.bump;
                }
                else
                {
                    sprite_index = spr_player_PZ_suplexDash_bump;
                    state = PlayerState.jump;
                }
                
                image_index = 0;
                event_play_oneshot("event:/SFX/player/splat", x, y);
            }
        }
    }
    
    if (global.playerCharacter == Characters.Pizzano)
        image_speed = 0.4;
    else
        image_speed = 0.3;
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        instance_create(x, y, obj_slidecloud, 
        {
            image_xscale: xscale
        });
    }
    
    if (sprite_index == spr_suplexdashIntro && sprite_animation_end())
    {
        if (grounded)
        {
            sprite_index = spr_suplexdashGround;
        }
        else
        {
            sprite_index = spr_suplexdashFallIntro;
            image_index = 0;
        }
    }
    
    if (grounded && ((sprite_index == spr_suplexdashGround && sprite_animation_end()) || array_contains(_falling_sprites, sprite_index)))
    {
        image_speed = 0.35;
        grav = 0.5;
        
        if (key_attack)
        {
            state = PlayerState.mach2;
            sprite_index = spr_mach2;
            floatyGrab = 0;
        }
        else
        {
            sprite_index = spr_idle;
            image_index = 0;
            momentum = true;
            state = PlayerState.normal;
            floatyGrab = 0;
            jumpStop = true;
        }
    }
    
    if (!grounded && (sprite_index == spr_player_PN_kungfu_1 || sprite_index == spr_player_PN_kungfu_2 || sprite_index == spr_player_PN_kungfu_3 || sprite_index == spr_player_PN_kungfu_4 || sprite_index == spr_player_PN_kungfu_5))
    {
        sprite_index = choose(spr_player_PN_kungfu_air_1_start, spr_player_PN_kungfu_air_2_start, spr_player_PN_kungfu_air_3_start);
        image_index = 0;
    }
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_1_start)
        sprite_index = spr_player_PN_kungfu_air_1;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_2_start)
        sprite_index = spr_player_PN_kungfu_air_2;
    
    if (sprite_animation_end() && sprite_index == spr_player_PN_kungfu_air_3_start)
        sprite_index = spr_player_PN_kungfu_air_3;
    
    if ((((sprite_index == spr_player_PN_kungfu_1 || sprite_index == spr_player_PN_kungfu_2 || sprite_index == spr_player_PN_kungfu_3 || sprite_index == spr_player_PN_kungfu_4 || sprite_index == spr_player_PN_kungfu_5) && sprite_animation_end()) || (grounded && (sprite_index == spr_player_PN_kungfu_air_1 || sprite_index == spr_player_PN_kungfu_air_2 || sprite_index == spr_player_PN_kungfu_air_3 || ((sprite_index == spr_player_PN_kungfu_air_1_start || sprite_index == spr_player_PN_kungfu_air_2_start || sprite_index == spr_player_PN_kungfu_air_3_start) && vsp > 0)))) && global.playerCharacter == Characters.Pizzano)
    {
        image_speed = 0.4;
        grav = 0.5;
        
        if (key_attack)
        {
            if (move != 0)
            {
                if (move != xscale)
                    movespeed = 10;
                
                xscale = move;
                
                if (movespeed < 10 || move != xscale)
                    movespeed = 10;
                else
                    hsp = movespeed * xscale;
            }
            else if (move == 0)
            {
                if (movespeed < 0)
                {
                    movespeed *= -1;
                    xscale *= -1;
                    movespeed = 10;
                }
                
                if (movespeed >= 0 && movespeed < 10)
                    movespeed = 10;
            }
            
            state = PlayerState.mach2;
            sprite_index = spr_mach2;
            floatyGrab = 0;
        }
        else
        {
            if (move != 0)
                xscale = move;
            
            if (movespeed < 6)
                movespeed = 6;
            else
                hsp = movespeed * xscale;
            
            sprite_index = spr_idle;
            image_index = 0;
            momentum = true;
            state = PlayerState.normal;
            floatyGrab = 0;
            jumpStop = true;
        }
    }
    
    if (inputBufferSlap > 0 && (!key_down || !grounded) && animation_end_old(undefined, 2))
    {
        if (global.playerCharacter == Characters.Pizzelle)
        {
            fmod_studio_event_instance_start(sndCrouchslide);
            sprite_index = spr_grabDashTumble;
            image_index = 0;
            image_speed = 0.2;
            
            if (!grounded && floatyGrab > 0)
            {
                vsp = -6;
                floatyGrab = 0;
            }
            
            state = PlayerState.machtumble2;
            movespeed = max(movespeed, 12);
        }
        else if (global.playerCharacter == Characters.Pizzano)
        {
            if (xscale != move && move != 0)
            {
                fmod_studio_event_instance_start(sndCrouchslide);
                
                if (!grounded)
                    sprite_index = choose(spr_player_PN_kungfu_air_1_start, spr_player_PN_kungfu_air_2_start, spr_player_PN_kungfu_air_3_start);
                else
                    sprite_index = choose(spr_player_PN_kungfu_1, spr_player_PN_kungfu_2, spr_player_PN_kungfu_3, spr_player_PN_kungfu_4, spr_player_PN_kungfu_5);
                
                state = PlayerState.grabdash;
                event_play_oneshot("event:/SFX/player/kungfu", x, y);
                
                if (movespeed < 10)
                    movespeed = 10;
                
                image_index = 0;
                instance_create(x, y, obj_crazyRunHoopEffect, 
                {
                    playerID: id
                });
            }
            else if (!grounded)
            {
                flash = 1;
                fmod_studio_event_instance_start(sndCrouchslide);
                
                if (movespeed >= 12)
                {
                    sprite_index = spr_mach3player;
                    state = PlayerState.mach3;
                }
                else
                {
                    sprite_index = spr_mach2;
                    state = PlayerState.mach2;
                }
            }
            
            if (move != 0)
            {
                if (movespeed <= 10)
                    xscale = move;
                
                if (movespeed < 10)
                    movespeed = 10;
                else
                    hsp = movespeed * xscale;
            }
            else if (move == 0)
            {
                if (movespeed < 0)
                {
                    movespeed *= -1;
                    xscale *= -1;
                    movespeed = 10;
                }
                
                if (movespeed >= 0 && movespeed < 10)
                    movespeed = 10;
            }
        }
        
        inputBufferSlap = 0;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    if (!grounded && !global.blastmode)
    {
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
            
            if (movespeed < 0)
                movespeed *= -xscale;
            
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
            
            noglider = 1;
            nodivejump = 0;
            divejumped = 0;
            gliderminus = 0;
            state = PlayerState.costumenormal;
            sprite_index = spr_player_PN_glider_up_start;
            image_index = 0;
            vsp = -18;
        }
    }
    
    if (key_down && global.playerCharacter == Characters.Pizzelle)
    {
        vsp = max(vsp, 6);
        floatyGrab = 0;
        
        if (grounded)
        {
            grav = 0.5;
            sprite_index = spr_crouchslipintro;
            image_index = 0;
            fmod_studio_event_instance_start(sndCrouchslide);
            state = PlayerState.machroll;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            movespeed = 11;
            crouchSlipBuffer = 25;
            crouchSlipAntiBuffer = 0;
        }
    }
    
    if (key_down && (!place_meeting(x, y, obj_dashpad) && !place_meeting(x, y + 1, obj_ladder)) && global.playerCharacter == Characters.Pizzano)
    {
        flash = false;
        state = PlayerState.machroll;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        
        if (move != 0)
        {
            if (movespeed < 10 || move != xscale)
                movespeed = 10;
            
            xscale = move;
        }
        else if (move == 0)
        {
            if (movespeed > 0 && movespeed < 6)
                movespeed = 6;
            
            if (movespeed < 0)
            {
                xscale *= -1;
                movespeed = 10;
            }
        }
        
        image_index = 0;
        
        if (movespeed >= 12)
        {
            sprite_index = spr_machroll3intro;
            image_index = 0;
            mach3Roll = mach3RollMax;
        }
        else
        {
            sprite_index = spr_machroll;
        }
        
        if (!grounded)
        {
            sprite_index = spr_dive;
            fmod_studio_event_instance_start(sndDive);
        }
        
        vsp = 10;
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
