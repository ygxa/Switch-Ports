function monster_pat_call()
{
    if (sprite_index != s_patroller_catch)
    {
        var _mbad = irandom_range(1, 2);
        sprite_index = s_patroller_catch;
        audio_play_sound(su_alarm, 50, false);
        vsp = 6;
        
        with (instance_create_layer(640, -50, layer, o_monster_Chaser))
            facing = -other.facing;
    }
    
    y -= vsp;
    
    if (floor(image_index) == (image_number - 1))
        instance_destroy();
}
