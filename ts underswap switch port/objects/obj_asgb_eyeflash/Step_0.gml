if (delay == step)
{
    visible = true;
    image_speed = 1;
    sfx_play_pitch(snd_eyeflash, pitch, 80, false);
}

step++;
