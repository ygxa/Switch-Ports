function player_noise_CPUpath()
{
    direction = point_direction(x, y, o_cpu_findme_path.x, o_cpu_findme_path.y);
    
    if (distance_to_object(o_cpu_findme) < 90)
    {
        state = (1 << 0);
        CPUtimetillpath = 200;
    }
    
    switch (sprint)
    {
        case false:
            sprintstartanim = false;
            ScrPlayer_StopSprintSound();
            
            if (accel_final <= accel_max)
                accel_final += accel;
            
            if (accel_final > accel_max && place_meeting(x, y + 1, o_parentwall))
                accel_final -= (accel / 3);
            
            break;
        
        case true:
            if (hmove != 0)
            {
                if (last_h != hmove)
                {
                    last_h = hmove;
                    accel_final = 0;
                }
                
                if (accel_final <= sprint_accel_max)
                    accel_final += accel;
                
                if (accel_final > sprint_accel_max && place_meeting(x, y + 1, o_parentwall))
                    accel_final -= (accel / 3);
            }
            else if (accel_final > 0)
            {
                accel_final -= accel;
            }
            
            if (accel_final < accel)
            {
                accel_final = 0;
                last_h = 0;
            }
            
            break;
    }
    
    hsp = lengthdir_x(accel_final, direction);
    vsp += grv;
    
    if (hsp != 0)
        facing = sign(hsp);
    
    hmove = facing;
    
    if (!place_meeting(x, y + 1, o_parentwall) && o_cpu_findme_path.y < y && abletodouble == 1 && crouchanim == false && vsp == 0)
    {
        abletodouble -= 1;
        audio_play_sound(su_test_jump, 50, false);
        vsp = -7;
    }
    
    if (o_cpu_findme_path.y < y && (place_meeting(x, y + 1, ObjWall) || place_meeting(x, y + 1, o_slope) || detect == 1))
    {
        if (grounded)
        {
            instance_create_layer(x, y, "Instances", o_jumpeffect);
            audio_play_sound(su_test_jump, 50, false);
            
            if (!crouch)
                vsp = -10;
            else
                vsp = -7;
        }
    }
    
    if (detect == 1 && o_cpu_findme_path.y > y && o_cpu_findme_path.x < (x + 80) && o_cpu_findme_path.x > (x - 80))
        key_down = true;
    else
        key_down = false;
    
    player_col();
    
    if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && sprite_index == s_noise_fall)
        landanim = true;
    
    if (crouch == false)
    {
        crouchanim = false;
        
        if (place_meeting(x, y + 1, ObjWall) || detect == 1)
        {
            cpu_recovering = false;
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            landanim = false;
            
            if (landanim)
            {
                sprite_index = s_noise_land;
                
                if (floor(image_index) == (image_number - 1))
                    landanim = false;
            }
            else
            {
                image_speed = 1;
                
                if (hsp == 0)
                {
                    cpu_recovering = false;
                    justspawned = 0;
                    abletodouble = 1;
                    abletorecover = 1;
                    landanim = false;
                    sprite_index = s_noise_idle;
                }
                else
                {
                    justspawned = 0;
                    abletodouble = 1;
                    abletorecover = 1;
                    
                    if (sprint == false)
                    {
                        sprite_index = s_noise_walk;
                        
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
                            sprite_index = s_noise_dash;
                        else
                            sprite_index = s_noise_dashstart;
                        
                        if (floor(image_index) == (image_number - 1) || accel_final == sprint_accel_max)
                            sprintstartanim = true;
                        
                        if (!audio_is_playing(su_noise_dash))
                            audio_play_sound(su_noise_dash, 50, true);
                    }
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
                    sprite_index = s_noise_fall;
                }
                
                if (vsp < 0)
                {
                    sprite_index = s_noise_jump;
                    
                    if (floor(image_index) == (image_number - 1))
                    {
                        image_index = 9;
                        image_speed = 0;
                    }
                }
            }
            else
            {
                if (vsp > 0)
                {
                    image_speed = 1;
                    sprite_index = s_noise_dashfall;
                }
                
                if (vsp < 0)
                {
                    sprite_index = s_noise_dashjump;
                    
                    if (floor(image_index) == (image_number - 1))
                    {
                        image_index = 3;
                        image_speed = 0;
                    }
                }
            }
        }
    }
    else if (crouchanim == false)
    {
        sprite_index = s_noise_crawlstart;
        
        if (floor(image_index) == (image_number - 1))
            crouchanim = true;
    }
    else if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        image_speed = 1;
        
        if (hsp == 0)
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_noise_crouch;
        }
        else
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_noise_crawl;
        }
    }
    else
    {
        if (vsp > 0)
        {
            image_speed = 1;
            sprite_index = s_noise_crouchfall;
        }
        
        if (vsp < 0)
        {
            sprite_index = s_noise_crouchjump;
            
            if (floor(image_index) == (image_number - 1))
            {
                image_index = 4;
                image_speed = 0;
            }
        }
    }
    
    noisebomb--;
    
    if ((!grounded && vsp > 0 && o_cpu_findme_path.y <= (y - 95) && x <= (o_cpu_findme_path.x + 105) && x >= (o_cpu_findme_path.x - 105)) && abletorecover == 1)
        state = (11 << 0);
    
    if (hsp != 0)
        image_xscale = sign(hsp);
}
