controller_initialize(global.P1controllerport);
ScrPlayer1Input();
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (!instance_exists(O_Fade))
{
    if (vert != 0)
        audio_play_sound(su_menuscroll, 50, false);
}

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);
var leave = keyboard_check_pressed(leaveButt);

if (!instance_exists(O_Fade) && (keyboard_check_pressed(confirmButt) || buttonAPress))
    ds_list_find_value(funclist, selected)();

if (leave && !instance_exists(O_Fade))
{
    audio_play_sound(su_select, 50, false);
    instance_create_layer(x, y, layer, o_menu_options);
    instance_destroy();
}
