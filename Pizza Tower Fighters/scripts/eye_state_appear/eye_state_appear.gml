function eye_state_appear()
{
    if (sprite_index != s_secreteye_appear)
    {
        sprite_index = s_secreteye_appear;
        image_alpha = 1;
        image_index = 0;
        audio_play_sound(su_eye_enter, 50, false);
    }
    
    if (floor(image_index) == (image_number - 1))
        state = (2 << 0);
}
