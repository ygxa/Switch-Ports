function state_player_mach3()
{
    windingAnim = min(windingAnim + 1, 2000);
    machTwo = 100;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    move = key_right + key_left;
    move2 = key_right2 + key_left2;
    momentum = true;
    
    if (sprite_index != spr_machdashpad)
    {
        if (runbuffer > 0 && grounded)
            runbuffer--;
        else if (runbuffer > 0 && !grounded)
            runbuffer = 30;
        else if (runbuffer <= 0)
            runbuffer = 0;
    }
    
    if (speedreducebuffer > 0)
        speedreducebuffer--;
    else
        speedreducebuffer = 0;
    
    if (global.blastmode)
    {
        if (movespeed < 12)
            movespeed = 12;
        
        if (movespeed > 20 && !global.truepaul)
            movespeed = 20;
    }
    
    if ((!key_jump2 && !jumpStop && vsp < 0.5) && sprite_index != spr_player_PN_wallBounce_cancel_start && sprite_index != spr_player_PN_wallBounce_cancel && sprite_index != spr_player_PN_mach3_dashPad)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump && move != -xscale)
    {
        image_index = 0;
        sprite_index = spr_mach3jump;
        inputBufferJump = 0;
        fmod_studio_event_instance_start(sndJump);
        vsp = -11;
        
        if (global.blastmode)
            machjumped = 1;
        
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
    }
    
    if (grounded && !global.blastmode)
    {
        if (slopeCheck(x, y) && hsp != 0 && movespeed > 12 && movespeed < 18)
            player_slopeMomentum(0.2, 0);
    }
    
    var maxspd = 20;
    
    if ((move == xscale && grounded) && !global.blastmode)
    {
        if (movespeed < maxspd)
            movespeed += (machFourMode ? 0.1 : 0.025);
    }
    else if (grounded && global.blastmode)
    {
        if (((inputBufferSlap > 0 && !global.blast_switchcontrols) || (key_attack2 && global.blast_switchcontrols)) && (sprite_index != spr_machdashpad || (sprite_index == spr_machdashpad && image_index >= 4)))
        {
            if (!global.blast_switchcontrols)
                inputBufferSlap = 0;
            
            if (movespeed < maxspd || global.truepaul)
            {
                if (sprite_index == spr_mach3player)
                {
                    if (movespeed < 20 || global.truepaul)
                        movespeed += 1.25;
                    else
                        movespeed = 20;
                }
            }
            
            if (timesboosted == 0)
                timesboostedhud = 0;
            
            if (sprite_index == spr_mach3player || (sprite_index == spr_machdashpad && speedreducebuffer > 0))
            {
                timesboosted++;
                timesboostedhud++;
                obj_camera.numbershake = 10;
                
                if (global.paul)
                {
                    instance_create_depth(x, y, obj_parent_player.depth - 1, obj_superdashcloud, 
                    {
                        playerID: id,
                        sprite_index: sp_clutchBoostEffect,
                        image_speed: 0.35
                    });
                }
            }
            
            if (sprite_index == spr_machdashpad && speedreducebuffer <= 0)
            {
                if (movespeed > 12)
                    movespeed -= 2.5;
                else
                    movespeed = 12;
                
                timesboosted = 0;
                timesboostedhud = 0;
            }
            
            dashbuffer = 20;
            runbuffer = 45;
            runbufferhud = 45;
            runaddspeed = 0;
            fastincrease = 0;
            boostbuffer = 25;
            obj_camera.alphabuffer = 150;
            scalexblast = 1.35;
            event_play_oneshot("event:/modded-sfx/clutchBoost", x, y);
            sprite_index = spr_machdashpad;
            image_index = 0;
            
            if (!instance_exists(obj_crazyRunHoopEffect))
            {
                instance_create(x, y, obj_crazyRunHoopEffect, 
                {
                    playerID: id
                });
            }
            
            if (!instance_exists(obj_crazyRunEffect))
            {
                instance_create(x, y, obj_crazyRunEffect, 
                {
                    playerID: id
                });
            }
            
            if (!instance_exists(obj_superdashcloud) && grounded)
            {
                instance_create(x, y, obj_superdashcloud, 
                {
                    playerID: id
                });
            }
        }
    }
    
    if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_mach3player;
    
    if (sprite_index == spr_wallJumpCancelIntro && sprite_animation_end())
        sprite_index = spr_wallJumpCancel;
    
    if ((sprite_index == spr_superjumpCancel || sprite_index == spr_player_PN_wallBounce_cancel) && grounded)
        sprite_index = spr_mach3player;
    
    if (sprite_animation_end() && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_machdashpad))
        sprite_index = spr_mach3player;
    
    if (sprite_index == spr_player_PN_wallBounce_cancel_start && sprite_animation_end())
        sprite_index = spr_player_PN_wallBounce_cancel;
    
    if (grounded && (sprite_index == spr_dive || sprite_index == spr_wallJumpCancelIntro || sprite_index == spr_wallJumpCancel))
        sprite_index = spr_rollgetup;
    
    if (!grounded && !key_down && sprite_index == spr_dive)
    {
        vsp = 15;
        sprite_index = spr_mach3player;
    }
    
    if (!can_jump && !grounded && !noglider && key_up && inputBufferJump > 0 && !key_down && global.playerCharacter == Characters.Pizzano && !global.blastmode)
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
    
    if ((movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_dive && sprite_index != spr_player_PN_glider_up_start) && !global.blastmode)
    {
        machFourMode = true;
        flash = true;
        sprite_index = spr_crazyrun;
        
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    else if ((movespeed <= 16 && sprite_index == spr_crazyrun) || sprite_index == spr_mach2)
    {
        sprite_index = spr_mach3player;
    }
    
    if (grounded)
        sJumpCanDoubleJump = true;
    
    if ((scr_checksuperjump() && sprite_index != spr_machdashpad && sprite_index != spr_dive && can_jump) && !global.blastmode)
    {
        sprite_index = spr_superjumpPrep;
        state = PlayerState.Sjumpprep;
        hsp = 0;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        vsp = min(vsp + 5, terminalVelocity);
        image_index = 0;
    }
    
    if (grounded && vsp >= 0 && dashpadBuffer <= 0)
    {
        if ((!key_attack && !global.blastmode && sprite_index != spr_machdashpad) || (global.blastmode && runbuffer == 0))
        {
            if (global.blastmode)
            {
                if (move != 0)
                {
                    sprite_index = spr_move;
                }
                else
                {
                    event_play_oneshot(sfx_enginesoundskid, x, y);
                    machSlideAnim = true;
                    windingAnim = false;
                    sprite_index = spr_machslideend;
                    image_index = 0;
                }
                
                state = PlayerState.normal;
                movespeed *= xscale;
            }
            else
            {
                event_play_oneshot(sfx_enginesoundskid, x, y);
                sprite_index = spr_machslidestart;
                state = PlayerState.machslide;
            }
            
            image_index = 0;
        }
        
        if (move == -xscale)
        {
            event_play_oneshot(pz_machdrift, x, y);
            
            if (global.blastmode)
                sprite_index = spr_machslidestart;
            else
                sprite_index = spr_machslideboost3;
            
            boostbuffer = 60;
            flash = false;
            state = PlayerState.machslide;
            image_index = 0;
            machTwo = 100;
        }
    }
    
    if (move == -xscale && !grounded && global.blastmode)
    {
        sprite_index = spr_fall;
        flash = false;
        momentum = 1;
        movespeed *= xscale;
        state = PlayerState.jump;
        image_index = 0;
        machTwo = 100;
    }
    
    if ((((inputBufferSlap > 0 && !global.blast_switchcontrols) || (key_attack2 && global.blast_switchcontrols)) && !grounded && !scr_solid(x + xscale, y, true) && global.blastmode) && sprite_index != spr_player_PZ_geyser && sprite_index != spr_player_PN_geyser)
    {
        if (!global.blast_switchcontrols)
            inputBufferSlap = 0;
        
        if (global.playerCharacter == Characters.Pizzano)
            sprite_index = spr_player_PN_geyser;
        else
            sprite_index = spr_player_PZ_geyser;
        
        if (move != -xscale)
            movespeed *= xscale;
        
        state = PlayerState.costumechuck;
        groundbuffer = 20;
    }
    
    if (((((key_attack2 && !global.blast_switchcontrols) || (inputBufferSlap > 0 && global.blast_switchcontrols)) || key_down2) && grounded) && global.blastmode)
    {
        if (global.blast_switchcontrols)
            inputBufferSlap = 0;
        
        grav = 0.5;
        fmod_studio_event_instance_start(sndCrouchslide);
        vsp = 0;
        instance_create(x, y, obj_jumpdust);
        sprite_index = spr_crouchslipintro;
        image_index = 0;
        state = PlayerState.machroll;
        boostbuffer = 60;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        
        if (movespeed < 11)
            movespeed = 11;
        
        crouchSlipBuffer = 25;
        crouchSlipAntiBuffer = 0;
    }
    
    if (reducespeed == 1)
    {
        movespeed = approach(movespeed, 12 + (1.2 * timesboosted), 0.2);
        
        if (speedreducebuffer <= 0)
            reducespeed = 0;
    }
    
    if ((((key_attack2 && !global.blast_switchcontrols) || (inputBufferSlap > 0 && global.blast_switchcontrols)) && !grounded) && global.blastmode)
    {
        if (global.blast_switchcontrols)
            inputBufferSlap = 0;
        
        image_index = 0;
        sprite_index = spr_groundPoundstart;
        vsp = -6;
        freeFallSmash = -14;
        state = PlayerState.freefallprep;
    }
    
    if (key_down && !key_slap2 && !place_meeting(x, y, obj_dashpad) && !global.blastmode)
    {
        mach3Roll = mach3RollMax;
        flash = false;
        state = PlayerState.machroll;
        instance_create(x, y, obj_jumpdust, 
        {
            playerID: id
        });
        image_index = 0;
        sprite_index = spr_machroll3intro;
        
        if (!grounded)
        {
            sprite_index = spr_dive;
            fmod_studio_event_instance_start(sndDive);
        }
        
        vsp = 10;
    }
    
    if (((!grounded && !global.blastmode) || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
        var _ledge = snap_to_ledge(xscale, 40);
        var _ledge2 = ledge_bump(40, abs(hsp) + 1);
        
        if (global.playerCharacter == Characters.Pizzano)
        {
            if (_ledge2 && !global.blastmode)
            {
                event_play_multiple("event:/SFX/player/mach2bump", x, y);
                instance_create(x, y + 10, obj_pizzanoeffect);
                vsp = -(17 * (1 - (spinminus * 0.075)));
                spinminus++;
                wallbuffer = 0;
                state = PlayerState.costumebreeze;
                xscale *= -1;
                
                if (spinminus < 8)
                    movespeed = (4 + spinminus) * xscale;
                else
                    movespeed = 12 * xscale;
                
                sprite_index = spr_player_PN_wallBounce;
                image_index = 0;
                
                with (instance_create(x, y, obj_puffEffect))
                    sprite_index = spr_highJumpCloud1;
            }
            else if (place_meeting(x, y + 1, obj_slope) && global.blastmode)
            {
                if (global.blastmode)
                {
                    event_play_oneshot("event:/SFX/player/groundpound", x, y);
                    vsp = -14;
                    
                    if (global.playerCharacter == Characters.Pizzano)
                        sprite_index = spr_player_PN_fall_outOfControl;
                    else
                        sprite_index = spr_player_PZ_fall_outOfControl;
                    
                    state = PlayerState.costumechuck;
                    
                    if (scr_solid(x + 1, y, true))
                        create_particle(x + 15, y, spr_bangEffect);
                    else if (scr_solid(x - 1, y, true))
                        create_particle(x - 15, y, spr_bangEffect);
                }
            }
        }
        else if (global.blastmode)
        {
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            vsp = -14;
            
            if (global.playerCharacter == Characters.Pizzano)
                sprite_index = spr_player_PN_fall_outOfControl;
            else
                sprite_index = spr_player_PZ_fall_outOfControl;
            
            state = PlayerState.costumechuck;
            
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
            state = PlayerState.climbwall;
        }
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock) && ((grounded && !global.blastmode) || global.blastmode))
    {
        var _ledge = snap_to_ledge();
        
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
    
    if (sprite_index == spr_crazyrun && !instance_exists(obj_crazyRunHoopEffect))
    {
        instance_create(x, y, obj_crazyRunHoopEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_crazyRunEffect))
    {
        instance_create(x, y, obj_crazyRunEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_chargeEffect) && sprite_index != spr_dive)
    {
        instance_create(x, y, obj_chargeEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_superdashcloud) && grounded)
    {
        instance_create(x, y, obj_superdashcloud, 
        {
            playerID: id
        });
    }
    
    image_speed = 0.4;
    
    if (sprite_index == spr_crazyrun)
        image_speed = 0.7;
    else if (sprite_index == spr_machdashpad && !global.blastmode)
        image_speed = 0.3;
    else if (sprite_index == spr_machdashpad && global.blastmode)
        image_speed = 0.5;
    else if (sprite_index == spr_wallJumpCancel || sprite_index == spr_wallJumpCancelIntro)
        image_speed = 0.35;
    
    if (sprite_index != spr_dive)
    {
        if (!global.blastmode)
            do_grab(PlayerState.mach3);
        
        do_taunt(PlayerState.mach3);
    }
}
