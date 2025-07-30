function player_test_idle()
{
    if (!instance_exists(O_Text))
    {
        var hmove = key_right - key_left;
        
        switch (sprint)
        {
            case false:
                sprintstartanim = false;
                ScrPlayer_StopSprintSound();
                
                if (hmove != 0)
                {
                    if (last_h != hmove)
                    {
                        last_h = hmove;
                        accel_final = 0;
                    }
                    
                    if (accel_final <= accel_max)
                        accel_final += accel;
                    
                    if (accel_final > accel_max && place_meeting(x, y + 1, o_parentwall))
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
            
            case true:
                state = (20 << 0);
                break;
        }
        
        if (key_double_pressed && doublekey < 1)
        {
            doublekey = 1;
            doublekey_t = doublekey_t_max;
        }
        
        if (doublekey > 0 && doublekey_t > 0)
        {
            doublekey_t--;
            
            if (key_double_pressed && doublekey_t < (doublekey_t_max - 3))
            {
                doublekey = 2;
                sprintcurrent = last_h;
            }
        }
        
        if (doublekey == 2 && crouch != true && grounded)
            sprint = true;
        else
            sprint = false;
        
        if (hmove == 0 && doublekey_t == 0)
            doublekey = 0;
    }
    
    if (crouchanim != true)
        hsp = accel_final * last_h;
    
    if (crouchanim == true)
        hsp = (accel_final / 2) * last_h;
    
    vsp += grv;
    
    if (hsp != 0)
        facing = sign(hsp);
    
    if (!instance_exists(O_Text))
    {
        if (key_jump && (place_meeting(x, y + 1, ObjWall) || place_meeting(x, y + 1, o_slope) || detect == 1))
        {
            instance_create_layer(x, y, "part", o_jumpeffect);
            audio_play_sound(su_test_jump, 50, false);
            
            if (!crouch)
                vsp = -10;
            else
                vsp = -7;
        }
        
        if (!place_meeting(x, y + 1, ObjWall) && detect == 0 && key_jump && abletodouble > 0 && crouchanim == false)
        {
            abletodouble -= 1;
            audio_play_sound(su_test_jump, 50, false);
            vsp = -7;
        }
    }
    
    player_col();
    
    if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && sprite_index == s_test_fall)
        landanim = true;
    
    if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && key_down && sprint == false && landanim == false)
        crouch = true;
    
    if ((place_meeting(x, y + 1, ObjWall) || detect == 1) && !key_down)
        crouch = false;
    
    if (crouch == false)
    {
        crouchanim = false;
        
        if (place_meeting(x, y + 1, ObjWall) || detect == 1)
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            blastdamaged = 0;
            
            if (landanim)
            {
                sprite_index = s_test_land;
                
                if (floor(image_index) == (image_number - 1))
                    landanim = false;
            }
            else
            {
                mask_index = s_test_idl;
                image_speed = 1;
                
                if (hsp == 0)
                {
                    justspawned = 0;
                    blastdamaged = 0;
                    abletodouble = 1;
                    abletorecover = 1;
                    sprite_index = s_test_idl;
                }
                else
                {
                    justspawned = 0;
                    blastdamaged = 0;
                    abletodouble = 1;
                    abletorecover = 1;
                    sprite_index = s_test_walk;
                    
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
                    sprite_index = s_test_fall;
                }
                
                if (vsp < 0)
                {
                    sprite_index = s_test_jump;
                    
                    if (floor(image_index) == (image_number - 1))
                    {
                        image_index = 10;
                        image_speed = 0;
                    }
                }
            }
        }
    }
    else if (crouchanim == false)
    {
        sprite_index = s_test_crouchstart;
        
        if (floor(image_index) == (image_number - 1))
            crouchanim = true;
    }
    else if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        mask_index = s_test_crouch;
        image_speed = 1;
        
        if (hsp == 0)
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_test_crouch;
        }
        else
        {
            justspawned = 0;
            abletodouble = 1;
            abletorecover = 1;
            sprite_index = s_test_crawl;
        }
    }
    else
    {
        if (vsp > 0)
        {
            image_speed = 1;
            sprite_index = s_test_crouchfall;
        }
        
        if (vsp < 0)
        {
            sprite_index = s_test_crouchjump;
            
            if (floor(image_index) == (image_number - 1))
            {
                image_index = 8;
                image_speed = 0;
            }
        }
    }
    
    if (hsp != 0)
        image_xscale = sign(hsp);
    
    if (key_E || key_Q)
        landanim = false;
    
    if (!instance_exists(O_Text))
    {
        if (sprint == false)
        {
            if ((key_E || rightstickLeftPressed || rightstickRightPressed) && vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1))
                state = (3 << 0);
            
            if (key_taunt && vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1))
                state = (12 << 0);
            
            if ((key_E && key_down) || rightstickDownPressed)
            {
                if (vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1))
                    state = (6 << 0);
            }
            
            if ((key_E && key_up) || rightstickUpPressed)
            {
                if (vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1))
                    state = (5 << 0);
            }
        }
        
        if ((key_E && key_down) || rightstickDownPressed)
        {
            if (vsp != 0)
                state = (4 << 0);
        }
        
        if ((key_E || rightstickLeftPressed || rightstickRightPressed) && vsp != 0 && !key_down)
            state = (7 << 0);
        
        if ((key_E && key_up) || rightstickUpPressed)
        {
            if (vsp != 0)
                state = (8 << 0);
        }
        
        if (key_E && sprint == true)
        {
            if (vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1))
                state = (14 << 0);
        }
        
        if (key_Q && key_down)
        {
            state = (18 << 0);
            doublekey = 0;
            sprint = false;
            ScrPlayer_StopSprintSound();
        }
        
        if (key_Q && !key_down && damagemeter != damagemetermax)
        {
            state = (10 << 0);
            doublekey = 0;
            sprint = false;
            ScrPlayer_StopSprintSound();
        }
        
        if (key_Q && !key_down && damagemeter == damagemetermax)
        {
            state = (23 << 0);
            doublekey = 0;
            sprint = false;
            ScrPlayer_StopSprintSound();
        }
        
        if (key_Q && key_up && abletorecover == 1)
        {
            state = (11 << 0);
            doublekey = 0;
            sprint = false;
            ScrPlayer_StopSprintSound();
        }
    }
}
