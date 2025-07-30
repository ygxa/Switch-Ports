function input_source_detect_input(argument0, argument1 = true)
{
    static _global = __input_global();
    
    if (!_global.__game_input_allowed)
        return false;
    
    if (argument0 == -3)
        return input_source_detect_input([__input_global().__source_keyboard, __input_global().__source_mouse, __input_global().__source_touch, __input_global().__source_gamepad], argument1);
    
    if (is_array(argument0))
    {
        var _i = 0;
        
        repeat (array_length(argument0))
        {
            if (input_source_detect_input(argument0[_i], argument1))
                return true;
            
            _i++;
        }
        
        return false;
    }
    
    switch (argument0.__source)
    {
        case (0 << 0):
            if (_global.__keyboard_allowed && _global.__any_keyboard_binding_defined && (!argument1 || input_source_is_available(argument0)) && keyboard_check_pressed(vk_anykey) && !__input_key_is_ignored(__input_keyboard_key()))
                return true;
            
            if (_global.__mouse_allowed && (!argument1 || input_source_is_available(argument0)) && (input_mouse_check(-1) || mouse_wheel_up() || mouse_wheel_down()))
                return true;
            
            break;
        
        case (1 << 0):
            if (_global.__mouse_allowed && (!argument1 || input_source_is_available(argument0)) && (input_mouse_check(-1) || mouse_wheel_up() || mouse_wheel_down()))
                return true;
            
            break;
        
        case (3 << 0):
            if (_global.__touch_allowed && (!argument1 || input_source_is_available(argument0)) && device_mouse_check_button(_global.__pointer_index, mb_left))
                return true;
            
            break;
        
        case (2 << 0):
            if (_global.__gamepad_allowed && _global.__any_gamepad_binding_defined)
            {
                var _gamepad = argument0.__gamepad;
                
                if (input_gamepad_is_connected(_gamepad) && (!argument1 || input_source_is_available(argument0)) && _global.__gamepads[_gamepad].__get_any_pressed())
                    return true;
            }
            
            break;
    }
    
    return false;
}
