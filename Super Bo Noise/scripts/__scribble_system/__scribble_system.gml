__scribble_initialize();
__scribble_font_add_all_from_project();

function __scribble_initialize()
{
    static _system = undefined;
    
    if (_system != undefined)
        return _system;
    
    _system = {};
    
    with (_system)
    {
        __scribble_trace("Welcome to Scribble by Juju Adams! This is version 9.0.0, 2024-03-10");
        __scribble_trace("Verbose mode is off, set SCRIBBLE_VERBOSE to <true> to see more information");
        
        try
        {
            time_source_start(time_source_create(0, 1, 1, function()
            {
                __scribble_tick();
            }, [], -1));
        }
        catch (_error)
        {
            __scribble_trace(_error);
            __scribble_error("Versions earlier than GameMaker 2022 LTS are not supported");
        }
        
        __scribble_get_state();
        __scribble_get_generator_state();
        __scribble_glyph_data_initialize();
        __scribble_get_font_data_map();
        __scribble_config_colours();
        __scribble_get_buffer_a();
        __scribble_get_buffer_b();
        __scribble_get_anim_properties();
        __scribble_effects_maps_initialize();
        __scribble_typewrite_events_map_initialize();
        __scribble_krutidev_lookup_map_initialize();
        __scribble_krutidev_matra_lookup_map_initialize();
        scribble_anim_reset();
        __useHandleParse = false;
        
        try
        {
            handle_parse(string(__scribble_initialize));
            __useHandleParse = true;
            __scribble_trace("Using handle_parse() where possible");
        }
        catch (_error)
        {
            __scribble_trace("handle_parse() not available");
        }
    }
    
    return _system;
}

function __scribble_trace()
{
    var _string = "Scribble Deluxe: ";
    var _i = 0;
    
    repeat (argument_count)
    {
        if (is_real(argument[_i]))
            _string += string_format(argument[_i], 0, 4);
        else
            _string += string(argument[_i]);
        
        _i++;
    }
    
    show_debug_message(_string);
}

function __scribble_loud()
{
    var _string = "Scribble Deluxe:\n";
    var _i = 0;
    
    repeat (argument_count)
    {
        if (is_real(argument[_i]))
            _string += string_format(argument[_i], 0, 4);
        else
            _string += string(argument[_i]);
        
        _i++;
    }
    
    show_debug_message(_string);
    show_message(_string);
}

function __scribble_error()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    show_debug_message("Scribble Deluxe 9.0.0: " + string_replace_all(_string, "\n", "\n          "));
    //show_error("Scribble Deluxe:\n" + _string + "\n ", true);
}

function __scribble_get_font_data(argument0)
{
    static _font_data_map = __scribble_get_font_data_map();
    
    var _data = ds_map_find_value(_font_data_map, argument0);
    
    if (_data == undefined)
        __scribble_error("Font \"", argument0, "\" not recognised");
    
    return _data;
}

function __scribble_process_colour(argument0)
{
    static _colors_struct = __scribble_config_colours();
    
    if (is_string(argument0))
    {
        if (!variable_struct_exists(_colors_struct, argument0))
            __scribble_error("Colour \"", argument0, "\" not recognised. Please add it to __scribble_config_colours()");
        
        return variable_struct_get(_colors_struct, argument0) & 16777215;
    }
    else
    {
        return argument0;
    }
}

function __scribble_random()
{
    static _lcg = date_current_datetime() * 100;
    
    _lcg = (48271 * _lcg) % 2147483647;
    return _lcg / 2147483648;
}

function __scribble_array_find_index(argument0, argument1)
{
    var _i = 0;
    
    repeat (array_length(argument0))
    {
        if (argument0[_i] == argument1)
            return _i;
        
        _i++;
    }
    
    return -1;
}

function __scribble_asset_is_krutidev(argument0, argument1)
{
    var _tags_array = asset_get_tags(argument0, argument1);
    var _i = 0;
    
    repeat (array_length(_tags_array))
    {
        var _tag = _tags_array[_i];
        
        if (_tag == "scribble krutidev" || _tag == "Scribble krutidev" || _tag == "Scribble Krutidev")
            return true;
        
        _i++;
    }
    
    return false;
}

function __scribble_buffer_read_unicode(argument0)
{
    var _value = buffer_read(argument0, buffer_u8);
    
    if ((_value & 224) == 192)
    {
        _value = (_value & 31) << 6;
        _value += (buffer_read(argument0, buffer_u8) & 63);
    }
    else if ((_value & 240) == 224)
    {
        _value = (_value & 15) << 12;
        _value += ((buffer_read(argument0, buffer_u8) & 63) << 6);
        _value += (buffer_read(argument0, buffer_u8) & 63);
    }
    else if ((_value & 248) == 240)
    {
        _value = (_value & 7) << 18;
        _value += ((buffer_read(argument0, buffer_u8) & 63) << 12);
        _value += ((buffer_read(argument0, buffer_u8) & 63) << 6);
        _value += (buffer_read(argument0, buffer_u8) & 63);
    }
    
    return _value;
}

