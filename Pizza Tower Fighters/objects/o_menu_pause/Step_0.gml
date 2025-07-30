controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);
var leave = keyboard_check_pressed(leaveButt);

if (vert != 0)
    audio_play_sound(su_menuscroll, 50, false);

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);

if (keyboard_check_pressed(confirmButt) || buttonAPress)
{
    if (selected == 0)
    {
        O_Pause.PAUSE = false;
        audio_resume_all();
        instance_activate_all();
        instance_destroy(o_menu_pause);
    }
    
    if (selected == 1 || leave)
    {
        instance_destroy(o_menu_pause);
        audio_resume_all();
        instance_activate_all();
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Menu, 20, 0);
        
        global.P2Cpu = false;
        instance_destroy(o_demrec);
    }
}

if (selected == 0)
    s_cursor = s_mnu_multiplayer;

if (selected == 1)
    s_cursor = s_mnu_exit;
