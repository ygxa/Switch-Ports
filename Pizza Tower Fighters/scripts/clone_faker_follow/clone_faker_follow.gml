function clone_faker_follow()
{
    if (instance_exists(player_marker))
    {
        direction = point_direction(x, y, player_marker.x, player_marker.y + player_marker.yoffset);
        
        if (accel_final <= accel_max)
            accel_final += accel;
        
        if (accel_final > accel_max && place_meeting(x, y + 1, o_parentwall))
            accel_final -= (accel / 3);
        
        hsp = lengthdir_x(accel_final, direction);
        vsp += grv;
        
        if (hsp != 0)
            facing = sign(hsp);
        
        if (!place_meeting(x, y + 1, o_parentwall) && player_marker.y < (y - 100) && abletodouble == 1 && crouchanim == false && vsp == 0)
        {
            abletodouble -= 1;
            audio_play_sound(su_test_jump, 50, false);
            vsp = -7;
        }
        
        if (instance_exists(player_marker))
        {
            if (detect == 1 && player_marker.y > y && player_marker.x < (x + 80) && player_marker.x > (x - 80))
                key_down = true;
            else
                key_down = false;
        }
        
        player_col();
        
        if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && sprite_index == s_fakepep_fall)
            landanim = true;
        
        if (crouch == false)
        {
            crouchanim = false;
            
            if (place_meeting(x, y + 1, ObjWall) || detect == 1)
            {
                justspawned = 0;
                blastdamaged = 0;
                abletodouble = 1;
                abletorecover = 1;
                cpu_recovering = false;
                
                if (landanim)
                {
                    sprite_index = s_fakepep_land;
                    
                    if (floor(image_index) == (image_number - 1))
                        landanim = false;
                }
                else
                {
                    mask_index = s_fakepep_idle;
                    image_speed = 1;
                    
                    if (hsp == 0)
                    {
                        sprite_index = s_fakepep_idle;
                    }
                    else if (sprint == false)
                    {
                        sprite_index = s_fakepep_walk;
                        
                        if (punchcooldown > 0)
                        {
                            punchcooldown--;
                        }
                        else
                        {
                            instance_create_layer(x, y + 30, layer, o_cloudeffect);
                            punchcooldown = image_number - 1;
                        }
                    }
                    else
                    {
                        if (sprintstartanim == true)
                            sprite_index = s_fakepep_dash;
                        else
                            sprite_index = s_fakepep_dash;
                        
                        if (floor(image_index) == (image_number - 1) || accel_final == sprint_accel_max)
                            sprintstartanim = true;
                        
                        if (!audio_is_playing(su_fakepep_mach))
                            audio_play_sound(su_fakepep_mach, 50, true);
                    }
                }
            }
            else
            {
                ScrPlayer_StopSprintSound();
                
                if (sprint == false)
                {
                    if (vsp > 0)
                    {
                        image_speed = 1;
                        sprite_index = s_fakepep_fall;
                    }
                    
                    if (vsp < 0)
                    {
                        sprite_index = s_fakepep_jump;
                        
                        if (floor(image_index) == (image_number - 1))
                        {
                            image_index = 10;
                            image_speed = 0;
                        }
                    }
                }
                else
                {
                    if (vsp > 0)
                    {
                        image_speed = 1;
                        sprite_index = s_fakepep_dash;
                    }
                    
                    if (vsp < 0)
                    {
                        sprite_index = s_fakepep_dash;
                        
                        if (floor(image_index) == (image_number - 1))
                        {
                            image_index = 8;
                            image_speed = 0;
                        }
                    }
                }
            }
        }
        else if (crouchanim == false)
        {
            sprite_index = s_fakepep_crouchstart;
            
            if (floor(image_index) == (image_number - 1))
                crouchanim = true;
        }
        else if (place_meeting(x, y + 1, ObjWall) || detect == 1)
        {
            mask_index = s_fakepep_crouch;
            image_speed = 1;
            
            if (hsp == 0)
            {
                justspawned = 0;
                abletodouble = 1;
                abletorecover = 1;
                sprite_index = s_fakepep_crouch;
            }
            else
            {
                justspawned = 0;
                abletodouble = 1;
                abletorecover = 1;
                sprite_index = s_fakepep_crawl;
            }
        }
        else
        {
            if (vsp > 0)
            {
                image_speed = 1;
                sprite_index = s_fakepep_crouchfall;
            }
            
            if (vsp < 0)
            {
                sprite_index = s_fakepep_crouchjump;
                
                if (floor(image_index) == (image_number - 1))
                {
                    image_index = 8;
                    image_speed = 0;
                }
            }
        }
        
        if (hsp != 0)
            image_xscale = sign(hsp);
        
        if (point_distance(x, y, player_marker.x, player_marker.y) < 80 && vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && grounded)
            state = (2 << 0);
    }
}
