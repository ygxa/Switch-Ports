if (canmove == true)
{
    scr_getinput();
    ScrollY = lerp(ScrollY, (optionselected / 5) * -100, 0.15);
    
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
    {
        optionselected -= 1;
        scr_sound(63);
        optionsaved_fullscreen = global.fullscreen;
        optionsaved_resolution = global.selectedResolution;
        optionsaved_smoothcam = global.smoothcam;
        optionsaved_screentilt = global.screentilt;
        optionsaved_hitstun = global.hitstunEnabled;
    }
    
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 5)
    {
        optionselected += 1;
        scr_sound(63);
        optionsaved_fullscreen = global.fullscreen;
        optionsaved_resolution = global.selectedResolution;
        optionsaved_smoothcam = global.smoothcam;
        optionsaved_screentilt = global.screentilt;
        optionsaved_hitstun = global.hitstunEnabled;
    }
    
    switch (optionselected)
    {
        case 0:
            subtitle = "GO BACK TO MAIN SCREEN";
            CursorY = -999;
            
            if (key_jump)
            {
                scr_sound(42);
                instance_destroy();
            }
            
            break;
        
        case 1:
            subtitle = "TOGGLE WINDOW MODE";
            CursorY = 100;
            optionsaved_fullscreen += (key_right2 + key_left2);
            optionsaved_fullscreen = wrap(optionsaved_fullscreen, 0, 1);
            
            if (key_jump)
            {
                scr_sound(42);
                window_set_fullscreen(optionsaved_fullscreen);
                ini_open("optionData.ini");
                ini_write_real("Settings", "fullscrn", optionsaved_fullscreen);
                ini_close_fixed();
                global.fullscreen = optionsaved_fullscreen;
            }
            
            break;
        
        case 2:
            subtitle = "ADJUST WINDOWED RESOLUTION";
            CursorY = 200;
            optionsaved_resolution += (key_right2 + key_left2);
            optionsaved_resolution = wrap(optionsaved_resolution, 0, 2);
            
            if (key_jump)
            {
                scr_sound(42);
                
                switch (optionsaved_resolution)
                {
                    case 0:
                        window_set_size(480, 260);
                        break;
                    
                    case 1:
                        window_set_size(960, 540);
                        break;
                    
                    case 2:
                        window_set_size(1280, 720);
                        break;
                }
                
                ini_open("optionData.ini");
                ini_write_real("Settings", "resolution", optionsaved_resolution);
                ini_close_fixed();
                global.selectedResolution = optionsaved_resolution;
            }
            
            break;
        
        case 3:
            subtitle = "TOGGLE SMOOTHCAM";
            CursorY = 300;
            optionsaved_smoothcam += (key_right2 + key_left2);
            optionsaved_smoothcam = wrap(optionsaved_smoothcam, 0, 1);
            
            if (key_jump)
            {
                scr_sound(42);
                ini_open("optionData.ini");
                ini_write_real("Settings", "smthcam", optionsaved_smoothcam);
                ini_close_fixed();
                global.smoothcam = optionsaved_smoothcam;
            }
            
            break;
        
        case 4:
            subtitle = "TOGGLE ESCAPE SCREEN MELT EFFECTS";
            CursorY = 400;
            optionsaved_screenmelt += (key_right2 + key_left2);
            optionsaved_screenmelt = wrap(optionsaved_screenmelt, 0, 1);
            
            if (key_jump)
            {
                scr_sound(42);
                ini_open("optionData.ini");
                ini_write_real("Settings", "screenmelt", optionsaved_screenmelt);
                ini_close_fixed();
                global.screenmelt = optionsaved_screenmelt;
            }
            
            break;
        
        case 5:
            subtitle = "TOGGLE ESCAPE SCREEN TILT EFFECTS";
            CursorY = 500;
            optionsaved_screentilt += (key_right2 + key_left2);
            optionsaved_screentilt = wrap(optionsaved_screentilt, 0, 1);
            
            if (key_jump)
            {
                scr_sound(42);
                ini_open("optionData.ini");
                ini_write_real("Settings", "scrntilt", optionsaved_screentilt);
                ini_close_fixed();
                global.screentilt = optionsaved_screentilt;
            }
            
            break;
    }
    
    if (key_slap2 || key_start)
    {
        scr_sound(42);
        instance_destroy();
    }
    
    obj_Options_Main.CursorY = CursorY + ScrollY;
}
