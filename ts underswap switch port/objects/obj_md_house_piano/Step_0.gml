if (done)
{
    with (obj_harry_actor)
        y = number_approach_smooth(y, ystart + 200, 0.05, 0.5);
    
    with (obj_larry_actor)
        y = number_approach_smooth(y, ystart + 200, 0.045, 0.5);
    
    if (!fader && instance_exists(obj_fader))
    {
        fader = true;
        audio_sound_gain(sfx, 0.06, 500);
    }
    
    exit;
}

y += spd;
spd += 0.1;

if (y >= 130)
{
    y = 130;
    done = true;
    image_index = 1;
    
    repeat (20)
        instance_create_xy(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), obj_pianoparticle);
    
    sfx = sfx_play_ext(snd_copter, 0, 1.8, 10, true);
    global.soundstore = sfx;
    audio_sound_gain(sfx, 0.4, 2000);
    view_flash().useGui = true;
    
    with (obj_dodgemode_handler)
    {
        shakeValue = 4;
        alarm[0] = 1;
    }
}
