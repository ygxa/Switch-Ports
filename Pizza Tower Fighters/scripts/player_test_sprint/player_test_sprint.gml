function player_test_sprint()
{
    if (punchcooldown > 0)
    {
        punchcooldown--;
    }
    else
    {
        with (instance_create_depth(x, y, depth + 1, o_machafterimage))
        {
            sprite_index = other.sprite_index;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
        }
        
        punchcooldown = 6;
    }
    
    var hmove = key_right - key_left;
    
    if (hmove != 0)
    {
        if (last_h != hmove)
        {
            last_h = hmove;
            accel_final = 0;
            
            if (!grounded)
                sprintcurrent = last_h;
        }
        
        if (accel_final <= sprint_accel_max)
            accel_final += accel;
        
        if (accel_final > sprint_accel_max)
            accel_final -= accel;
    }
    
    if (last_h != sprintcurrent && grounded && hmove != 0)
    {
        state = (19 << 0);
        sprintstopping = 5;
    }
    
    hsp = accel_final * last_h;
    vsp += grv;
    
    if (hsp != 0)
        facing = sign(hsp);
    
    player_col();
    
    if (key_jump && (place_meeting(x, y + 1, ObjWall) || place_meeting(x, y + 1, o_slope) || detect == 1))
    {
        instance_create_layer(x, y, "part", o_jumpeffect);
        audio_play_sound(su_test_jump, 50, false);
        vsp = -10;
    }
    
    if (!place_meeting(x, y + 1, o_parentwall) && key_jump && abletodouble == 1 && crouchanim == false)
    {
        abletodouble -= 1;
        audio_play_sound(su_test_jump, 50, false);
        vsp = -7;
    }
    
    if (place_meeting(x, y + 1, ObjWall) || detect == 1)
    {
        justspawned = 0;
        blastdamaged = 0;
        abletodouble = 1;
        abletorecover = 1;
        
        if (sprintstartanim == true)
            sprite_index = s_test_dash;
        else
            sprite_index = s_test_dashstart;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprintstartanim = true;
            
            with (instance_create_layer(x, y, "part", o_dasheffect))
                image_xscale = other.facing;
        }
        
        if (!audio_is_playing(su_pep_dash))
            audio_play_sound(su_pep_dash, 50, true);
    }
    else
    {
        ScrPlayer_StopSprintSound();
        
        if (vsp > 0)
        {
            image_speed = 1;
            sprite_index = s_test_dashfall;
        }
        
        if (vsp < 0)
        {
            sprite_index = s_test_dashjump;
            
            if (floor(image_index) == (image_number - 1))
            {
                image_index = 8;
                image_speed = 0;
            }
        }
    }
    
    if ((hmove == 0 || key_down) && grounded)
    {
        sprintstopping--;
        
        if (sprintstopping < 1)
        {
            if (key_down)
                crouch = true;
            
            state = (0 << 0);
            sprint = false;
        }
    }
    
    if (hsp != 0)
        image_xscale = sign(hsp);
    
    if ((key_E && key_down) || rightstickDownPressed)
    {
        if (vsp != 0)
            state = (4 << 0);
    }
    
    if ((key_E || rightstickLeftPressed || rightstickRightPressed) && vsp != 0 && abletorecover == 1 && !key_down)
        state = (7 << 0);
    
    if ((key_E && key_up) || rightstickUpPressed)
    {
        if (vsp != 0)
            state = (8 << 0);
    }
    
    if (key_E && sprint == true)
    {
        if (vsp == 0 && (place_meeting(x, y + 1, ObjWall) || detect == 1) && sprintstartanim == true)
            state = (14 << 0);
    }
    
    if (key_Q && key_down)
    {
        state = (18 << 0);
        doublekey = 0;
        sprint = false;
        ScrPlayer_StopSprintSound();
    }
    
    if (key_Q && !key_down)
    {
        state = (10 << 0);
        doublekey = 0;
        sprint = false;
        ScrPlayer_StopSprintSound();
    }
    
    if (key_Q && key_up)
    {
        state = (11 << 0);
        doublekey = 0;
        sprint = false;
        ScrPlayer_StopSprintSound();
    }
}
