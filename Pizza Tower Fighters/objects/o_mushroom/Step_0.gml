if (mush == 0)
    sprite_index = s_mushroom;

if (mush == 1)
{
    if (sprite_index != s_mushroom_bounce)
    {
        image_index = 0;
        sprite_index = s_mushroom_bounce;
        audio_play_sound(su_mush_bounce, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
        mush = 0;
}
