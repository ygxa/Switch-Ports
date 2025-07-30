function player_doise_CPUfollow()
{
    ScrCPU_FindNearestPoint();
    ScrCPU_AttackTimer();
    
    if (CPUtimetillpath > 0)
        CPUtimetillpath--;
    
    if (CPUtimetillpath == 0 && room == R_Pizzascape)
    {
        state = (29 << 0);
        ScrCPU_StartPath();
    }
    
    if (!instance_exists(o_cpu_findme.follow) && (place_meeting(x, y + 1, ObjWall) || detect == 1) && grounded == true)
        state = (12 << 0);
    
    direction = point_direction(x, y, o_cpu_findme.x, o_cpu_findme.y);
    
    if ((distance_to_object(o_cpu_findme) >= 300 && o_cpu_findme.y < (y + 100) && o_cpu_findme.y > (y - 100)) && global.CPULVL > 1)
        sprint = true;
    else
        sprint = false;
    
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
    
    if (distance_to_object(o_hurt) < 120 && !place_meeting(x, y, o_parentwall) && !grounded)
        state = (28 << 0);
    
    if (global.CPULVL == 5)
    {
        if (cputimerbaybee == 0)
        {
            var _checkforparry = irandom_range(1, 2);
            
            if (_checkforparry == 1 && instance_exists(par_projectile))
            {
                if (point_distance(x, y, par_projectile.x, par_projectile.y) < 60 && par_projectile.player != 2 && grounded)
                    state = (12 << 0);
            }
        }
    }
    
    if (!place_meeting(x, y + 1, o_parentwall) && o_cpu_findme.y < y && abletodouble == 1 && crouchanim == false && vsp == 0)
    {
        abletodouble -= 1;
        audio_play_sound(su_test_jump, 50, false);
        vsp = -7;
    }
    
    if (o_cpu_findme.y < y && (place_meeting(x, y + 1, ObjWall) || detect == 1))
    {
        if (grounded)
        {
            instance_create_layer(x, y, "part", o_jumpeffect);
            audio_play_sound(su_test_jump, 50, false);
            
            if (!crouch)
                vsp = -10;
            else
                vsp = -7;
        }
    }
    
    if (detect == 1 && o_cpu_findme.y > y && o_cpu_findme.x < (x + 80) && o_cpu_findme.x > (x - 80))
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
                        
                        if (!audio_is_playing(su_doise_dash))
                            audio_play_sound(su_doise_dash, 50, true);
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
    
    if (!cpu_recovering)
    {
        if ((!grounded && vsp > 0 && o_cpu_findme.y <= (y - 95) && x <= (o_cpu_findme.x + 105) && x >= (o_cpu_findme.x - 105)) && abletorecover == 1)
            state = (11 << 0);
        
        if ((!grounded && o_cpu_findme.y > (y + 10) && x < (o_cpu_findme.x + 32) && x > (o_cpu_findme.x - 32)) && cputimerbaybee == 0 && global.CPULVL > 1)
        {
            state = (20 << 0);
            alarm[0] = 50;
            CPUtimetillpath = 200;
        }
        
        if ((!grounded && o_cpu_findme.y < (y - 20) && o_cpu_findme.y > (y - 50) && x < (o_cpu_findme.x + 20) && x > (o_cpu_findme.x - 20)) && cputimerbaybee == 0 && global.CPULVL > 3)
        {
            state = (8 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 60 && vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && grounded && cputimerbaybee == 0)
        {
            CPUtimetillpath = 200;
            var attack = irandom_range(1, 2);
            
            if (attack == 1)
                state = (6 << 0);
            else if (attack == 2)
                state = (5 << 0);
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 100 && y > (o_cpu_findme.y - 12) && y < (o_cpu_findme.y + 12) && !grounded && global.CPULVL > 2 && cputimerbaybee == 0)
        {
            state = (7 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 80 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 100 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && vsp == 0 && y > (o_cpu_findme.y - 12) && y < (o_cpu_findme.y + 12) && grounded && cputimerbaybee == 0 && !instance_exists(o_player_noise_explosion))
        {
            state = (3 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 400 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 140 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && vsp == 0 && y > (o_cpu_findme.y - 20) && y < (o_cpu_findme.y + 12) && grounded && cputimerbaybee == 0 && noisebomb < 1 && global.CPULVL > 3)
        {
            state = (10 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 200 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 60 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && vsp == 0 && y > (o_cpu_findme.y - 50) && y < (o_cpu_findme.y + 12) && grounded && cputimerbaybee == 0 && noisebomb < 1 && global.CPULVL == 5)
        {
            CPUtimetillpath = 200;
            state = (9 << 0);
        }
    }
    
    if (hsp != 0)
        image_xscale = sign(hsp);
}
