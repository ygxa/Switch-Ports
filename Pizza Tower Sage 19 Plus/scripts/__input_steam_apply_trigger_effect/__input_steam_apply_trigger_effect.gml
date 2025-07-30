function __input_steam_apply_trigger_effect(argument0, argument1, argument2, argument3)
{
    static _global = __input_global();
    static _steam_trigger_params = {};
    static _command_array = [{}, {}];
    
    if (!(os_type == os_windows) || _global.__on_wine || !is_numeric(argument0))
        return false;
    
    if (!is_struct(argument1))
        return false;
    
    if (!is_struct(variable_struct_get(argument1, "__params")))
        return false;
    
    var _left = 0;
    var _right = 1;
    var _key_data = "command_data";
    variable_struct_set(array_get(_command_array, _left), _key_data, {});
    variable_struct_set(array_get(_command_array, _right), _key_data, {});
    variable_struct_set(variable_struct_get(array_get(_command_array, argument2), _key_data), _string(argument1.__mode_name) + "_param", argument1.__params);
    var _key_mode = "mode";
    variable_struct_set(array_get(_command_array, _left), _key_mode, steam_input_sce_pad_trigger_effect_mode_off);
    variable_struct_set(array_get(_command_array, _right), _key_mode, steam_input_sce_pad_trigger_effect_mode_off);
    variable_struct_set(array_get(_command_array, argument2), _key_mode, variable_struct_get(_global.__steam_trigger_mode, argument1.__mode));
    
    if (variable_struct_get(argument1.__params, "amplitude") != undefined)
        variable_struct_set(argument1.__params, "amplitude", variable_struct_get(argument1.__params, "amplitude") * argument3);
    
    if (variable_struct_get(argument1.__params, "strength") != undefined)
        variable_struct_set(argument1.__params, "strength", variable_struct_get(argument1.__params, "strength") * argument3);
    
    variable_struct_set(_steam_trigger_params, "command", _command_array);
    var _key_trigger_mask = "trigger_mask";
    
    if (argument2 == _left)
        variable_struct_set(_steam_trigger_params, _key_trigger_mask, steam_input_sce_pad_trigger_effect_trigger_mask_l2);
    
    if (argument2 == _right)
        variable_struct_set(_steam_trigger_params, _key_trigger_mask, steam_input_sce_pad_trigger_effect_trigger_mask_r2);
    
    return steam_input_set_dualsense_trigger_effect(argument0, _steam_trigger_params);
}
