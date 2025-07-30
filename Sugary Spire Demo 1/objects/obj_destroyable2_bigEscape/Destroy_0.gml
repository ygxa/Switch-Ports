if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigbreak2Escape_Debris;
    
    repeat (3)
    {
        with (instance_create(x + 32, y + 32, obj_debris))
            sprite_index = spr_bigbreak2Escape_Debris;
        
        with (instance_create(x + 32, y + 32, obj_debris))
            sprite_index = spr_bigbreak2Escape_Debris;
    }
    
    audio_stop_sound(sound_destroyblock1);
    audio_stop_sound(sound_destroyblock2);
    scr_sound(choose(38, 39));
    ds_list_add(global.saveroom, id);
    
    with (instance_create(x + 32, y + 32, obj_collectslice))
        hsp = 2;
    
    with (instance_create(x + 32, y + 32, obj_collectslice))
        hsp = -2;
}
