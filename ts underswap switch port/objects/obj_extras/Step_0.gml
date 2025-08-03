if (confirmBuffer > 0)
    confirmBuffer--;

if (cancelBuffer > 0)
    cancelBuffer--;

if (cancelBuffer == 0)
{
    if (global.control_cancel_pressed)
    {
        cancelPressed = true;
        cancelBuffer = 3;
        confirmBuffer = 3;
    }
    else
    {
        cancelPressed = false;
    }
}
else
{
    cancelPressed = false;
}

if (confirmBuffer == 0)
{
    if (global.control_confirm_pressed)
    {
        confirmPressed = true;
        confirmBuffer = 3;
        cancelBuffer = 3;
    }
    else
    {
        confirmPressed = false;
    }
}
else
{
    confirmPressed = false;
}

switch (menu)
{
    case (0 << 0):
        alpha += 0.025;
        
        if (alpha >= 1)
        {
            alpha = 1;
            menu = (2 << 0);
            var song;
            
            switch (weather)
            {
                case 0:
                    song = "extras_winter";
                    break;
                
                case 2:
                    song = "extras_summer";
                    break;
                
                default:
                    song = "extras";
                    break;
            }
            
            music_lcplay(song, true);
            sel = 0;
            optionMenus[0].build(self);
        }
        
        break;
    
    case (1 << 0):
        alpha -= 0.05;
        
        if (alpha <= -1)
        {
            audio_kill_all();
            
            if (file_exists(_string("file{0}", global.save_variant)))
                room_goto(rm_load);
            else
                room_goto(rm_menu_start);
        }
        
        break;
    
    case (2 << 0):
        var preSel = sel;
        
        if (global.control_left_pressed)
            sel = number_sub_wrap(sel, array_length(optionMenus) - 1);
        
        if (global.control_right_pressed)
            sel = number_add_wrap(sel, array_length(optionMenus) - 1);
        
        if (preSel != sel)
            optionMenus[sel].build(self);
        
        if (cancelPressed)
        {
            music_gain(0, 1000);
            menu = (1 << 0);
            sel = -1;
            break;
        }
        
        if (confirmPressed)
        {
            menu = (3 << 0);
            currentOptionMenu = sel;
            sel = 0;
        }
        
        break;
    
    case (3 << 0):
        if (fading == 2)
        {
            alpha -= 0.1;
            
            if (alpha <= 0)
            {
                alpha = 0;
                fading = 3;
                var cb = fadeOutCallback;
                fadeOutCallback = undefined;
                cb();
            }
            
            break;
        }
        
        if (fading == 1)
        {
            alpha += 0.1;
            
            if (alpha >= 1)
            {
                alpha = 1;
                fading = 3;
            }
            
            break;
        }
        
        optionMenus[currentOptionMenu].update(self);
        break;
    
    case (5 << 0):
        var gjExists = instance_exists(obj_gamejolt);
        
        if (gjExists)
        {
            if (obj_gamejolt.fileDownload == (0 << 0))
            {
                if (global.control_down_pressed)
                    sel = number_add_wrap(sel, 1);
                
                if (global.control_up_pressed)
                    sel = number_sub_wrap(sel, 1);
            }
            else if (obj_gamejolt.fileDownload != (1 << 0))
            {
                if (gjTimer == -1)
                {
                    if (obj_gamejolt.fileDownload == (2 << 0) && obj_gamejolt.trophyLoad != (1 << 0))
                        gj_trophies_load(global.gj_username, global.gj_token);
                    
                    gjTimer = 60;
                }
                else if (gjTimer == -2)
                {
                    if (global.control_up_pressed || global.control_down_pressed || confirmPressed || cancelPressed)
                    {
                        obj_gamejolt.fileDownload = (0 << 0);
                        gjTimer = -1;
                        exit;
                    }
                }
                else if (--gjTimer <= 0)
                {
                    gjTimer = -2;
                }
            }
        }
        else
        {
            global.gj_username = "";
            global.gj_token = "";
            gamejoltActive = false;
            menu = (3 << 0);
            sel = 0;
            break;
        }
        
        if (cancelPressed)
        {
            obj_gamejolt.fileDownload = (0 << 0);
            menu = (3 << 0);
            sel = 0;
            break;
        }
        
        if (confirmPressed)
        {
            switch (sel)
            {
                case 0:
                    if (gjExists && !obj_gamejolt.sessionClosing)
                    {
                        gj_erase_credentials();
                        obj_gamejolt.sessionClosing = true;
                        gj_session_close(global.gj_username, global.gj_token);
                        obj_gamejolt.openedSession = false;
                        obj_gamejolt.session = (0 << 0);
                    }
                    
                    break;
                
                case 1:
                    if (obj_gamejolt.fileDownload == (0 << 0) && obj_gamejolt.session == (2 << 0))
                    {
                        menu = (6 << 0);
                        sel = 0;
                    }
                    
                    break;
            }
        }
        
        break;
    
    case (6 << 0):
        if (global.control_left_pressed || global.control_right_pressed)
            sel = !sel;
        
        if (confirmPressed)
        {
            if (sel == 0)
            {
                instance_destroy(obj_speedrun);
                gj_state_download(global.gj_username, global.gj_token);
            }
            
            menu = (5 << 0);
            sel = 1;
        }
        else if (cancelPressed)
        {
            menu = (5 << 0);
            sel = 1;
        }
        
        break;
    
    case (4 << 0):
        if (!instance_exists(obj_gamejolt_login))
        {
            fading = 1;
            gamejoltActive = instance_exists(obj_gamejolt);
            menu = (3 << 0);
            sel = 0;
        }
        
        break;
    
    case (7 << 0):
        var areaData = global.trophy_areas[trophyArea];
        trophyY = number_approach_smooth(trophyY, max(sel * -88, (areaData.trophyNum - 3) * -88), 0.5, 0.5);
        
        if (global.control_up_pressed)
            sel = number_sub_wrap(sel, areaData.trophyNum - 1);
        
        if (global.control_down_pressed)
            sel = number_add_wrap(sel, areaData.trophyNum - 1);
        
        if (cancelPressed)
        {
            menu = (3 << 0);
            sel = trophyArea;
        }
        
        break;
}
