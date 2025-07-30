if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris2);
    instance_create(x + 16, y, obj_debris2);
    instance_create(x + 16, y, obj_debris2);
    instance_create(x + 16, y, obj_debris2);
    instance_create(x, y, obj_collect);
    audio_stop_sound(sound_destroyblock1);
    audio_stop_sound(sound_destroyblock2);
    scr_sound(choose(38, 39));
    ds_list_add(global.saveroom, id);
}
