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
    confirm();

if (selected == 0)
    s_cursor = s_mnu_singleplayer;

if (selected == 1)
    s_cursor = s_mnu_multiplayer;

if (selected == 2)
    s_cursor = s_mnu_arcade;

if (selected == 3)
    s_cursor = s_mnu_options;

if (selected == 4)
    s_cursor = s_mnu_exit;