function __scribble_buffer_peek_unicode(argument0, argument1)
{
    var _value = buffer_peek(argument0, argument1, buffer_u8);
    
    if ((_value & 224) == 192)
    {
        _value = (_value & 31) << 6;
        _value += (buffer_peek(argument0, argument1 + 1, buffer_u8) & 63);
    }
    else if ((_value & 240) == 224)
    {
        _value = (_value & 15) << 12;
        _value += ((buffer_peek(argument0, argument1 + 1, buffer_u8) & 63) << 6);
        _value += (buffer_peek(argument0, argument1 + 2, buffer_u8) & 63);
    }
    else if ((_value & 248) == 240)
    {
        _value = (_value & 7) << 18;
        _value += ((buffer_peek(argument0, argument1 + 1, buffer_u8) & 63) << 12);
        _value += ((buffer_peek(argument0, argument1 + 2, buffer_u8) & 63) << 6);
        _value += (buffer_peek(argument0, argument1 + 3, buffer_u8) & 63);
    }
    
    return _value;
}

function __scribble_buffer_write_unicode(argument0, argument1)
{
    if (argument1 <= 127)
    {
        buffer_write(argument0, buffer_u8, argument1);
    }
    else if (argument1 <= 2047)
    {
        buffer_write(argument0, buffer_u8, 192 | (argument1 & 31));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 5) & 63));
    }
    else if (argument1 <= 65535)
    {
        buffer_write(argument0, buffer_u8, 192 | (argument1 & 15));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 4) & 63));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 10) & 63));
    }
    else if (argument1 <= 65536)
    {
        buffer_write(argument0, buffer_u8, 192 | (argument1 & 7));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 3) & 63));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 9) & 63));
        buffer_write(argument0, buffer_u8, 128 | ((argument1 >> 15) & 63));
    }
}

function __scribble_image_speed_get(argument0)
{
    return (sprite_get_speed_type(argument0) == 1) ? sprite_get_speed(argument0) : (sprite_get_speed(argument0) / game_get_speed(gamespeed_fps));
}

