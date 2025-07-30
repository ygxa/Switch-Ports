function player_faker_sidespecial()
{
    if (sprite_index != s_fakepep_sidespecial)
    {
        image_index = 0;
        image_speed = 1;
        audio_play_sound(su_fakepep_supertaunt, 50, false);
        sprite_index = s_fakepep_sidespecial;
        
        if (object_index == o_player_fakepep)
        {
            instance_create_layer(x, y, layer, o_clone_spawner);
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = -5;
                hsp = 5;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 0;
                hsp = 5;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 5;
                hsp = 5;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = -5;
                hsp = -5;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 0;
                hsp = -5;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 5;
                hsp = -5;
            }
        }
        else
        {
            with (instance_create_layer(x, y, layer, o_clone_spawner))
                player = 2;
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = -5;
                hsp = 5;
                player = 2;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 0;
                hsp = 5;
                player = 2;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 5;
                hsp = 5;
                player = 2;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = -5;
                hsp = -5;
                player = 2;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 0;
                hsp = -5;
                player = 2;
            }
            
            with (instance_create_layer(x, y, layer, o_fakepep_spikes))
            {
                vsp = 5;
                hsp = -5;
                player = 2;
            }
        }
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = s_fakepep_idle;
        damagemeter = 0;
        state = (0 << 0);
        accel_final = 0;
        last_h = 0;
        inv = false;
    }
}
