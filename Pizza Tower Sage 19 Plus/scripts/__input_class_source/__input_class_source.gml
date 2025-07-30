function __input_class_source(argument0, argument1 = undefined) constructor
{
    static __global = __input_global();
    
    static toString = function()
    {
        return __name;
    };
    
    static __is_connected = function()
    {
        switch (__source)
        {
            case (0 << 0):
                return true;
                break;
            
            case (1 << 0):
                return true;
                break;
            
            case (3 << 0):
                return true;
                break;
            
            case (2 << 0):
                return input_gamepad_is_connected(__gamepad);
                break;
            
            default:
                __input_error("Source \"", __source, "\" not recognised");
                break;
        }
    };
    
    static __equal_to = function(argument0)
    {
        switch (argument0.__source)
        {
            case (0 << 0):
                return __source == (0 << 0);
                break;
            
            case (1 << 0):
                return __source == (1 << 0);
                break;
            
            case (3 << 0):
                return __source == (3 << 0);
                break;
            
            case (2 << 0):
                return __source == (2 << 0) && __gamepad == argument0.__gamepad;
                break;
        }
        
        return false;
    };
    
    static __scan_for_binding = function(argument0, argument1, argument2, argument3)
    {
        if (__source == (3 << 0))
            return undefined;
        
        if (true && (__source == (0 << 0) || __source == (1 << 0)))
        {
            var _binding = __input_source_scan_for_binding((0 << 0), __gamepad, argument0, argument1, argument2, argument3);
            
            if (_binding != undefined)
                return _binding;
            
            return __input_source_scan_for_binding((1 << 0), __gamepad, argument0, argument1, argument2, argument3);
        }
        
        return __input_source_scan_for_binding(__source, __gamepad, argument0, argument1, argument2, argument3);
    };
    
    static __validate_binding = function(argument0)
    {
        var _type = argument0.__type;
        var _value = argument0.__value;
        var _raw;
        
        if (_type == "gamepad button" || _type == "gamepad axis")
        {
            if (__source == (2 << 0))
            {
                var _gamepad = __global.__gamepads[__gamepad];
                
                if (!is_struct(_gamepad) || variable_struct_get(_gamepad.__mapping_gm_to_raw, _value) == undefined)
                    return false;
                
                var _mapping = variable_struct_get(_gamepad.__mapping_gm_to_raw, _value);
                _raw = (_mapping.__raw == undefined) ? _mapping.__raw_negative : _mapping.__raw;
                
                if (_raw == undefined)
                    return false;
                
                if (_gamepad.__xinput && (_raw == 4106 || _raw == 4107))
                    return true;
                
                if (_raw == 0)
                {
                    var _hat_mask = (_mapping.__hat_mask == undefined) ? _mapping.__hat_mask_negative : _mapping.__hat_mask;
                    
                    if (_hat_mask != undefined)
                        return _hat_mask == 1 || _hat_mask == 2 || _hat_mask == 4 || _hat_mask == 8;
                }
            }
        }
        
        switch (_type)
        {
            case "gamepad button":
                if (__source != (2 << 0))
                    return false;
                
                return _raw < gamepad_button_count(__gamepad);
                break;
            
            case "gamepad axis":
                if (__source != (2 << 0))
                    return false;
                
                return _raw < gamepad_axis_count(__gamepad);
                break;
            
            case "key":
                if (!__global.__keyboard_allowed)
                    return false;
                
                if (!(__source == (0 << 0) || (true && __source == (1 << 0))))
                    return false;
                
                if (os_type == os_android)
                {
                    if ((_value >= 16 && _value <= 19) || (_value >= 96 && _value <= 122))
                        return false;
                    
                    var _lowercase = argument0.__android_lowercase;
                    
                    if (_lowercase != undefined && !__input_key_is_ignored(_lowercase) && _lowercase >= 8 && _lowercase <= 57343)
                        return true;
                }
                
                return !__input_key_is_ignored(_value) && _value >= 8 && _value <= 57343;
                break;
            
            case "mouse button":
                if (!__global.__mouse_allowed)
                    return false;
                
                if (!(__source == (1 << 0) || (true && __source == (0 << 0))))
                    return false;
                
                switch (_value)
                {
                    case 1:
                        return !(os_type == os_xboxone || os_type == os_gdk);
                        break;
                    
                    case 2:
                        return !((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || (!(false || os_type == os_gxgames) && __input_global().__on_mobile));
                        break;
                    
                    case 3:
                        return !(((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || os_type == os_switch) || __input_global().__on_mobile);
                        break;
                    
                    case 4:
                    case 5:
                        return !(((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || os_type == os_switch) || os_type == os_gxgames || __input_global().__on_mobile || false || ((false || os_type == os_gxgames) && os_type == os_macosx));
                        break;
                    
                    default:
                        return false;
                        break;
                }
                
                break;
            
            case "mouse wheel up":
            case "mouse wheel down":
                if (!__global.__mouse_allowed)
                    return false;
                
                if (!(__source == (1 << 0) || (true && __source == (0 << 0))))
                    return false;
                
                return !(((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || os_type == os_switch) || (!(false || os_type == os_gxgames) && __input_global().__on_mobile));
                break;
            
            case "virtual button":
                return __source == (3 << 0);
                break;
        }
        
        __input_error("Binding validity unhandled");
    };
    
    __source = argument0;
    __gamepad = argument1;
    
    switch (__source)
    {
        case (0 << 0):
            __name = "keyboard and mouse";
            break;
        
        case (1 << 0):
            __name = "keyboard and mouse";
            break;
        
        case (3 << 0):
            __name = "touch";
            break;
        
        case (2 << 0):
            __name = "gamepad " + _string(argument1);
            break;
        
        default:
            __input_error("Source \"", __source, "\" not recognised");
            break;
    }
}

function __input_source_scan_for_binding(argument0, argument1, argument2, argument3, argument4, argument5)
{
    var _filter_func = function(argument0, argument1, argument2)
    {
        if (is_struct(argument1) && variable_struct_exists(argument1, _string(argument0)))
            return false;
        
        if (is_struct(argument2) && !variable_struct_exists(argument2, _string(argument0)))
            return false;
        
        return true;
    };
    
    switch (argument0)
    {
        case (0 << 0):
            var _keyboard_key = __input_keyboard_key();
            
            if (__global.__any_keyboard_binding_defined && _keyboard_key >= 8 && _keyboard_key <= 57343 && !__input_key_is_ignored(_keyboard_key) && _filter_func(_keyboard_key, argument4, argument5))
            {
                if (argument3)
                    return true;
                
                var _binding = new __input_class_binding();
                _binding.__set_key(_keyboard_key, true);
                
                if (os_type == os_macosx)
                {
                    if (1 && !argument3)
                        __input_trace("Binding label for keycode ", _string(ord(_binding.__label)), ", initially set to \"", _binding.__label, "\"");
                    
                    var _keychar = string_upper(keyboard_lastchar);
                    
                    if (ord(_keychar) >= 65 && ord(_keychar) <= 90)
                    {
                        _binding.__set_label(_keychar);
                        __input_key_name_set(_keyboard_key, _keychar);
                    }
                }
                
                return _binding;
            }
            
            break;
        
        case (1 << 0):
            var _mouse_button = __input_mouse_button();
            
            if (__global.__mouse_allowed && !__global.__window_focus_block_mouse && _mouse_button != 0 && _filter_func(_mouse_button, argument4, argument5))
            {
                if (argument3)
                    return true;
                
                return input_binding_mouse_button(_mouse_button);
            }
            else if (mouse_wheel_up() && _filter_func("mouse wheel up", argument4, argument5))
            {
                if (argument3)
                    return true;
                
                return input_binding_mouse_wheel_up();
            }
            else if (mouse_wheel_down() && _filter_func("mouse wheel down", argument4, argument5))
            {
                if (argument3)
                    return true;
                
                return input_binding_mouse_wheel_down();
            }
            
            break;
        
        case (3 << 0):
            return undefined;
            break;
        
        case (2 << 0):
            if (__global.__any_gamepad_binding_defined)
            {
                var _check_array = [32769, 32770, 32771, 32772, 32781, 32782, 32783, 32784, 32773, 32774, 32775, 32776, 32778, 32777, 32779, 32780, 32785, 32786, 32787, 32788, __input_global().__gp_paddle1, __input_global().__gp_paddle2, __input_global().__gp_paddle3, __input_global().__gp_paddle4, __input_global().__gp_guide, __input_global().__gp_touchpad, __input_global().__gp_misc1];
                var _i = 0;
                
                repeat (array_length(_check_array))
                {
                    var _check = _check_array[_i];
                    
                    if (input_gamepad_is_axis(argument1, _check))
                    {
                        var _value = input_gamepad_value(argument1, _check);
                        
                        if (abs(_value) > input_axis_threshold_get(_check, argument2).__mini && _filter_func(_check, argument4, argument5))
                        {
                            if (argument3)
                                return true;
                            
                            var _binding = input_binding_gamepad_axis(_check, _value < 0);
                            
                            if (__global.__source_mode == (4 << 0))
                                _binding.__gamepad_set(argument1);
                            
                            return _binding;
                        }
                    }
                    else if (input_gamepad_check(argument1, _check) && _filter_func(_check, argument4, argument5))
                    {
                        if (argument3)
                            return true;
                        
                        var _binding = input_binding_gamepad_button(_check);
                        
                        if (__global.__source_mode == (4 << 0))
                            _binding.__gamepad_set(argument1);
                        
                        return _binding;
                    }
                    
                    _i++;
                }
            }
            
            break;
    }
    
    return undefined;
}
