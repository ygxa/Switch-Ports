function scribble_typists_add_event(argument0, argument1)
{
    __scribble_initialize();
    
    if (!is_string(argument0))
    {
        __scribble_error("Event names should be strings.\n(Input to script was \"", argument0, "\")");
        exit;
    }
    
    if (is_undefined(argument1) || (!is_method(argument1) && !script_exists(argument1)))
    {
        __scribble_error("Invalid function provided\n(Input datatype was \"", typeof(argument1), "\")");
        exit;
    }
    
    if (variable_struct_exists(__scribble_config_colours(), argument0))
    {
        __scribble_trace("Warning! Event name \"" + argument0 + "\" has already been defined as a colour");
        exit;
    }
    
    if (ds_map_exists(__scribble_get_effects_map(), argument0))
    {
        __scribble_trace("Warning! Event name \"" + argument0 + "\" has already been defined as an effect");
        exit;
    }
    
    if (ds_map_exists(__scribble_get_macros_map(), argument0))
    {
        __scribble_trace("Warning! Macro name \"" + argument0 + "\" has already been defined as a macro");
        exit;
    }
    
    var _typewriter_events_map = __scribble_get_typewriter_events_map();
    var _old_function = ds_map_find_value(_typewriter_events_map, argument0);
    
    if (!is_undefined(_old_function))
    {
        if (is_numeric(_old_function) && _old_function < 0)
            __scribble_trace("Warning! Overwriting event [" + argument0 + "] tied to <invalid script>");
        else
            __scribble_trace("Warning! Overwriting event [" + argument0 + "] tied to \"" + (is_method(_old_function) ? string(_old_function) : script_get_name(_old_function)) + "\"");
    }
    
    ds_map_set(_typewriter_events_map, argument0, argument1);
}
