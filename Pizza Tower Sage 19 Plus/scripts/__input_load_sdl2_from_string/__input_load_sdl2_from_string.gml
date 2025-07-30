function __input_load_sdl2_from_string(argument0)
{
    static _global = __input_global();
    
    __input_trace("Loading SDL2 database from _string \"", argument0, "\"");
    return __input_load_sdl2_from_string_internal(argument0);
}
