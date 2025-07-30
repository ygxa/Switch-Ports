if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (7)
    {
        with (instance_create(x + 32, y + 32, obj_debris))
            sprite_index = spr_bigdebris;
    }
    
    if (hp > 1)
    {
        repeat (3)
            instance_create(x + 32, y + 32, obj_debris);
        
        with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
            sprite_index = spr_bigdebrisBandage;
    }
    
    audio_stop_sound(sound_destroyblock1);
    audio_stop_sound(sound_destroyblock2);
    scr_sound(choose(38, 39));
    ds_list_add(global.saveroom, id);
}
