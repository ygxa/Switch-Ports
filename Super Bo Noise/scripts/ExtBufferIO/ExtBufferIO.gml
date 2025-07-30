function ext_buffer_unpack(argument0, argument1 = false)
{
    var _type = buffer_read(argument0, buffer_u8);
    
    switch (_type)
    {
        case 254:
            var _size = buffer_read(argument0, buffer_u16);
            var _array = array_create(_size);
            
            for (var _i = 0; _i < _size; _i++)
                _array[_i] = ext_buffer_unpack(argument0, argument1);
            
            return _array;
        
        case 250:
            _size = buffer_read(argument0, buffer_u16);
            var _elem_type = buffer_read(argument0, buffer_u8);
            _array = array_create(_size);
            
            for (var _i = 0; _i < _size; _i++)
                _array[_i] = buffer_read(argument0, _elem_type);
            
            return _array;
        
        case 255:
            _size = buffer_read(argument0, buffer_u16);
            
            if (argument1)
            {
                var _map = ds_map_create();
                
                for (var _i = 0; _i < _size; _i++)
                {
                    var _key = ext_buffer_unpack(argument0);
                    var _value = ext_buffer_unpack(argument0);
                    ds_map_add(_map, _key, _value);
                }
                
                return _map;
            }
            else
            {
                var _struct = {};
                
                for (var _i = 0; _i < _size; _i++)
                {
                    var _key = ext_buffer_unpack(argument0);
                    var _value = ext_buffer_unpack(argument0);
                    struct_set(_struct, _key, _value);
                }
                
                return _struct;
            }
        
        case 251:
            return undefined;
        
        default:
            return buffer_read(argument0, _type);
    }
}

function ext_buffer_pack(argument0, argument1, argument2 = undefined)
{
    if (is_array(argument1))
    {
        var _length = array_length(argument1);
        buffer_write(argument0, buffer_u8, 254);
        buffer_write(argument0, buffer_u16, _length);
        
        for (var _i = 0; _i < _length; _i++)
            ext_buffer_pack(argument0, argument1[_i], argument2);
    }
    else if (is_struct(argument1))
    {
        var _names = struct_get_names(argument1);
        var _length = array_length(_names);
        buffer_write(argument0, buffer_u8, 255);
        buffer_write(argument0, buffer_u16, _length);
        
        for (var _i = 0; _i < _length; _i++)
        {
            var _key = _names[_i];
            buffer_write(argument0, buffer_string, _key);
            ext_buffer_pack(argument0, variable_struct_get(argument1, _key), argument2);
        }
    }
    else if (!is_undefined(argument2))
    {
        buffer_write(argument0, buffer_u8, argument2);
        
        if (argument2 == 253)
        {
            var _length = is_undefined(argument1) ? 0 : buffer_get_size(argument1);
            var _address = is_undefined(argument1) ? ptr(0) : buffer_get_address(argument1);
            buffer_write(argument0, buffer_u32, _length);
            buffer_write(argument0, buffer_u64, _address);
        }
        else if (argument2 == 252)
        {
            var _address = is_undefined(argument1) ? 0 : argument1;
            buffer_write(argument0, buffer_u64, _address);
        }
        else
        {
            buffer_write(argument0, argument2, argument1);
        }
    }
    else if (is_ptr(argument1))
    {
        buffer_write(argument0, buffer_u8, 252);
        buffer_write(argument0, buffer_u64, argument1);
    }
    else if (is_string(argument1))
    {
        buffer_write(argument0, buffer_u8, 11);
        buffer_write(argument0, buffer_string, argument1);
    }
    else if (is_bool(argument1))
    {
        buffer_write(argument0, buffer_u8, 10);
        buffer_write(argument0, buffer_bool, argument1);
    }
    else if (is_int32(argument1))
    {
        buffer_write(argument0, buffer_u8, 6);
        buffer_write(argument0, buffer_s32, argument1);
    }
    else if (is_int64(argument1))
    {
        buffer_write(argument0, buffer_u8, 12);
        buffer_write(argument0, buffer_u64, argument1);
    }
    else if (is_real(argument1))
    {
        buffer_write(argument0, buffer_u8, 9);
        buffer_write(argument0, buffer_f64, argument1);
    }
    else
    {
        //show_debug_message(string("[ERROR] {0} :: Cannot encoding value: '{1}', invalid type.", "gml_Script_ext_buffer_pack", argument1));
    }
}

function ext_pack_args(argument0)
{
    static _ext_args_buffer = buffer_create(1, buffer_grow, 1);
    
    var _length = array_length(argument0);
    buffer_seek(_ext_args_buffer, buffer_seek_start, 0);
    buffer_write(_ext_args_buffer, buffer_u16, _length);
    
    for (var _i = 0; _i < _length; _i++)
    {
        var _arg = argument0[_i];
        ext_buffer_pack(_ext_args_buffer, _arg[0], _arg[1]);
    }
    
    return buffer_get_address(_ext_args_buffer);
}

function ext_return_buffer()
{
    static _return_buffer = buffer_create(2048, buffer_fixed, 1);
    
    buffer_seek(_return_buffer, buffer_seek_start, 0);
    return _return_buffer;
}

function ext_return_buffer_address()
{
    var _buffer = ext_return_buffer();
    buffer_poke(_buffer, 0, buffer_u8, 251);
    return buffer_get_address(_buffer);
}
