if (spriter == 1)
{
    if (sprite_index != s_respawner)
    {
        sprite_index = s_respawner;
        audio_play_sound(su_respawner, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
        spriter = 0;
}

if (spriter == 0)
    sprite_index = s_respawner_notalive;
