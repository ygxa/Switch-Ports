fade_alpha = 1;
fade_speed = 0.01;
xscale = 0;
yscale = 0;
playerwon = "PLAYER 1";
gotonext = 1;
stop = 0;
audio_play_sound(su_an_finish, 1, false);

with (obj_savesystem)
{
    dirty = true;
    savematch = true;
}

alarm[1] = 380;
alarm[0] = 470;
