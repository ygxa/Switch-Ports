function player_vigi_CPUfollow()
{
    if (CPUtimetillpath > 0)
        CPUtimetillpath--;
    
    if (CPUtimetillpath < 1 && room == R_Pizzascape)
    {
        state = (23 << 0);
        ScrCPU_StartPath();
    }
    
    ScrCPU_FindNearestPoint();
    ScrCPU_AttackTimer();
    
    if (!instance_exists(o_cpu_findme.follow) && grounded)
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
    
    if (distance_to_object(o_hurt) < 90 && !place_meeting(x, y, o_parentwall) && !grounded)
        state = (18 << 0);
    
    if (global.CPULVL == 5)
    {
        if (cputimerbaybee == 0)
        {
            var _checkforparry = irandom_range(1, 2);
            
            if (instance_exists(par_projectile))
            {
                if (point_distance(x, y, par_projectile.x, par_projectile.y) < 80 && par_projectile.player != 2)
                    state = (9 << 0);
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
    
    if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && sprite_index == s_vigilante_fall)
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
                sprite_index = s_vigilante_land;
                
                if (floor(image_index) == (image_number - 1))
                    landanim = false;
            }
            else
            {
                mask_index = s_vigilante_idle;
                image_speed = 1;
                
                if (hsp == 0)
                {
                    sprite_index = s_vigilante_idle;
                }
                else if (sprint == false)
                {
                    sprite_index = s_vigilante_walk;
                    
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
                        sprite_index = s_vigilante_dash;
                    else
                        sprite_index = s_vigilante_dashstart;
                    
                    if (floor(image_index) == (image_number - 1) || accel_final == sprint_accel_max)
                        sprintstartanim = true;
                    
                    if (!audio_is_playing(su_vigi_dash))
                        audio_play_sound(su_vigi_dash, 50, true);
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
                    sprite_index = s_vigilante_fall;
                }
                
                if (vsp < 0)
                {
                    sprite_index = s_vigilante_jump;
                    
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
                    sprite_index = s_vigilante_dashfall;
                }
                
                if (vsp < 0)
                {
                    sprite_index = s_vigilante_dashjump;
                    
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
        sprite_index = s_vigilante_crawlstart;
        
        if (floor(image_index) == (image_number - 1))
            crouchanim = true;
    }
    else if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        mask_index = s_vigilante_crouch;
        image_speed = 1;
        
        if (hsp == 0)
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_vigilante_crouch;
        }
        else
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_vigilante_crawl;
        }
    }
    else
    {
        if (vsp > 0)
        {
            image_speed = 1;
            sprite_index = s_vigilante_crouchfall;
        }
        
        if (vsp < 0)
        {
            sprite_index = s_vigilante_crouchjump;
            
            if (floor(image_index) == (image_number - 1))
            {
                image_index = 8;
                image_speed = 0;
            }
        }
    }
    
    bullet_time--;
    
    if (!cpu_recovering)
    {
        if ((!grounded && vsp > 0 && o_cpu_findme.y <= (y - 95) && x <= (o_cpu_findme.x + 105) && x >= (o_cpu_findme.x - 105)) && abletorecover == 1)
            state = (11 << 0);
        
        if ((!grounded && o_cpu_findme.y > (y + 10) && x < (o_cpu_findme.x + 32) && x > (o_cpu_findme.x - 32)) && cputimerbaybee == 0 && global.CPULVL > 1)
        {
            state = (4 << 0);
            CPUtimetillpath = 200;
        }
        
        if ((!grounded && o_cpu_findme.y < (y - 20) && o_cpu_findme.y > (y - 50) && x < (o_cpu_findme.x + 20) && x > (o_cpu_findme.x - 20)) && cputimerbaybee == 0 && global.CPULVL > 3)
        {
            state = (8 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 50 && vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && grounded && cputimerbaybee == 0)
        {
            state = (6 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 100 && y > (o_cpu_findme.y - 12) && y < (o_cpu_findme.y + 12) && !grounded && global.CPULVL > 2 && cputimerbaybee == 0 && abletorecover != 0)
        {
            state = (7 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 70 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && vsp == 0 && y > (o_cpu_findme.y - 12) && y < (o_cpu_findme.y + 12) && grounded && cputimerbaybee == 0)
        {
            state = (3 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 200 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 100 && o_cpu_findme.y < (y + 20) && o_cpu_findme.y > (y - 20) && cputimerbaybee == 0 && bullet_time < 1 && global.CPULVL > 3)
        {
            state = (10 << 0);
            bullet_time = 30;
            noisebomb = 0;
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 200 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 100 && o_cpu_findme.y < (y + 20) && o_cpu_findme.y > (y - 20) && cputimerbaybee == 0 && global.CPULVL > 3 && damagemeter == damagemetermax)
        {
            state = (21 << 0);
            CPUtimetillpath = 200;
        }
        
        if (point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) < 110 && point_distance(x, y, o_cpu_findme.x, o_cpu_findme.y) > 80 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && vsp == 0 && y > (o_cpu_findme.y - 12) && y < (o_cpu_findme.y + 12) && grounded && cputimerbaybee == 0)
        {
            state = (5 << 0);
            CPUtimetillpath = 200;
        }
    }
    
    if (hsp != 0)
        image_xscale = sign(hsp);
}
