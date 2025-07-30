controller_initialize(global.P1controllerport);

if ((keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.P1controllerport, gp_face1) || mouse_check_button_pressed(mb_left)) && started == false)
{
    started = true;
    audio_play_sound(su_dading, 50, false);
    audio_stop_sound(mu_title);
}

global.developer = true;

if (keyboard_check_pressed(ord("L")))
    audio_stop_sound(mu_title);

if (started)
{
    timer--;
    image_speed = 10;
}

if (timer <= 0 && !instance_exists(O_Fade))
{
    fadeToRoom(R_Menu, 20, 16777215);
    audio_stop_sound(mu_title);
}

if (!audio_is_playing(mu_title) && !instance_exists(o_secretfade) && !instance_exists(obj_video) && !started)
    instance_create_depth(x, y, depth + 1, o_secretfade);

with (o_secretfade)
{
    if (fadein && alpha < 1 && !instance_exists(obj_video))
        instance_create_depth(0, 0, depth, obj_video);
}
