function player_vigilante_taunt()
{
    if (sprite_index != s_vigilante_taunt)
    {
        audio_play_sound(su_vigi_taunt, 50, false);
        image_index = 0;
        image_speed = 1;
        hsp = 0;
        sprite_index = s_vigilante_taunt;
    }
    
    vsp += grv;
    player_col();
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
    }
}
