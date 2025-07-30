if (ds_list_find_index(global.saveroom, id) == -1)
{
    var rep = 4 + ((sprite_width / 32) - 1);
    
    repeat (rep)
    {
        with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_debris))
            sprite_index = spr_smallbreakEscape_Debris;
    }
    
    audio_stop_sound(sound_destroyblock1);
    audio_stop_sound(sound_destroyblock2);
    scr_sound(choose(38, 39));
    ds_list_add(global.saveroom, id);
}
