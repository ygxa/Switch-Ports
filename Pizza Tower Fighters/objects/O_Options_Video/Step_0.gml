controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (!instance_exists(O_Fade))
{
    if (vert != 0)
        audio_play_sound(su_menuscroll, 50, false);
}

var leave = keyboard_check_pressed(leaveButt);
selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);

if (!instance_exists(O_Fade))
{
    if (keyboard_check_pressed(confirmButt) || buttonAPress)
    {
        if (selected == 0)
        {
            if (menu[0] == "GUI: [spr_checkmark,0]")
            {
                global.GUIon = 1;
                menu[0] = "GUI: [spr_checkmark,1]";
                audio_play_sound(su_select, 50, false);
            }
            else
            {
                global.GUIon = 0;
                menu[0] = "GUI: [spr_checkmark,0]";
                audio_play_sound(su_select, 50, false);
            }
        }
        
        if (selected == 1)
        {
            if (menu[1] == "VSYNC: [spr_checkmark,0]")
            {
                global.VSyncon = 1;
                display_reset(global.AntiA, global.VSyncon);
                menu[1] = "VSYNC: [spr_checkmark,1]";
                audio_play_sound(su_select, 50, false);
            }
            else
            {
                global.VSyncon = 0;
                display_reset(global.AntiA, global.VSyncon);
                menu[1] = "VSYNC: [spr_checkmark,0]";
                audio_play_sound(su_select, 50, false);
            }
        }
        
        if (selected == 2)
        {
            if (menu[2] == "FULLSCREEN: [spr_checkmark,0]")
            {
                global.fullscreen = true;
                window_set_fullscreen(global.fullscreen);
                menu[2] = "FULLSCREEN: [spr_checkmark,1]";
                audio_play_sound(su_select, 50, false);
            }
            else
            {
                global.fullscreen = false;
                window_set_fullscreen(false);
                menu[2] = "FULLSCREEN: [spr_checkmark,0]";
                audio_play_sound(su_select, 50, false);
            }
        }
        
        if (selected == 3)
        {
            if (menu[3] == "ANTI ALIASING: [spr_checkmark,0]")
            {
                global.AntiA = 8;
                display_reset(global.AntiA, global.VSyncon);
                menu[3] = "ANTI ALIASING: [spr_checkmark,1]";
                audio_play_sound(su_select, 50, false);
            }
            else
            {
                global.AntiA = 0;
                display_reset(global.AntiA, global.VSyncon);
                menu[3] = "ANTI ALIASING: [spr_checkmark,0]";
                audio_play_sound(su_select, 50, false);
            }
        }
        
        if (selected == 4)
        {
            if (menu[4] == "MINIMAL GUI: [spr_checkmark,0]")
            {
                global.mGUI = true;
                menu[4] = "MINIMAL GUI: [spr_checkmark,1]";
                audio_play_sound(su_select, 50, false);
            }
            else
            {
                global.mGUI = false;
                menu[4] = "MINIMAL GUI: [spr_checkmark,0]";
                audio_play_sound(su_select, 50, false);
            }
        }
        
        if (selected == 6 || (leave && !instance_exists(O_Fade)))
        {
            audio_play_sound(su_select, 50, false);
            instance_create_depth(x, y, depth, o_menu_options);
            instance_destroy();
        }
    }
}

if (leave && !instance_exists(O_Fade))
{
    audio_play_sound(su_select, 50, false);
    instance_create_depth(x, y, depth, o_menu_options);
    instance_destroy();
}

if (selected == 5)
{
    if (keyboard_check_pressed(leftButt) || stickLeftPressed || dpadLeftPress)
    {
        global.shaker--;
        
        if (global.shaker < 0)
            global.shaker = 0;
        
        audio_play_sound(su_select, 50, false);
        menu[5] = "SHAKE INTENSITY: " + string(global.shaker) + "X";
    }
    
    if (keyboard_check_pressed(rightButt) || stickRightPressed || dpadRightPress)
    {
        global.shaker++;
        
        if (global.shaker > 10)
            global.shaker = 10;
        
        audio_play_sound(su_select, 50, false);
        menu[5] = "SHAKE INTENSITY: " + string(global.shaker) + "X";
    }
}
