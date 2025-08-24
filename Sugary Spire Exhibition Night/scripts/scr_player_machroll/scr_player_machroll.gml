function state_player_machroll()
{
    static afterimage_timer = 2;
    
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    machTwo = 100;
    machSlideAnim = true;
    move = key_right + key_left;
    mask_index = spr_crouchmask;
    if (!instance_exists(obj_puffEffect) && grounded)
        instance_create(x, y + 43, obj_puffEffect);
    
    if (grounded && sprite_index != spr_crouchslipintro && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall)
    {
        if (global.playerCharacter == Characters.Pizzano)
        {
            if (!nodivejump && !divejumped)
            {
                if (sprite_index != spr_player_PN_prep_divejump && sprite_index != spr_player_PN_prep_divehold && sprite_index != spr_machroll && sprite_index != spr_machroll3intro && sprite_index != spr_machroll3)
                {
                    sprite_index = spr_player_PN_prep_divehold;
                    image_index = 0;
                }
                
                if (sprite_index == spr_player_PN_prep_divehold && sprite_animation_end())
                {
                    sprite_index = spr_player_PN_prep_divejump;
                    image_index = 0;
                }
                
                if ((sprite_index == spr_player_PN_prep_divejump || sprite_index == spr_player_PN_prep_divehold) && (inputBufferJump > 0 || !key_down) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && !divejumped)
                {
                    inputBufferJump = 0;
                    fmod_studio_event_instance_start(sndJump);
                    event_play_multiple("event:/SFX/player/mach2bump", x, y);
                    instance_create(x, y, obj_highJumpCloud1, 
                    {
                        playerID: id
                    });
                    instance_create(x, y + 35, obj_pizzanoeffect);
                    sprite_index = spr_player_PN_divejump_start;
                    image_index = 0;
                    image_speed = 0.35;
                    mach3Roll = mach3RollMax;
                    vsp = -10;
                    
                    if (movespeed < 13)
                        movespeed = 13;
                    
                    alarm[8] = 3;
                    state = PlayerState.mach2;
                }
            }
            
            if (sprite_index != spr_machroll3intro && sprite_index != spr_machroll3 && sprite_index != spr_machroll && (((place_meeting(x + 27, y - 32, obj_solid) || place_meeting(x - 27, y - 32, obj_solid) || place_meeting(x, y - 32, obj_solid) || place_meeting(x, y - 16, obj_solid)) && !place_meeting(x + 27, y - 32, obj_destructibles) && !place_meeting(x - 27, y - 32, obj_destructibles) && !place_meeting(x, y - 32, obj_destructibles) && !place_meeting(x, y - 16, obj_destructibles)) || nodivejump || key_down2 || divejumped || key_attack2 || inputBufferSlap > 0))
            {
                if (movespeed >= 12)
                    mach3Roll = mach3RollMax;
                
                if (inputBufferSlap > 0 || key_down2 || key_attack2)
                {
                    flash = 1;
                    fmod_studio_event_instance_start(sndCrouchslide);
                    
                    with (instance_create(x, y, obj_jumpdust))
                        image_xscale = other.xscale;
                    
                    if (movespeed < 11)
                        movespeed = 11;
                    
                    inputBufferSlap = 0;
                }
                
                if (mach3Roll <= 0)
                {
                    sprite_index = spr_machroll;
                }
                else if (sprite_index != spr_machroll3intro && sprite_index != spr_machroll3 && (sprite_index != spr_machroll || sprite_animation_end()))
                {
                    sprite_index = spr_machroll3intro;
                    image_index = 0;
                }
                
                image_index = 0;
                nodivejump = 1;
            }
        }
        else if (mach3Roll <= 0)
        {
            sprite_index = spr_machroll;
        }
        else if (sprite_index != spr_machroll3intro && sprite_index != spr_machroll3 && (sprite_index != spr_machroll || sprite_animation_end()))
        {
            sprite_index = spr_machroll3intro;
            image_index = 0;
        }
    }
    else if ((!grounded && sprite_index != spr_dive))
    {
        crouchSlipBuffer = 0;
        sprite_index = spr_dive;
        fmod_studio_event_instance_start(sndDive);
        vsp = 10;
    }
    
    if (!grounded)
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
    
    if (grounded && (place_meeting(x + 27, y - 32, obj_solid) || place_meeting(x - 27, y - 32, obj_solid) || place_meeting(x, y - 32, obj_solid) || place_meeting(x, y - 16, obj_solid)) && !place_meeting(x + 27, y - 32, obj_destructibles) && !place_meeting(x - 27, y - 32, obj_destructibles) && !place_meeting(x, y - 32, obj_destructibles) && !place_meeting(x, y - 16, obj_destructibles))
        nodivejump = 1;
    
    if (sprite_index == spr_crouchslipintro || sprite_index == spr_crouchslip || sprite_index == spr_crouchslipfall)
    {
    }
    
    crouchSlipBuffer = max(crouchSlipBuffer - 1, 0);
    
    if (sprite_animation_end())
    {
        if (sprite_index == spr_crouchslipintro)
            sprite_index = spr_crouchslip;
        
        if (sprite_index == spr_machroll3intro)
            sprite_index = spr_machroll3;
    }
    
    if ((!key_down && grounded && sprite_index != spr_player_PN_prep_divejump && sprite_index != spr_player_PN_prep_divehold && sprite_index != spr_player_PN_divejump_start && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16)))
    {
        if (crouchSlipBuffer <= 0 || (sprite_index != spr_crouchslip && sprite_index != spr_crouchslipintro && sprite_index != spr_crouchslipfall))
        {
            crouchSlipBuffer = 0;
            
            if (sprite_index != spr_player_PN_prep_divejump && sprite_index != spr_player_PN_prep_divehold && sprite_index != spr_player_PN_divejump_start)
            {
                if (key_attack)
                {
                    instance_create(x, y, obj_jumpdust);
                    fmod_studio_event_instance_start(sndRollGetUp);
                    image_index = 0;
                    sprite_index = spr_rollgetup;
                    state = (movespeed >= 12) ? PlayerState.mach3 : PlayerState.mach2;
                }
                else if (movespeed > 6)
                {
                    event_play_oneshot(sfx_enginesoundskid, x, y);
                    sprite_index = spr_machslidestart;
                    image_index = 0;
                    state = PlayerState.machslide;
                }
                else
                {
                    state = PlayerState.normal;
                }
            }
        }
        
        if ((((inputBufferSlap > 0 && !global.blast_switchcontrols) || (key_attack2 && global.blast_switchcontrols)) || inputBufferJump > 0) && global.blastmode && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
        {
            if (grounded && inputBufferJump > 0)
                vsp = -11;
            
            if (!global.blast_switchcontrols)
                inputBufferSlap = 0;
            
            inputBufferJump = 0;
            dashbuffer = 20;
            movespeed = 12 + (1.25 * timesboosted);
            runbuffer = 45;
            scalexblast = 1.35;
            event_play_oneshot("event:/modded-sfx/clutchBoost", x, y);
            
            //if (timesboosted >= 1 && global.paul)
            //{
                //instance_create_depth(x, y, obj_parent_player.depth - 1, obj_superdashcloud, 
                //{
                    //playerID: id,
                    //sprite_index: sp_clutchBoostEffect,
                    //image_speed: 0.35
                //});
            //}
            
            sprite_index = spr_machdashpad;
            image_index = 0;
            state = PlayerState.mach3;
            
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
    
    if (inputBufferJump > 0 && sprite_index == spr_dive && !place_meeting_collision(x, y + vsp))
    {
        inputBufferJump = 0;
        create_particle(x, y, spr_groundPoundClouds);
        state = PlayerState.freefall;
        image_index = 0;
        sprite_index = spr_diveBombstart;
        dir = xscale;
        vsp = -6;
        verticalMovespeed = vsp;
        freeFallSmash = 0;
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        var old_x = x;
        var old_y = y;
        var attempt = 0;
        var will_splat = true;
        
        while ((place_meeting_collision(x + xscale, y, true) && !grounded) && global.playerCharacter == Characters.Pizzelle)
        {
            will_splat = false;
            attempt++;
            y++;
            
            if (attempt > 10)
            {
                y = old_y;
                will_splat = true;
                break;
            }
        }
        
        if (global.playerCharacter == Characters.Pizzano && !grounded)
        {
            create_particle(x, y, spr_groundPoundClouds);
            state = PlayerState.freefall;
            image_index = 0;
            sprite_index = spr_player_PN_fastfall;
            movespeed = 0;
            
            if (vsp < 16)
                vsp = 16;
            
            dir = xscale;
            verticalMovespeed = vsp;
            freeFallSmash = 0;
            buffedpoundcancel = 1;
        }
        
        if ((will_splat && global.playerCharacter == Characters.Pizzelle) || (global.playerCharacter == Characters.Pizzano && grounded) || global.blastmode)
        {
            state = PlayerState.bump;
            image_index = 0;
            sprite_index = spr_splat;
            event_play_oneshot("event:/SFX/player/splat", x, y);
        }
        else
        {
            with (obj_camera)
                cameraYOffset = other.y - old_y;
        }
    }
    
    if ((sprite_index == spr_crouchslip || sprite_index == spr_crouchslipfall || sprite_index == spr_crouchslipintro || sprite_index == spr_machroll || sprite_index == spr_machroll3 || sprite_index == spr_machroll3intro) && sprite_index != spr_player_PN_machRoll3_intro && sprite_index != spr_player_PN_machRoll3)
        image_speed = abs(movespeed) / 15;
    else if (sprite_index == spr_player_PN_prep_divehold || sprite_index != spr_player_PN_machRoll3 || (sprite_index == spr_player_PN_prep_divejump && movespeed >= 12))
        image_speed = 0.5;
    else if (sprite_index == spr_player_PN_machRoll3_intro)
        image_speed = 0.35;
    else
        image_speed = 0.35;
    
    if (!instance_exists(obj_chargeEffect) && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && sprite_index != spr_dive && sprite_index != spr_player_PN_prep_divejump && sprite_index != spr_player_PN_prep_divehold && movespeed >= 12)
    {
        instance_create(x, y, obj_chargeEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(dashCloudID) && grounded)
    {
        dashCloudID = instance_create(x, y, obj_dashCloud, 
        {
            image_xscale: xscale,
            sprite_index: (movespeed >= 8) ? spr_dashcloud2 : spr_dashCloud
        });
    }
    
    afterimage_timer = max(afterimage_timer - 1, 0);
    
    if (afterimage_timer <= 0)
    {
        with (create_afterimage(Characters.Pizzelle, xscale))
        {
            gonealpha = 0.8;
            alarm[0] = 1;
            alarm[1] = 60;
        }
        
        afterimage_timer = 2;
    }
}
