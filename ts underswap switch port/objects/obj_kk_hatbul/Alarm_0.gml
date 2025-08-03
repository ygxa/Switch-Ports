shaking = false;

if (sfx != -1)
{
    audio_sound_gain(sfx, 0, 800);
    audio_sound_pitch(sfx, 1.4);
    alarm[1] = 30;
}

if (y > 320)
{
    sprite_index = spr_rockethat_l;
    vspeed = -8;
}
else
{
    sprite_index = spr_rockethat_r;
    vspeed = 8;
}

sfx_play(snd_throw);
