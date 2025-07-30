bgalpha = approach(bgalpha, bgalphato, 0.1);

if (bgalpha != 1)
    return 0;

controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (vert != 0)
    audio_play_sound(su_menuscroll, 50, false);

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);
spacing = lerp(spacing, 50, 0.1);

if (keyboard_check_pressed(confirmButt) || buttonAPress)
{
    if (selected == 0)
        bgalphato = -1;
    
    if (selected == 1)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Menu, 20, 0);
    }
    
    if (selected == 2)
    {
        audio_play_sound(su_noway, 50, false);
        global.ArcadeArray = array_shuffle(global.ArcadeArray);
        
        with (obj_towerarcadeicon)
            char = global.ArcadeArray[num];
    }
}
