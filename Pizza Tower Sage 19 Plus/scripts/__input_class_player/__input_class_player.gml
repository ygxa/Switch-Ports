function __input_class_player() constructor
{
    static __global = __input_global();
    
    static __profile_create = function(argument0)
    {
        if (variable_struct_exists(__profiles_dict, argument0))
            __input_error("Profile \"", argument0, "\" already exists for player ", __index);
        
        var _new_profile_struct = {};
        var _v = 0;
        
        repeat (array_length(__global.__basic_verb_array))
        {
            var _verb_name = __global.__basic_verb_array[_v];
            var _alternate_array = array_create(2, undefined);
            var _a = 0;
            
            repeat (2)
            {
                _alternate_array[_a] = input_binding_empty();
                _a++;
            }
            
            variable_struct_set(_new_profile_struct, _verb_name, _alternate_array);
            _v++;
        }
        
        variable_struct_set(__profiles_dict, argument0, _new_profile_struct);
    };
    
    static __profile_destroy = function(argument0)
    {
        if (variable_struct_exists(__global.__default_profile_dict, argument0))
            __input_error("Cannot remove profile \"", argument0, "\" as it is a default profile");
        
        if (__profile_name == argument0)
            __profile_name = undefined;
        
        variable_struct_remove(__profiles_dict, argument0);
        
        if (__profile_name == undefined)
            __profile_set(__profile_get_auto());
    };
    
    static __profile_exists = function(argument0)
    {
        if (argument0 == undefined)
            return true;
        
        return variable_struct_exists(__profiles_dict, argument0);
    };
    
    static __profile_get_array = function()
    {
        return variable_struct_get_names(__profiles_dict);
    };
    
    static __profile_set = function(argument0)
    {
        if (argument0 == undefined)
        {
            __input_trace("Warning! Failed to set profile for player ", __index, " (was ", argument0, ")");
            exit;
        }
        
        if (!variable_struct_exists(__profiles_dict, argument0))
            __input_error("Profile \"", argument0, "\" doesn't exist for player ", __index);
        
        if (__profile_name != argument0)
            __input_trace("Setting player ", __index, " profile to \"", argument0, "\"");
        
        __profile_name = argument0;
    };
    
    static __profile_get = function(argument0 = undefined)
    {
        if (argument0 == undefined)
            return __profile_name;
        
        if (!variable_struct_exists(__profiles_dict, argument0))
            __input_error("Profile \"", argument0, "\" doesn't exist for player ", __index);
        
        return argument0;
    };
    
    static __profile_get_auto = function()
    {
        if (__ghost)
            return undefined;
        
        if (__global.__source_mode == (4 << 0) && __index == 0)
            return "multidevice";
        
        var _count = array_length(__source_array);
        
        if (_count == 0)
            return undefined;
        
        if (_count == 1)
        {
            switch (__source_array[0].__source)
            {
                case (0 << 0):
                    return "keyboard_and_mouse";
                    break;
                
                case (1 << 0):
                    return "keyboard_and_mouse";
                    break;
                
                case (3 << 0):
                    return "touch";
                    break;
                
                case (2 << 0):
                    return "gamepad";
                    break;
                
                default:
                    __input_error("Invalid source (", __source_array[0].__source, ")");
                    break;
            }
        }
        
        return "mixed";
    };
    
    static __profile_set_auto = function()
    {
        var _profile_name = __profile_get_auto();
        
        if (_profile_name != undefined)
            __profile_set(_profile_name);
    };
    
    static __profile_ensure = function(argument0)
    {
        if (argument0 == "")
        {
            __input_error("Profile name cannot be an empty _string");
            return undefined;
        }
        
        var _profile_struct = variable_struct_get(__profiles_dict, argument0);
        
        if (!is_struct(_profile_struct))
        {
            _profile_struct = {};
            variable_struct_set(__profiles_dict, argument0, _profile_struct);
            var _v = 0;
            
            repeat (array_length(__global.__basic_verb_array))
            {
                var _verb_name = __global.__basic_verb_array[_v];
                __verb_ensure(argument0, _verb_name);
                _v++;
            }
        }
    };
    
    static __profile_reset_bindings = function(argument0)
    {
        var _v = 0;
        
        repeat (array_length(__global.__basic_verb_array))
        {
            var _verb_name = __global.__basic_verb_array[_v];
            var _alternate = 0;
            
            repeat (2)
            {
                __binding_reset(argument0, _verb_name, _alternate);
                _alternate++;
            }
            
            _v++;
        }
    };
    
    static __profile_export = function(argument0, argument1, argument2)
    {
        if (!variable_struct_exists(__profiles_dict, argument0))
            __input_error("Profile \"", argument0, "\" doesn't exist for player ", __index);
        
        var _output = {};
        var _profile_struct = variable_struct_get(__profiles_dict, argument0);
        var _v = 0;
        
        repeat (array_length(__global.__basic_verb_array))
        {
            var _verb_name = __global.__basic_verb_array[_v];
            var _new_alternate_array = [];
            variable_struct_set(_output, _verb_name, _new_alternate_array);
            var _alternate_array = variable_struct_get(_profile_struct, _verb_name);
            var _a = 0;
            
            repeat (2)
            {
                array_push(_new_alternate_array, _alternate_array[_a].__export());
                _a++;
            }
            
            _v++;
        }
        
        if (argument1)
        {
            if (argument2)
                return __input_snap_to_json(_output, true, true);
            else
                return json_stringify(_output);
        }
        else
        {
            return _output;
        }
    };
    
    static __profile_import = function(argument0, argument1)
    {
        var _json;
        
        if (is_string(argument0))
            _json = json_parse(argument0);
        else
            _json = argument0;
        
        if (!is_struct(_json) && !is_array(_json))
        {
            __input_error("Input must be valid JSON (typeof=", typeof(argument0), ")");
            exit;
        }
        
        __profile_ensure(argument1);
        var _existing_verb_dict = variable_struct_get(__profiles_dict, argument1);
        var _v = 0;
        
        repeat (array_length(__global.__basic_verb_array))
        {
            var _verb_name = __global.__basic_verb_array[_v];
            var _existing_alternate_array = variable_struct_get(_existing_verb_dict, _verb_name);
            
            if (!is_array(_existing_alternate_array))
            {
                _existing_alternate_array = array_create(2, undefined);
                variable_struct_set(_existing_verb_dict, _verb_name, _existing_alternate_array);
            }
            
            var _a = 0;
            
            repeat (2)
            {
                _existing_alternate_array[_a] = input_binding_empty();
                _a++;
            }
            
            var _alternate_array = variable_struct_get(_json, _verb_name);
            
            if (!is_array(_alternate_array))
                __input_error("Player ", __index, " data is missing verb \"", _verb_name, "\"");
            
            if (1 && array_length(_alternate_array) != 2)
                __input_error("JSON malformed, player ", __index, " verb \"", _verb_name, "\" should have ", 2, " alternate bindings, but it had ", array_length(_alternate_array));
            
            _a = 0;
            
            repeat (min(array_length(_alternate_array), 2))
            {
                _existing_alternate_array[_a].__import(_alternate_array[_a]);
                _a++;
            }
            
            _v++;
        }
    };
    
    static __sources_clear = function()
    {
        if (__rebind_state > 0 && array_length(__source_array) > 0)
            __binding_scan_failure((-11 << 0));
        
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i].__source == (2 << 0))
            {
                __input_gamepad_reset_color(__source_array[_i].__gamepad);
                __input_gamepad_stop_trigger_effects(__source_array[_i].__gamepad);
            }
        }
        
        if (__global.__touch_player == self)
            __input_virtual_player_set(undefined);
        
        array_resize(__source_array, 0);
        __last_input_time = __global.__current_time;
    };
    
    static __source_add = function(argument0)
    {
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i] == argument0)
                exit;
            
            _i++;
        }
        
        if (__rebind_state > 0)
            __binding_scan_failure((-11 << 0));
        
        array_push(__source_array, argument0);
        __last_input_time = __global.__current_time;
        __color_set(__color);
        __input_player_apply_trigger_effects(__index);
        
        if (argument0 == __input_global().__source_touch || (true && argument0 == __input_global().__source_mouse))
            __input_virtual_player_set(self);
    };
    
    static __source_remove = function(argument0)
    {
        if (__global.__touch_allowed)
        {
            if (argument0 == __input_global().__source_mouse)
                argument0 = __input_global().__source_touch;
        }
        else if (argument0 == __input_global().__source_touch)
        {
            argument0 = __input_global().__source_mouse;
        }
        
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i] == argument0)
            {
                if (__source_array[_i].__source == (2 << 0))
                {
                    __input_gamepad_reset_color(__source_array[_i].__gamepad);
                    __input_gamepad_stop_trigger_effects(__source_array[_i].__gamepad);
                }
                
                if ((argument0 == __input_global().__source_touch || (true && argument0 == __input_global().__source_mouse)) && __global.__touch_player == self)
                    __input_virtual_player_set(undefined);
                
                array_delete(__source_array, _i, 1);
            }
            else
            {
                _i++;
            }
        }
    };
    
    static __source_contains = function(argument0, argument1 = true)
    {
        if (argument0 == __input_global().__source_gamepad)
        {
            _i = 0;
            
            repeat (array_length(__source_array))
            {
                if (__source_array[_i].__source == (2 << 0))
                    return true;
                
                _i++;
            }
            
            return false;
        }
        
        if (argument1)
        {
            if (__global.__touch_allowed)
            {
                if (argument0 == __input_global().__source_mouse)
                    argument0 = __input_global().__source_touch;
            }
            else if (argument0 == __input_global().__source_touch)
            {
                argument0 = __input_global().__source_mouse;
            }
        }
        
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i].__equal_to(argument0))
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static __source_get_gamepad = function()
    {
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            var _gamepad = __source_array[_i].__gamepad;
            
            if (input_gamepad_is_connected(_gamepad))
                return _gamepad;
            
            _i++;
        }
        
        return -1;
    };
    
    static __sources_any_rebind_allowed_input = function()
    {
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i].__scan_for_binding(__index, true, __rebind_ignore_struct, __rebind_allow_struct))
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static __sources_validate_binding = function(argument0)
    {
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i].__validate_binding(argument0))
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static __binding_get = function(argument0, argument1, argument2, argument3)
    {
        static _empty_binding = input_binding_empty();
        
        argument0 = __profile_get(argument0);
        
        if (argument0 == undefined)
        {
            if (!argument3)
                return _empty_binding;
            
            var _keyboard_profile_allowed = __global.__keyboard_allowed && __global.__any_keyboard_binding_defined;
            var _mouse_profile_allowed = __global.__mouse_allowed && __global.__any_mouse_binding_defined;
            var _gamepad_profile_allowed = __global.__gamepad_allowed && __global.__any_gamepad_binding_defined;
            var _touch_profile_allowed = __global.__touch_allowed;
            
            switch (1)
            {
                case 0:
                    return _empty_binding;
                    break;
                
                case 1:
                    if (__input_global().__on_desktop && (_keyboard_profile_allowed || _mouse_profile_allowed) && !(__input_global().__on_steam_deck && _gamepad_profile_allowed))
                    {
                        if (true || _keyboard_profile_allowed)
                            argument0 = "keyboard_and_mouse";
                        else
                            argument0 = "keyboard_and_mouse";
                    }
                    else if (__input_global().__on_mobile && _touch_profile_allowed)
                    {
                        argument0 = "touch";
                    }
                    else if (_gamepad_profile_allowed)
                    {
                        argument0 = "gamepad";
                    }
                    else
                    {
                        return _empty_binding;
                    }
                    
                    break;
                
                case 2:
                    if (_gamepad_profile_allowed)
                        argument0 = "gamepad";
                    else
                        return _empty_binding;
                    
                    break;
                
                case 3:
                    if (__input_global().__on_desktop)
                    {
                        if (input_gamepad_is_any_connected() && _gamepad_profile_allowed)
                        {
                            argument0 = "gamepad";
                        }
                        else if (_keyboard_profile_allowed || _mouse_profile_allowed)
                        {
                            if (true || _keyboard_profile_allowed)
                                argument0 = "keyboard_and_mouse";
                            else
                                argument0 = "keyboard_and_mouse";
                        }
                        else
                        {
                            return _empty_binding;
                        }
                    }
                    else if (__input_global().__on_mobile)
                    {
                        if (input_gamepad_is_any_connected() && _gamepad_profile_allowed)
                            argument0 = "gamepad";
                        else if (_touch_profile_allowed)
                            argument0 = "touch";
                        else
                            return _empty_binding;
                    }
                    else if (_gamepad_profile_allowed)
                    {
                        argument0 = "gamepad";
                    }
                    else
                    {
                        return _empty_binding;
                    }
                    
                    break;
                
                default:
                    __input_error("Unhandled INPUT_FALLBACK_PROFILE_BEHAVIOR value (", 1, ")");
                    break;
            }
        }
        
        return array_get(variable_struct_get(variable_struct_get(__profiles_dict, argument0), argument1), argument2);
    };
    
    static __binding_set = function(argument0, argument1, argument2, argument3)
    {
        argument0 = __profile_get(argument0);
        
        if (argument0 == undefined)
        {
            __input_trace("Warning! Cannot set binding, profile was <undefined>");
            exit;
        }
        
        if ((argument0 == "keyboard_and_mouse" || argument0 == "keyboard_and_mouse" || argument0 == "touch" || argument0 == "gamepad") && argument0 != "mixed" && argument0 != "multidevice")
        {
            switch (argument3.__get_source_type())
            {
                case (0 << 0):
                    if (!(argument0 == "keyboard_and_mouse" || (true && argument0 == "keyboard_and_mouse")))
                    {
                        var _binding_gamepad_name = input_gamepad_constant_get_name(ord(input_binding_get_name(argument3)));
                        
                        if (_binding_gamepad_name != "unknown")
                        {
                            if (__global.__strict_binding_check)
                            {
                                __input_error("Gamepad constant value ", _binding_gamepad_name, " cannot be used as keyboard binding for verb ", argument1, " in profile ", argument0);
                                exit;
                            }
                            else
                            {
                                __input_trace("Warning! Gamepad constant value ", _binding_gamepad_name, " cannot be used as keyboard binding for verb ", argument1, " in profile ", argument0);
                                exit;
                            }
                        }
                        
                        if (__global.__strict_binding_check)
                            __input_error("Keyboard binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        else
                            __input_trace("Warning! Keyboard binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        
                        exit;
                    }
                    
                    break;
                
                case (1 << 0):
                    if (!(argument0 == "keyboard_and_mouse" || (true && argument0 == "keyboard_and_mouse")))
                    {
                        if (__global.__strict_binding_check)
                            __input_error("Mouse binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        else
                            __input_trace("Warning! Mouse binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        
                        exit;
                    }
                    
                    break;
                
                case (3 << 0):
                    if (!(argument0 == "touch"))
                    {
                        if (__global.__strict_binding_check)
                            __input_error("Touchscreen binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        else
                            __input_trace("Warning! Touchscreen binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        
                        exit;
                    }
                    
                    break;
                
                case (2 << 0):
                    if (!(argument0 == "gamepad"))
                    {
                        if (__global.__strict_binding_check)
                            __input_error("Gamepad binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        else
                            __input_trace("Warning! Gamepad binding \"", input_binding_get_name(argument3), "\" not supported for profile \"", argument0, "\"");
                        
                        exit;
                    }
                    
                    break;
            }
        }
        
        array_set(variable_struct_get(variable_struct_get(__profiles_dict, argument0), argument1), argument2, argument3);
        __input_trace("Binding for profile \"", argument0, "\" verb \"", argument1, "\" alternate ", argument2, " set to \"", input_binding_get_name(argument3), "\"");
    };
    
    static __binding_remove = function(argument0, argument1, argument2)
    {
        argument0 = __profile_get(argument0);
        
        if (argument0 == undefined)
        {
            __input_trace("Warning! Cannot remove binding, profile was <undefined>");
            exit;
        }
        
        array_set(variable_struct_get(variable_struct_get(__profiles_dict, argument0), argument1), argument2, input_binding_empty());
    };
    
    static __binding_reset = function(argument0, argument1, argument2)
    {
        argument0 = __profile_get(argument0);
        
        if (argument0 == undefined)
        {
            __input_trace("Warning! Cannot reset binding, profile was <undefined>");
            exit;
        }
        
        var _default_profile_struct = variable_struct_get(__global.__default_player.__profiles_dict, argument0);
        
        if (!is_struct(_default_profile_struct))
            __input_error("Profile \"", argument0, "\" doesn't exist as a default profile");
        
        var _binding_struct = array_get(variable_struct_get(_default_profile_struct, argument1), argument2);
        
        if (is_struct(_binding_struct))
            _binding_struct = _binding_struct.__duplicate();
        
        array_set(variable_struct_get(variable_struct_get(__profiles_dict, argument0), argument1), argument2, _binding_struct);
    };
    
    static __verb_group_ensure = function(argument0)
    {
        if (!variable_struct_exists(__verb_group_state_dict, argument0))
            variable_struct_set(__verb_group_state_dict, argument0, true);
    };
    
    static __verb_group_active = function(argument0, argument1, argument2)
    {
        var _old_state = variable_struct_get(__verb_group_state_dict, argument0);
        
        if (_old_state != argument1)
        {
            variable_struct_set(__verb_group_state_dict, argument0, argument1);
            var _array = variable_struct_get(__global.__group_to_verbs_dict, argument0);
            
            if (argument1)
            {
                var _i = 0;
                
                repeat (array_length(_array))
                {
                    variable_struct_get(__verb_state_dict, array_get(_array, _i)).__group_inactive = false;
                    _i++;
                }
            }
            else
            {
                var _i = 0;
                
                repeat (array_length(_array))
                {
                    with (variable_struct_get(__verb_state_dict, array_get(_array, _i)))
                    {
                        __group_inactive = true;
                        __previous_held = true;
                        __inactive = true;
                        __toggle_state = false;
                    }
                    
                    _i++;
                }
            }
        }
        
        if (argument1 && argument2)
        {
            var _i = 0;
            
            repeat (array_length(__global.__verb_group_array))
            {
                var _found_group = __global.__verb_group_array[_i];
                
                if (_found_group != argument0)
                    __verb_group_active(_found_group, false, false);
                
                _i++;
            }
        }
    };
    
    static __verb_group_is_active = function(argument0)
    {
        return variable_struct_get(__verb_group_state_dict, argument0);
    };
    
    static __verb_ensure = function(argument0, argument1)
    {
        if (argument1 == "")
        {
            __input_error("Verb name cannot be an empty _string");
            return undefined;
        }
        
        var _profile_struct = variable_struct_get(__profiles_dict, argument0);
        
        if (!is_struct(_profile_struct))
            __input_error("Profile \"", argument0, "\" does not exist for player ", __index);
        
        if (!is_struct(variable_struct_get(__verb_state_dict, argument1)))
        {
            var _verb = new __input_class_verb_state();
            _verb.__player = self;
            _verb.__name = argument1;
            _verb.__type = (0 << 0);
            variable_struct_set(__verb_state_dict, argument1, _verb);
        }
        
        var _verb_alternate_array = variable_struct_get(_profile_struct, argument1);
        
        if (!is_array(_verb_alternate_array))
        {
            _verb_alternate_array = array_create(2);
            var _i = 0;
            
            repeat (2)
            {
                _verb_alternate_array[_i] = input_binding_empty();
                _i++;
            }
            
            variable_struct_set(_profile_struct, argument1, _verb_alternate_array);
        }
    };
    
    static __add_complex_verb = function(argument0, argument1)
    {
        if (is_struct(variable_struct_get(__verb_state_dict, argument0)))
        {
            __input_error("Verb \"", argument0, "\" has already been added to player ", __index);
        }
        else
        {
            var _verb_state_struct = new __input_class_verb_state();
            _verb_state_struct.__player = self;
            _verb_state_struct.__name = argument0;
            _verb_state_struct.__type = argument1;
            _verb_state_struct.__analogue = false;
            variable_struct_set(__verb_state_dict, argument0, _verb_state_struct);
        }
    };
    
    static __add_combo_state = function(argument0, argument1)
    {
        if (is_struct(variable_struct_get(__combo_state_dict, argument0)))
            __input_error("Combo state with name \"", argument0, "\" has already been added to player ", __index);
        else
            variable_struct_set(__combo_state_dict, argument0, new __input_class_combo_state(argument0, argument1));
    };
    
    static __add_chord_state = function(argument0, argument1)
    {
        if (is_struct(variable_struct_get(__chord_state_dict, argument0)))
            __input_error("Chord state with name \"", argument0, "\" has already been added to player ", __index);
        else
            variable_struct_set(__chord_state_dict, argument0, new __input_class_chord_state(argument0, argument1));
    };
    
    static __axis_threshold_set = function(argument0, argument1, argument2)
    {
        var _axis_struct = variable_struct_get(__axis_thresholds_dict, argument0);
        
        if (!is_struct(_axis_struct))
        {
            _axis_struct = {};
            variable_struct_set(__axis_thresholds_dict, argument0, _axis_struct);
        }
        
        _axis_struct.__mini = argument1;
        _axis_struct.__maxi = argument2;
        return _axis_struct;
    };
    
    static __axis_threshold_get = function(argument0)
    {
        var _struct = variable_struct_get(__axis_thresholds_dict, argument0);
        
        if (is_struct(_struct))
            return _struct;
        
        if (__input_axis_is_directional(argument0))
            return __axis_threshold_set(argument0, 0.3, 0.95);
        else
            return __axis_threshold_set(argument0, 0.02, 1);
    };
    
    static __verb_set = function(argument0, argument1, argument2)
    {
        with (variable_struct_get(__verb_state_dict, argument0))
        {
            __force_value = argument1;
            __force_analogue = argument2;
        }
    };
    
    static __verb_set_from_virtual = function(argument0, argument1, argument2, argument3)
    {
        if (is_string(argument0))
        {
            with (variable_struct_get(__verb_state_dict, argument0))
            {
                if (argument2 > (__virtual_value ?? -infinity))
                {
                    __virtual_value = argument2;
                    __virtual_raw_value = argument1;
                    __virtual_analogue = argument3;
                }
            }
        }
    };
    
    static __get_invalid_gamepad_bindings = function(argument0 = undefined)
    {
        var _output = [];
        argument0 = __profile_get(argument0);
        
        if (argument0 == undefined)
        {
            __input_trace("Warning! Cannot get invalid bindings, profile was <undefined>");
            return _output;
        }
        
        var _s = 0;
        
        repeat (array_length(__source_array))
        {
            var _profile_verb_struct = variable_struct_get(__profiles_dict, argument0);
            
            if (is_struct(_profile_verb_struct))
            {
                var _gamepad_mapping_array = input_gamepad_get_map(__source_array[_s].__gamepad);
                var _v = 0;
                
                repeat (array_length(__global.__basic_verb_array))
                {
                    var _verb_name = __global.__basic_verb_array[_v];
                    var _alternate_array = variable_struct_get(_profile_verb_struct, _verb_name);
                    var _a = 0;
                    
                    repeat (2)
                    {
                        if (is_struct(_alternate_array[_a]))
                        {
                            var _verb_input = _alternate_array[_a].__value;
                            var _found = false;
                            var _m = 0;
                            
                            repeat (array_length(_gamepad_mapping_array))
                            {
                                if (_gamepad_mapping_array[_m] == _verb_input)
                                {
                                    _found = true;
                                    break;
                                }
                                
                                _m++;
                            }
                            
                            if (!_found)
                            {
                                array_push(_output, 
                                {
                                    verb: _verb_name,
                                    alternate: _a,
                                    gm: _verb_input
                                });
                            }
                        }
                        
                        _a++;
                    }
                    
                    _v++;
                }
            }
            
            _s++;
        }
        
        return _output;
    };
    
    static __export = function(argument0, argument1)
    {
        var _new_profiles_dict = {};
        var _new_axis_thresholds_dict = {};
        var _new_gyro_params = {};
        var _root_json = 
        {
            __profiles: _new_profiles_dict,
            __axis_thresholds: _new_axis_thresholds_dict,
            __gyro: _new_gyro_params,
            __gamepad_type_override: __gamepad_type_override,
            __vibration_strength: __vibration_strength,
            __trigger_effect_strength: __trigger_effect_strength,
            __cursor_inverted: __cursor_inverted
        };
        var _profile_name_array = variable_struct_get_names(__profiles_dict);
        var _f = 0;
        
        repeat (array_length(_profile_name_array))
        {
            var _profile_name = _profile_name_array[_f];
            variable_struct_set(_new_profiles_dict, _profile_name, __profile_export(_profile_name_array[_f], false, false));
            _f++;
        }
        
        var _axis_name_array = variable_struct_get_names(__axis_thresholds_dict);
        var _a = 0;
        
        repeat (array_length(_axis_name_array))
        {
            var _axis_name = _axis_name_array[_a];
            var _thresholds_struct = variable_struct_get(__axis_thresholds_dict, _axis_name);
            variable_struct_set(_new_axis_thresholds_dict, _axis_name, 
            {
                __mini: _thresholds_struct.__mini,
                __maxi: _thresholds_struct.__maxi
            });
            _a++;
        }
        
        _new_gyro_params.__axis_x = __gyro_axis_x;
        _new_gyro_params.__axis_y = __gyro_axis_y;
        _new_gyro_params.__sensitivity_x = __gyro_sensitivity_x;
        _new_gyro_params.__sensitivity_y = __gyro_sensitivity_y;
        
        if (argument0)
        {
            if (argument1)
                return __input_snap_to_json(_root_json, true, true);
            else
                return json_stringify(_root_json);
        }
        else
        {
            return _root_json;
        }
    };
    
    static __import = function(argument0)
    {
        var _json;
        
        if (is_string(argument0))
            _json = json_parse(argument0);
        else
            _json = argument0;
        
        if (!is_struct(_json) && !is_array(_json))
        {
            __input_error("Input must be valid JSON (typeof=", argument0, ")");
            exit;
        }
        
        if (!is_struct(variable_struct_get(_json, "__profiles")))
        {
            if (is_struct(variable_struct_get(_json, "profiles")))
            {
                _json.__profiles = variable_struct_get(_json, "profiles");
            }
            else
            {
                __input_error("Player ", __index, " profiles are corrupted");
                exit;
            }
        }
        
        var _profiles_dict = _json.__profiles;
        var _profile_name_array = variable_struct_get_names(_profiles_dict);
        var _f = 0;
        
        repeat (array_length(_profile_name_array))
        {
            var _profile_name = _profile_name_array[_f];
            __profile_import(variable_struct_get(_json.__profiles, _profile_name), _profile_name);
            _f++;
        }
        
        var _legacy_thresholds = false;
        
        if (!is_struct(variable_struct_get(_json, "__axis_thresholds")))
        {
            if (is_struct(variable_struct_get(_json, "axis_thresholds")))
            {
                _json.__axis_thresholds = variable_struct_get(_json, "axis_thresholds");
                _legacy_thresholds = true;
            }
            else
            {
                __input_error("Player ", __index, " gamepad axis thresholds are corrupted");
                exit;
            }
        }
        
        var _axis_thresholds_dict = _json.__axis_thresholds;
        var _axis_name_array = variable_struct_get_names(_axis_thresholds_dict);
        var _a = 0;
        
        repeat (array_length(_axis_name_array))
        {
            var _axis_name = _axis_name_array[_a];
            var _new_thresholds_struct = variable_struct_get(_axis_thresholds_dict, _axis_name);
            
            if (!is_struct(_new_thresholds_struct))
            {
                __input_error("Player ", __index, " gamepad axis thresholds are corrupted");
                exit;
            }
            
            if (_legacy_thresholds)
            {
                variable_struct_set(__axis_thresholds_dict, _axis_name, 
                {
                    __mini: variable_struct_get(_new_thresholds_struct, "mini"),
                    __maxi: variable_struct_get(_new_thresholds_struct, "maxi")
                });
            }
            else
            {
                variable_struct_set(__axis_thresholds_dict, _axis_name, 
                {
                    __mini: _new_thresholds_struct.__mini,
                    __maxi: _new_thresholds_struct.__maxi
                });
            }
            
            _a++;
        }
        
        if (variable_struct_exists(_json, "gyro"))
        {
            if (!is_struct(_json.gyro))
            {
                __input_error("Player ", __index, " gyro parameters are corrupted");
                exit;
            }
            
            _json.__gyro = _json.gyro;
            __gyro_axis_x = variable_struct_get(_json.__gyro, "axis_x");
            __gyro_axis_y = variable_struct_get(_json.__gyro, "axis_y");
            __gyro_sensitivity_x = variable_struct_get(_json.__gyro, "sensitivity_x");
            __gyro_sensitivity_y = variable_struct_get(_json.__gyro, "sensitivity_y");
        }
        else if (variable_struct_exists(_json, "__gyro"))
        {
            if (!is_struct(_json.__gyro))
            {
                __input_error("Player ", __index, " gyro parameters are corrupted");
                exit;
            }
            
            __gyro_axis_x = _json.__gyro.__axis_x;
            __gyro_axis_y = _json.__gyro.__axis_y;
            __gyro_sensitivity_x = _json.__gyro.__sensitivity_x;
            __gyro_sensitivity_y = _json.__gyro.__sensitivity_y;
        }
        else
        {
            __input_trace("Warning! Player ", __index, " gyro parameters not found, using defaults");
            __gyro_axis_x = (1 << 0);
            __gyro_axis_y = (0 << 0);
            __gyro_sensitivity_x = 2;
            __gyro_sensitivity_y = -2;
        }
        
        if (variable_struct_exists(_json, "gamepad_type_override"))
            _json.__gamepad_type_override = variable_struct_get(_json, "gamepad_type_override");
        
        if (variable_struct_exists(_json, "__gamepad_type_override"))
        {
            var _gamepad_type_override = _json.__gamepad_type_override ?? undefined;
            
            if (!is_string(_gamepad_type_override) && !is_undefined(_gamepad_type_override))
            {
                __input_error("Player ", __index, " gamepad type override is corrupted");
                exit;
            }
            
            __gamepad_type_override = _gamepad_type_override;
        }
        else
        {
            __input_trace("Warning! Player ", __index, " gamepad type override not found, defaulting to <undefined>");
            __gamepad_type_override = undefined;
        }
        
        if (variable_struct_exists(_json, "vibration_strength"))
            _json.__vibration_strength = variable_struct_get(_json, "vibration_strength");
        
        if (variable_struct_exists(_json, "__vibration_strength"))
        {
            if (!is_numeric(_json.__vibration_strength))
            {
                __input_error("Player ", __index, " vibration strength is corrupted");
                exit;
            }
            
            __vibration_strength = _json.__vibration_strength;
        }
        else
        {
            __input_trace("Warning! Player ", __index, " vibration strength not found, defaulting to ", 1);
            __vibration_strength = 1;
        }
        
        if (variable_struct_exists(_json, "trigger_effect_strength"))
            _json.__trigger_effect_strength = variable_struct_get(_json, "trigger_effect_strength");
        
        if (variable_struct_exists(_json, "__trigger_effect_strength"))
        {
            if (!is_numeric(__trigger_effect_strength))
            {
                __input_error("Player ", __index, " trigger effect strength is corrupted");
                exit;
            }
            
            __trigger_effect_strength = 1;
        }
        else
        {
            __input_trace("Warning! Player ", __index, " trigger effect strength not found, defaulting to ", 1);
            __vibration_strength = 1;
        }
        
        if (variable_struct_exists(_json, "cursor_inverted"))
            _json.__cursor_inverted = variable_struct_get(_json, "cursor_inverted");
        
        if (variable_struct_exists(_json, "__cursor_inverted"))
        {
            if (!is_bool(__cursor_inverted))
            {
                __input_error("Player ", __index, " cursor inversion is corrupted");
                exit;
            }
            
            __cursor_inverted = false;
        }
        else
        {
            __input_trace("Warning! Player ", __index, " cursor inversion not found, defaulting to <false>");
            __cursor_inverted = false;
        }
    };
    
    static __reset = function()
    {
        var _profile_name_array = variable_struct_get_names(__profiles_dict);
        var _i = 0;
        
        repeat (array_length(_profile_name_array))
        {
            var _profile_name = _profile_name_array[_i];
            
            if (!variable_struct_exists(__global.__default_profile_dict, _profile_name))
                __profile_destroy(_profile_name);
            else
                __profile_reset_bindings(_profile_name);
            
            _i++;
        }
        
        __axis_thresholds_dict = {};
        __gamepad_type_override = undefined;
        __vibration_strength = 1;
        __gyro_axis_x = (1 << 0);
        __gyro_axis_y = (0 << 0);
        __gyro_sensitivity_x = 2;
        __gyro_sensitivity_y = -2;
        __cursor_inverted = false;
    };
    
    static __vibration_add_event = function(argument0)
    {
        if (__vibration_paused && !argument0.__force)
            __input_trace("Warning! New vibration event ignored, player ", __index, " vibration is paused");
        else
            array_push(__vibration_event_array, argument0);
    };
    
    static __trigger_effect_set = function(argument0, argument1, argument2)
    {
        var _gamepad = __source_get_gamepad();
        
        if (_gamepad < 0 || !is_struct(argument1))
            exit;
        
        if (__trigger_effect_paused)
        {
            __input_trace("Warning! New trigger effect ignored, player ", __index, " trigger effect is paused");
            exit;
        }
        
        var _intercepted = __global.__gamepads[_gamepad].__trigger_effect_apply(argument0, argument1, __trigger_effect_strength) == false;
        
        if (!argument2)
            exit;
        
        if (argument0 == 32775)
        {
            __trigger_intercepted_left = _intercepted;
            __trigger_effect_left = argument1;
        }
        else if (argument0 == 32776)
        {
            __trigger_intercepted_right = _intercepted;
            __trigger_effect_right = argument1;
        }
        else
        {
            __input_error("Value ", argument0, " not a gamepad trigger");
            return false;
        }
    };
    
    static __trigger_effect_pause = function(argument0)
    {
        __trigger_effect_paused = argument0;
        
        if (!argument0)
        {
            __input_player_apply_trigger_effects(__index);
        }
        else
        {
            var _gamepad = __source_get_gamepad();
            
            if (_gamepad < 0)
                exit;
            
            __input_gamepad_stop_trigger_effects(_gamepad);
        }
    };
    
    static __motion_data_get = function()
    {
        static __mixed_motion = {};
        
        if (__global.__source_mode == (3 << 0) && __gyro_gamepad == undefined)
        {
            with (__mixed_motion)
            {
                __acceleration_x = 0;
                __acceleration_y = 0;
                __acceleration_z = 0;
                __angular_velocity_x = 0;
                __angular_velocity_y = 0;
                __angular_velocity_z = 0;
            }
            
            var _source_motion = undefined;
            var _motion_names = variable_struct_get_names(__mixed_motion);
            var _using_motion = false;
            var _name = 0;
            var _gamepad = 0;
            
            repeat (array_length(__global.__gamepads))
            {
                if (!is_struct(__global.__gamepads[_gamepad]))
                    continue;
                
                _using_motion = true;
                _source_motion = __global.__gamepads[_gamepad].__motion.__tick();
                _name = 0;
                
                repeat (array_length(_motion_names))
                {
                    variable_struct_set(__mixed_motion, array_get(_motion_names, _name), variable_struct_get(__mixed_motion, array_get(_motion_names, _name)) + variable_struct_get(_source_motion, array_get(_motion_names, _name)));
                    _name++;
                }
                
                _gamepad++;
            }
            
            if (!_using_motion)
                __mixed_motion.__acceleration_y = -1;
            
            return __mixed_motion;
        }
        
        var _gamepad_index = __gyro_gamepad;
        
        if (__global.__source_mode != (4 << 0) || __gyro_gamepad == undefined)
            _gamepad_index = __source_get_gamepad();
        
        if (_gamepad_index < 0 || !is_struct(__global.__gamepads[_gamepad_index].__motion))
            return undefined;
        
        return __global.__gamepads[_gamepad_index].__motion.__tick();
    };
    
    static __gyro_enabled_set = function(argument0)
    {
        if (argument0)
        {
            __gyro_screen_width = display_get_width();
            __gyro_screen_height = display_get_height();
            
            switch (__global.__pointer_coord_space)
            {
                case (0 << 0):
                    var _view_active = false;
                    
                    try
                    {
                        _view_active = view_enabled && view_visible[0];
                    }
                    catch (_error)
                    {
                        __input_trace("Warning! Failed to determine whether a view is active");
                    }
                    
                    if (_view_active)
                    {
                        var _camera = view_camera[0];
                        __gyro_screen_width = camera_get_view_width(_camera);
                        __gyro_screen_height = camera_get_view_height(_camera);
                    }
                    else
                    {
                        __gyro_screen_width = room_width;
                        __gyro_screen_height = room_height;
                    }
                    
                    break;
                
                case (1 << 0):
                    __gyro_screen_width = display_get_gui_width();
                    __gyro_screen_height = display_get_gui_height();
                    break;
                
                case (2 << 0):
                    if (!((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || os_type == os_switch) && window_get_width != undefined)
                    {
                        __gyro_screen_width = window_get_width();
                        __gyro_screen_height = window_get_height();
                    }
                    
                    break;
            }
        }
        
        __gyro_enabled = argument0;
    };
    
    static __mouse_enabled_set = function(argument0)
    {
        __mouse_enabled = argument0;
    };
    
    static __tick = function()
    {
        if (__ghost)
        {
            __connected = true;
            __post_disconnection_tick = false;
        }
        else
        {
            __connected = false;
            var _i = 0;
            
            repeat (array_length(__source_array))
            {
                if (__source_array[_i].__is_connected())
                {
                    __connected = true;
                    __post_disconnection_tick = false;
                    break;
                }
                
                _i++;
            }
        }
        
        if (!__post_disconnection_tick)
        {
            if (__rebind_state > 0)
                __tick_binding_scan();
            
            var _v = 0;
            
            repeat (array_length(__global.__all_verb_array))
            {
                variable_struct_get(__verb_state_dict, __global.__all_verb_array[_v]).__clear();
                _v++;
            }
            
            __input_player_tick_sources(self);
            __tick_basic_verbs();
            __tick_chord_verbs();
            __tick_combo_verbs();
            __cursor.__tick();
            __tick_vibration();
            
            if (!__connected)
                __post_disconnection_tick = true;
        }
    };
    
    static __tick_basic_verbs = function()
    {
        var _v = 0;
        
        repeat (array_length(__global.__basic_verb_array))
        {
            variable_struct_get(__verb_state_dict, __global.__basic_verb_array[_v]).__tick(__verb_group_state_dict, __active);
            _v++;
        }
    };
    
    static __tick_chord_verbs = function()
    {
        var _i = 0;
        
        repeat (array_length(__global.__chord_verb_array))
        {
            var _chord_name = __global.__chord_verb_array[_i];
            
            if (variable_struct_get(__chord_state_dict, _chord_name).__evaluate(__verb_state_dict))
            {
                with (variable_struct_get(__verb_state_dict, _chord_name))
                {
                    __value = 1;
                    __raw = 1;
                    __tick(other.__verb_group_state_dict, other.__active);
                }
            }
            else
            {
                variable_struct_get(__verb_state_dict, _chord_name).__tick(__verb_group_state_dict, __active);
            }
            
            _i++;
        }
    };
    
    static __tick_combo_verbs = function()
    {
        var _i = 0;
        
        repeat (array_length(__global.__combo_verb_array))
        {
            var _combo_name = __global.__combo_verb_array[_i];
            
            if (variable_struct_get(__combo_state_dict, _combo_name).__evaluate(__verb_state_dict))
            {
                with (variable_struct_get(__verb_state_dict, _combo_name))
                {
                    __value = 1;
                    __raw = 1;
                    __tick(other.__verb_group_state_dict, other.__active);
                }
            }
            else
            {
                variable_struct_get(__verb_state_dict, _combo_name).__tick(__verb_group_state_dict, __active);
            }
            
            _i++;
        }
    };
    
    static __tick_vibration = function()
    {
        if (__connected && __global.__source_mode != (3 << 0) && __global.__source_mode != (4 << 0))
        {
            var _gamepad_index = __source_get_gamepad();
            
            if (_gamepad_index < 0)
                exit;
            
            var _not_paused = !__vibration_paused;
            var _left = 0;
            var _right = 0;
            var _time_step = __input_get_time() - __input_get_previous_time();
            var _array = __vibration_event_array;
            var _i = 0;
            
            repeat (array_length(_array))
            {
                var _result;
                
                with (_array[_i])
                {
                    if (_not_paused || __force)
                    {
                        _result = __tick(_time_step);
                        _left += __output_left;
                        _right += __output_right;
                    }
                    else
                    {
                        _result = true;
                    }
                }
                
                if (_result)
                    _i++;
                else
                    array_delete(_array, _i, 1);
            }
            
            __global.__gamepads[_gamepad_index].__vibration_set(__vibration_strength * _left, __vibration_strength * _right);
        }
    };
    
    static __color_set = function(argument0)
    {
        var _i = 0;
        
        repeat (array_length(__source_array))
        {
            if (__source_array[_i].__source == (2 << 0))
            {
                with (__global.__gamepads[__source_array[_i].__gamepad])
                    __color_set(argument0);
            }
            
            _i++;
        }
        
        __color = argument0;
    };
    
    static __tick_binding_scan = function()
    {
        var _source_filter = __rebind_source_filter ?? __source_array;
        
        if (__source_contains(__input_global().__source_touch, false))
        {
            __input_trace("Binding scan failed: Player ", __index, " is using INPUT_TOUCH which cannot be rebound");
            __binding_scan_failure((-10 << 0));
            exit;
        }
        
        if (array_length(__source_array) <= 0)
        {
            __input_trace("Binding scan failed: Source array for player ", __index, " is empty (the player has no source assigned)");
            __binding_scan_failure((-10 << 0));
            exit;
        }
        
        if (array_length(_source_filter) <= 0)
        {
            __input_trace("Binding scan failed: Source filter array for player ", __index, " is empty (no sources are permitted)");
            __binding_scan_failure((-15 << 0));
            exit;
        }
        
        if (__ghost)
        {
            __input_trace("Binding scan failed: Player ", __index, " is a ghost");
            __binding_scan_failure((-15 << 0));
            exit;
        }
        
        if (!__active)
        {
            __input_trace("Binding scan failed: Player ", __index, " is inactive");
            __binding_scan_failure((-17 << 0));
            exit;
        }
        
        if (!__connected)
        {
            __input_trace("Binding scan failed: Player ", __index, " disconnected");
            __binding_scan_failure((-16 << 0));
            exit;
        }
        
        if ((__global.__current_time - __rebind_start_time) > 10000)
        {
            __input_trace("Binding scan failed: Timed out");
            __binding_scan_failure((-20 << 0));
            exit;
        }
        
        if (__rebind_state == 1)
        {
            if (!__sources_any_rebind_allowed_input())
            {
                __input_trace("Now scanning for a new binding from player ", __index);
                __rebind_state = 2;
            }
        }
        else if (__rebind_state == 2)
        {
            var _new_binding = undefined;
            var _binding_source = undefined;
            var _i = 0;
            
            repeat (array_length(_source_filter))
            {
                if (__global.__use_is_instanceof)
                {
                    if (!is_instanceof(_source_filter[_i], __input_class_source))
                        __input_error("Value in filter array is not a source (index ", _i, ", ", _source_filter[_i], ")");
                }
                else if (instanceof(_source_filter[_i]) != "__input_class_source")
                {
                    __input_error("Value in filter array is not a source (index ", _i, ", ", _source_filter[_i], ")");
                }
                
                var _source_binding = _source_filter[_i].__scan_for_binding(__index, false, __rebind_ignore_struct, __rebind_allow_struct);
                
                if (_source_binding != undefined)
                {
                    _new_binding = _source_binding;
                    _binding_source = _source_filter[_i];
                }
                
                _i++;
            }
            
            if (input_value_is_binding(_new_binding))
                __binding_scan_success(_new_binding);
        }
    };
    
    static __binding_scan_success = function(argument0)
    {
        __input_trace("Binding found for player ", __index, ": \"", argument0, "\"");
        __rebind_state = 0;
        
        if (is_method(__rebind_success_callback))
            __rebind_success_callback(argument0);
        else if (is_numeric(__rebind_success_callback) && script_exists(__rebind_success_callback))
            script_execute(__rebind_success_callback, argument0);
        else if (__rebind_success_callback != undefined)
            __input_error("Binding scan success callback set to an illegal value (typeof=", typeof(__rebind_success_callback), ")");
    };
    
    static __binding_scan_failure = function(argument0)
    {
        __input_trace("Binding scan for player ", __index, " failed (error=", argument0, ")");
        __rebind_state = 0;
        
        if (is_method(__rebind_failure_callback))
            __rebind_failure_callback(argument0);
        else if (is_numeric(__rebind_failure_callback) && script_exists(__rebind_failure_callback))
            script_execute(__rebind_failure_callback, argument0);
        else if (__rebind_failure_callback != undefined)
            __input_error("Binding scan failure callback set to an illegal value (typeof=", typeof(__rebind_failure_callback), ")");
    };
    
    __index = undefined;
    __source_array = [];
    __verb_state_dict = {};
    __chord_state_dict = {};
    __combo_state_dict = {};
    __last_input_time = -infinity;
    __verb_group_state_dict = {};
    __vibration_paused = false;
    __vibration_strength = 1;
    __vibration_event_array = [];
    __trigger_effect_paused = false;
    __trigger_effect_strength = 1;
    __trigger_intercepted_left = false;
    __trigger_intercepted_right = false;
    __trigger_effect_left = undefined;
    __trigger_effect_right = undefined;
    __color = undefined;
    __rebind_state = 0;
    __rebind_start_time = __global.__current_time;
    __rebind_success_callback = undefined;
    __rebind_failure_callback = undefined;
    __rebind_source_filter = undefined;
    __rebind_ignore_struct = undefined;
    __rebind_allow_struct = undefined;
    __axis_thresholds_dict = {};
    __profiles_dict = {};
    __profile_name = undefined;
    __active = true;
    __ghost = false;
    __gamepad_type_override = undefined;
    __connected = false;
    __post_disconnection_tick = false;
    __cursor = new __input_class_cursor();
    __cursor.__player = self;
    __cursor_inverted = false;
    __mouse_enabled = true;
    __gyro_gamepad = undefined;
    __gyro_axis_x = (1 << 0);
    __gyro_axis_y = (0 << 0);
    __gyro_sensitivity_x = 2;
    __gyro_sensitivity_y = -2;
    __gyro_enabled_set(true);
    __gyro_enabled = false;
}
