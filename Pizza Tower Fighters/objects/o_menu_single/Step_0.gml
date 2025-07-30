controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
spacing = lerp(spacing, 50, 0.1);
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);
var leave = keyboard_check_pressed(leaveButt);

if (vert != 0)
    audio_play_sound(su_menuscroll, 50, false);

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);

if (keyboard_check_pressed(confirmButt) || buttonAPress)
    confirm();

if (leave)
{
    audio_play_sound(su_select, 50, false);
    
    if (!instance_exists(O_Fade))
        fadeToRoom(R_Menu, 20, 0);
}
