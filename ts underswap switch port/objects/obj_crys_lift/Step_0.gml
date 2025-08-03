actor_shake_logic();

switch (state)
{
    case (1 << 0):
        jumpProgress = clamp(jumpProgress + 0.08, 0, 1);
        jumpX = lerp(jumpStartX, x + 20, jumpProgress);
        jumpY = lerp(jumpStartY, y + 10, jumpProgress) - (25 * animcurve_channel_evaluate(animcurve_get_channel(acv_jump, 0), jumpProgress));
        
        with (obj_player)
        {
            x = other.jumpX;
            y = other.jumpY;
        }
        
        if (jumpProgress >= 1)
        {
            doShake(2);
            sfx_play(snd_click);
            
            if (room == rm_crys_entermines)
            {
                if (instance_exists(obj_gamejolt) && obj_gamejolt.fileUpload != (1 << 0))
                    gj_state_upload(global.gj_username, global.gj_token);
                
                if (evil)
                {
                    trophy_achieve(31);
                    state = (4 << 0);
                }
                else
                {
                    trophy_achieve(30);
                    state = (3 << 0);
                    moveDirection = 1;
                    var arrowSprite = instance_create_xy(x + 40, y - 40, obj_staticsprite_instant);
                    
                    with (arrowSprite)
                    {
                        sprite_index = spr_star_arrow;
                        image_index = 1;
                        image_speed = 0;
                    }
                    
                    actor_set_lerp_kind([acv_jump, 1.5, true]);
                    actor_lerp_var(arrowSprite, "image_alpha", 0, 0, 30);
                    actor_set_lerp_kind(acv_midslow);
                    actor_lerp_var(arrowSprite, "y", arrowSprite.y, arrowSprite.y + 80, 30);
                    
                    with (instance_create(obj_destroyer))
                    {
                        object = arrowSprite;
                        totalTime = 30;
                    }
                }
            }
            else
            {
                state = (2 << 0);
            }
        }
        
        break;
    
    case (3 << 0):
        moveSpeed = min(moveSpeed + moveSpeedAccel, moveSpeedMax);
        
        if (moveSpeed > 0)
        {
            if (moveDirection == 1)
                y += moveSpeed;
            else
                y -= moveSpeed;
            
            moveFrameIndex += 0.2;
            
            if (floor(moveFrameIndex) >= 3)
                moveFrameIndex -= 3;
        }
        
        if (charaShake != 0)
        {
            charaShake -= (sign(charaShake) * 0.5);
            charaShake *= -1;
        }
        
        if (room == rm_crys_entermines)
        {
            if (y >= 1555)
            {
                y -= 1120;
                
                with (obj_crys_lighting)
                    followY -= 1120;
                
                with (obj_player)
                    y -= 1120;
            }
            
            if (creditsTimer >= 0)
            {
                creditsTimer++;
                
                if (creditsTimer == 90)
                {
                    music_kill_current();
                    music_lcplay("springs_credits", false);
                }
                else if (creditsTimer >= 510 && creditsTimer < 540)
                {
                    with (obj_player)
                    {
                        lookDirection = 3;
                        dummyOverride = true;
                        image_index = 1;
                    }
                    
                    charaOffset += 0.2;
                }
                else if (creditsTimer == 540)
                {
                    with (obj_player)
                    {
                        lookDirection = 3;
                        dummyOverride = true;
                        image_index = 0;
                    }
                    
                    charaOffset = 6;
                }
                else if (creditsTimer == 570)
                {
                    peerIndex = 0;
                    charaShake = 1.5;
                }
                else if (creditsTimer == 630)
                {
                    peerIndex = 1;
                    charaShake = 1.5;
                }
                else if (creditsTimer >= 799.5)
                {
                    creditsTimer = -1000;
                    global.credits_from_menu = false;
                    instance_create(obj_credits).specialAlpha = 0;
                }
            }
            else if (creditsTimer != -1)
            {
                creditsTimer++;
                
                if (creditsTimer >= -951.7)
                {
                    with (obj_credits)
                    {
                        specialAlpha += 0.025;
                        
                        if (specialAlpha >= 1)
                            other.creditsTimer = -1;
                    }
                }
            }
        }
        
        var cameraTargetX = (x + 20) - 160;
        var cameraTargetY = (y + 5) - 120;
        camera_set_view_pos(view_get_camera(0), cameraTargetX, cameraTargetY);
        break;
    
    case (4 << 0):
        if (collapseTimer == 0)
        {
            var sprite = instance_create_xy(-20, 120, obj_staticsprite);
            
            with (sprite)
            {
                sprite_index = spr_ambush_bul;
                image_speed = 0;
                move_towards_point(160, 90, 7);
                image_angle = point_direction(x, y, obj_player.x, obj_player.y) - 90;
            }
        }
        else if (collapseTimer == 26)
        {
            sfx_play(snd_click);
        }
        else if (collapseTimer == 56)
        {
            gravity = 0.25;
        }
        else if (collapseTimer == 76)
        {
            music_gain(0, 2000);
            sfx_play_ext(snd_bridgefall, 0.75, 1);
        }
        else if (collapseTimer >= 226)
        {
            if (ruth_enabled())
            {
                if (collapseTimer == 286)
                {
                    instance_create_xy(80, 120, obj_flowey_dummy);
                }
                else if (collapseTimer == 316)
                {
                    obj_flowey_dummy.sprite_index = spr_flowey_right;
                }
                else if (collapseTimer == 396)
                {
                    obj_flowey_dummy.sprite_index = spr_flowey_left;
                }
                else if (collapseTimer == 456)
                {
                    obj_flowey_dummy.sprite_index = spr_flowey_sink;
                    obj_flowey_dummy.image_speed = 1;
                }
            }
            
            if (creditsTimer >= 0)
            {
                creditsTimer++;
                
                if (creditsTimer == 90)
                {
                    music_kill_current();
                    music_lcplay("springs_credits_alt", false);
                }
                else if (creditsTimer >= 799.5)
                {
                    creditsTimer = -1000;
                    var fade = instance_create_xy(camera_get_view_x(view_camera[0]) - 8, camera_get_view_y(view_camera[0]) - 8, obj_staticsprite_dummy, 
                    {
                        sprite_index: spr_white,
                        image_blend: c_black,
                        image_xscale: 336,
                        image_yscale: 256,
                        depth: -1000
                    });
                    actor_lerp_var(fade, "image_alpha", 0, 1, 60);
                    global.credits_from_menu = false;
                    instance_create(obj_credits).specialAlpha = 0;
                }
            }
            else if (creditsTimer != -1)
            {
                creditsTimer++;
                
                if (creditsTimer >= -951.7)
                {
                    with (obj_credits)
                    {
                        specialAlpha += 0.025;
                        
                        if (specialAlpha >= 1)
                            other.creditsTimer = -1;
                    }
                }
            }
        }
        
        if (y > 800)
        {
            y = 800;
            gravity = 0;
        }
        
        collapseTimer++;
        break;
}
