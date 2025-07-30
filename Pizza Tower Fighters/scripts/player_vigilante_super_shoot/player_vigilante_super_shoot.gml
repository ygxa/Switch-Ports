function player_vigilante_super_shoot()
{
    if (sprite_index != s_vigilante_super)
    {
        vsp = -9;
        hsp = 0;
        inv = 1;
        image_speed = 1;
        sprite_index = s_vigilante_super;
        image_index = 0;
        ds_list_clear(HitByAttack);
    }
    
    if (image_index > 4)
        vsp = 0;
    
    player_col();
    
    if (object_index == o_player_vigilante)
    {
        if (floor(image_index) == 12 && !audio_is_playing(su_vigi_bazooka_sup))
        {
            with (instance_create_layer(x, y, layer, o_vigi_missile))
            {
                hsp = 10 * other.facing;
                timer = other.facing;
                player = 1;
            }
            
            audio_play_sound(su_vigi_bazooka_sup, 100, false);
            image_speed = 1;
        }
    }
    else if (floor(image_index) == 12 && !audio_is_playing(su_vigi_bazooka_sup))
    {
        with (instance_create_layer(x, y, layer, o_vigi_missile))
        {
            hsp = 10 * other.facing;
            timer = other.facing;
            player = 2;
        }
        
        audio_play_sound(su_vigi_bazooka_sup, 100, false);
        image_speed = 1;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_vigilante_idle;
        state = (0 << 0);
        accel_final = 0;
        inv = 0;
        last_h = 0;
    }
}
