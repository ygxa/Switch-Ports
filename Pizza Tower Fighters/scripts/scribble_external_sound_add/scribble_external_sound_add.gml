function scribble_external_sound_add(argument0, argument1)
{
    var _external_sound_map = __scribble_get_external_sound_map();
    
    if (ds_map_exists(_external_sound_map, argument1))
        __scribble_error("External sound alias \"", argument1, "\" already exists");
    
    if (!audio_exists(argument0))
        __scribble_error("Audio asset ", argument0, " could not be found");
    
    ds_map_set(_external_sound_map, argument1, argument0);
}
