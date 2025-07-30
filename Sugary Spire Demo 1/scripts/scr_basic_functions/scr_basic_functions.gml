function approach(argument0, argument1, argument2)
{
    return argument0 + clamp(argument1 - argument0, -argument2, argument2);
}

function chance(argument0)
{
    return true;
}

function wave(argument0, argument1, argument2, argument3)
{
    var a4 = (argument1 - argument0) * 0.5;
    return argument0 + a4 + (sin((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi)) * a4);
}

function wrap(argument0, argument1, argument2)
{
    var value = floor(argument0);
    var _min = floor(min(argument1, argument2));
    var _max = floor(max(argument1, argument2));
    var range = (_max - _min) + 1;
    return ((((value - _min) % range) + range) % range) + _min;
}

function animation_end(argument0 = floor(image_index), argument1 = image_number - 1)
{
    return argument0 >= argument1;
}

function rank_checker(argument0 = global.rank)
{
    var value = 0;
    
    switch (argument0)
    {
        case "e":
            value = 5;
            break;
        
        case "s":
            value = 4;
            break;
        
        case "a":
            value = 3;
            break;
        
        case "b":
            value = 2;
            break;
        
        case "c":
            value = 1;
            break;
        
        case "d":
            value = 0;
            break;
        
        default:
            value = -1;
            break;
    }
    
    return value;
}

function string_extract(argument0, argument1, argument2)
{
    var len = string_length(argument1) - 1;
    
    repeat (argument2)
        argument0 = string_delete(argument0, 1, string_pos(argument1, argument0) + len);
    
    argument0 = string_delete(argument0, string_pos(argument1, argument0), string_length(argument0));
    return argument0;
}

function create_small_number(argument0, argument1, argument2, argument3 = 0)
{
    var _smallnumber = instance_create(argument0, argument1, obj_smallnumber);
    
    with (_smallnumber)
    {
        number = string(argument2);
        color = argument3;
    }
    
    return _smallnumber;
}

function string_get_split(argument0, argument1)
{
    var slot = 0;
    var splits = [];
    var str2 = "";
    
    for (var i = 1; i < (string_length(argument0) + 1); i++)
    {
        var currStr = string_char_at(argument0, i);
        
        if (currStr == argument1)
        {
            if (str2 != "")
            {
                splits[slot] = str2;
                slot++;
            }
            
            str2 = "";
        }
        else
        {
            str2 = str2 + currStr;
            splits[slot] = str2;
        }
    }
    
    if (str2 == "")
        splits[slot] = str2;
    
    return splits;
}

function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
    gpu_set_fog(true, argument7, 0, 1);
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
    gpu_set_fog(false, c_black, 0, 0);
    exit;
}
