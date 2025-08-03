if (!state)
{
    if (image_index == 4)
    {
        image_speed = 0;
        state = 1;
        sfx_play(snd_alert);
        flashCount = 1;
        alarm[0] = 5;
    }
    
    if (image_alpha < 1)
        image_alpha += 0.05;
}
