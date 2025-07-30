function input_source_add(argument0, argument1 = 0, argument2 = true)
{
    static _global = __input_global();
    
    if (argument1 < 0)
    {
        __input_error("Invalid player index provided (", argument1, ")");
        return undefined;
    }
    
    if (argument1 >= 1)
    {
        __input_error("Player index too large (", argument1, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (_global.__use_is_instanceof)
    {
        if (!is_instanceof(argument0, __input_class_source))
        {
            if (argument0 == __input_global().__source_gamepad)
                __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
            else
                __input_error("Invalid source provided (", argument0, ")");
        }
    }
    else if (instanceof(argument0) != "__input_class_source")
    {
        if (argument0 == __input_global().__source_gamepad)
            __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
        else
            __input_error("Invalid source provided (", argument0, ")");
    }
    
    if (argument0 == __input_global().__source_keyboard)
    {
        if (!_global.__any_keyboard_binding_defined && !_global.__any_mouse_binding_defined)
            __input_error("Cannot claim ", argument0, ", no keyboard or mouse bindings have been created in a default profile (see __input_config_verbs())");
    }
    else if (argument0 == __input_global().__source_mouse)
    {
        if (!_global.__any_mouse_binding_defined)
            __input_error("Cannot claim ", argument0, ", no mouse bindings have been created in a default profile (see __input_config_verbs())");
    }
    else if (argument0.__source == (2 << 0))
    {
        if (!_global.__any_gamepad_binding_defined)
            __input_error("Cannot claim ", argument0, ", no gamepad bindings have been created in a default profile (see __input_config_verbs())");
    }
    
    if (argument2)
        __input_source_relinquish(argument0);
    
    _global.__players[argument1].__source_add(argument0);
}
