function player_doise_super_call()
{
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (sprite_index != s_doise_super_show && noisebomb == 0)
    {
        ScrStun_OtherPlayer(30);
        image_speed = 1;
        audio_play_sound(su_doise_laugh, 50, false);
        sprite_index = s_doise_super_show;
        image_index = 0;
    }
    
    if (sprite_index == s_doise_super_show && floor(image_index) == 3 && !instance_exists(o_image))
    {
        with (instance_create_layer(x, y - 50, layer, o_image))
            target = other.object_index;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        noisebomb = 1;
        sprite_index = s_doise_super_show2;
    }
    
    if (!instance_exists(o_image) && sprite_index == s_doise_super_show2)
    {
        state = (0 << 0);
        damagenull = false;
    }
}
