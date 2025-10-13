if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1)
    {
        repeat (4)
        {
            with (instance_create(x + 32, y + 32, obj_metaldebris))
                sprite_index = spr_metalblockdebrisescape;
        }
        
        tile_layer_delete_at(1, x, y);
        tile_layer_delete_at(1, x + 32, y);
        tile_layer_delete_at(1, x + 32, y + 32);
        tile_layer_delete_at(1, x, y + 32);
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        fmod_studio_event_oneshot_3d("event:/sfx/level_structure/destroy_metal");
        ds_list_add(global.saveroom, id);
    }
}

depth = 1;