function __scribble_matrix_inverse(argument0)
{
    var _inv = array_create(16, undefined);
    _inv[0] = (((argument0[5] * argument0[10] * argument0[15]) - (argument0[5] * argument0[11] * argument0[14]) - (argument0[9] * argument0[6] * argument0[15])) + (argument0[9] * argument0[7] * argument0[14]) + (argument0[13] * argument0[6] * argument0[11])) - (argument0[13] * argument0[7] * argument0[10]);
    _inv[4] = (((-argument0[4] * argument0[10] * argument0[15]) + (argument0[4] * argument0[11] * argument0[14]) + (argument0[8] * argument0[6] * argument0[15])) - (argument0[8] * argument0[7] * argument0[14]) - (argument0[12] * argument0[6] * argument0[11])) + (argument0[12] * argument0[7] * argument0[10]);
    _inv[8] = (((argument0[4] * argument0[9] * argument0[15]) - (argument0[4] * argument0[11] * argument0[13]) - (argument0[8] * argument0[5] * argument0[15])) + (argument0[8] * argument0[7] * argument0[13]) + (argument0[12] * argument0[5] * argument0[11])) - (argument0[12] * argument0[7] * argument0[9]);
    _inv[12] = (((-argument0[4] * argument0[9] * argument0[14]) + (argument0[4] * argument0[10] * argument0[13]) + (argument0[8] * argument0[5] * argument0[14])) - (argument0[8] * argument0[6] * argument0[13]) - (argument0[12] * argument0[5] * argument0[10])) + (argument0[12] * argument0[6] * argument0[9]);
    _inv[1] = (((-argument0[1] * argument0[10] * argument0[15]) + (argument0[1] * argument0[11] * argument0[14]) + (argument0[9] * argument0[2] * argument0[15])) - (argument0[9] * argument0[3] * argument0[14]) - (argument0[13] * argument0[2] * argument0[11])) + (argument0[13] * argument0[3] * argument0[10]);
    _inv[5] = (((argument0[0] * argument0[10] * argument0[15]) - (argument0[0] * argument0[11] * argument0[14]) - (argument0[8] * argument0[2] * argument0[15])) + (argument0[8] * argument0[3] * argument0[14]) + (argument0[12] * argument0[2] * argument0[11])) - (argument0[12] * argument0[3] * argument0[10]);
    _inv[9] = (((-argument0[0] * argument0[9] * argument0[15]) + (argument0[0] * argument0[11] * argument0[13]) + (argument0[8] * argument0[1] * argument0[15])) - (argument0[8] * argument0[3] * argument0[13]) - (argument0[12] * argument0[1] * argument0[11])) + (argument0[12] * argument0[3] * argument0[9]);
    _inv[13] = (((argument0[0] * argument0[9] * argument0[14]) - (argument0[0] * argument0[10] * argument0[13]) - (argument0[8] * argument0[1] * argument0[14])) + (argument0[8] * argument0[2] * argument0[13]) + (argument0[12] * argument0[1] * argument0[10])) - (argument0[12] * argument0[2] * argument0[9]);
    _inv[2] = (((argument0[1] * argument0[6] * argument0[15]) - (argument0[1] * argument0[7] * argument0[14]) - (argument0[5] * argument0[2] * argument0[15])) + (argument0[5] * argument0[3] * argument0[14]) + (argument0[13] * argument0[2] * argument0[7])) - (argument0[13] * argument0[3] * argument0[6]);
    _inv[6] = (((-argument0[0] * argument0[6] * argument0[15]) + (argument0[0] * argument0[7] * argument0[14]) + (argument0[4] * argument0[2] * argument0[15])) - (argument0[4] * argument0[3] * argument0[14]) - (argument0[12] * argument0[2] * argument0[7])) + (argument0[12] * argument0[3] * argument0[6]);
    _inv[10] = (((argument0[0] * argument0[5] * argument0[15]) - (argument0[0] * argument0[7] * argument0[13]) - (argument0[4] * argument0[1] * argument0[15])) + (argument0[4] * argument0[3] * argument0[13]) + (argument0[12] * argument0[1] * argument0[7])) - (argument0[12] * argument0[3] * argument0[5]);
    _inv[14] = (((-argument0[0] * argument0[5] * argument0[14]) + (argument0[0] * argument0[6] * argument0[13]) + (argument0[4] * argument0[1] * argument0[14])) - (argument0[4] * argument0[2] * argument0[13]) - (argument0[12] * argument0[1] * argument0[6])) + (argument0[12] * argument0[2] * argument0[5]);
    _inv[3] = (((-argument0[1] * argument0[6] * argument0[11]) + (argument0[1] * argument0[7] * argument0[10]) + (argument0[5] * argument0[2] * argument0[11])) - (argument0[5] * argument0[3] * argument0[10]) - (argument0[9] * argument0[2] * argument0[7])) + (argument0[9] * argument0[3] * argument0[6]);
    _inv[7] = (((argument0[0] * argument0[6] * argument0[11]) - (argument0[0] * argument0[7] * argument0[10]) - (argument0[4] * argument0[2] * argument0[11])) + (argument0[4] * argument0[3] * argument0[10]) + (argument0[8] * argument0[2] * argument0[7])) - (argument0[8] * argument0[3] * argument0[6]);
    _inv[11] = (((-argument0[0] * argument0[5] * argument0[11]) + (argument0[0] * argument0[7] * argument0[9]) + (argument0[4] * argument0[1] * argument0[11])) - (argument0[4] * argument0[3] * argument0[9]) - (argument0[8] * argument0[1] * argument0[7])) + (argument0[8] * argument0[3] * argument0[5]);
    _inv[15] = (((argument0[0] * argument0[5] * argument0[10]) - (argument0[0] * argument0[6] * argument0[9]) - (argument0[4] * argument0[1] * argument0[10])) + (argument0[4] * argument0[2] * argument0[9]) + (argument0[8] * argument0[1] * argument0[6])) - (argument0[8] * argument0[2] * argument0[5]);
    var _det = (argument0[0] * _inv[0]) + (argument0[1] * _inv[4]) + (argument0[2] * _inv[8]) + (argument0[3] * _inv[12]);
    
    if (_det == 0)
    {
        __scribble_trace("Warning! Determinant of the matrix is zero");
        return argument0;
    }
    
    _det = 1 / _det;
    _inv[0] *= _det;
    _inv[1] *= _det;
    _inv[2] *= _det;
    _inv[3] *= _det;
    _inv[4] *= _det;
    _inv[5] *= _det;
    _inv[6] *= _det;
    _inv[7] *= _det;
    _inv[8] *= _det;
    _inv[9] *= _det;
    _inv[10] *= _det;
    _inv[11] *= _det;
    _inv[12] *= _det;
    _inv[13] *= _det;
    _inv[14] *= _det;
    _inv[15] *= _det;
    return _inv;
}
