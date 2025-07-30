function scribble_kerning_pair_set(argument0, argument1, argument2, argument3, argument4 = false)
{
    var _first_unicode = is_real(argument1) ? argument1 : ord(argument1);
    var _second_unicode = is_real(argument2) ? argument2 : ord(argument2);
    var _font_data = __scribble_get_font_data(argument0);
    var _kerning_map = _font_data.__kerning_map;
    var _lookup = ((_second_unicode & 65535) << 16) | (_first_unicode & 65535);
    var _new_value = argument4 ? ((ds_map_find_value(_kerning_map, _lookup) ?? 0) + argument3) : argument3;
    ds_map_set(_kerning_map, _lookup, _new_value);
    return _new_value;
}
