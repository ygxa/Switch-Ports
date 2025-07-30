if (timebeforestartcrumble == 10 && !audio_is_playing(su_towerexplosion))
    audio_play_sound(su_towerexplosion, 50, false);

if (timebeforestartcrumble == 2 && !audio_is_playing(su_towerexplosion))
    audio_play_sound(su_towerexplosion, 50, false);

if (timebeforestartcrumble != 0)
{
    timebeforestartcrumble--;
}
else if (y < ystart)
{
    if (dusttimer > 0)
    {
        dusttimer--;
    }
    else
    {
        dusttimer = 12;
        
        with (instance_create_layer(x + irandom_range(-50, 50), y + irandom_range(-50, 50), "layer2", o_fireflameffect))
            sprite_index = s_tower_destructiondust;
    }
    
    y += yspeed;
    time += hoverSpeed;
    var sine_value = sin(time);
    x = (original_x - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);
}
else
{
    audio_stop_sound(su_towercrumble);
    audio_play_sound(su_towercrumble_end, 50, false);
    fadeToRoom(R_ArcadeScore, 20, 0);
    instance_destroy();
}
