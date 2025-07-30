function input_direction(argument0, argument1, argument2, argument3, argument4, argument5 = undefined, argument6 = false)
{
    if (is_string(argument0))
        __input_error("Usage of input_direction() has changed. Please refer to documentation for details");
    
    var _result = input_xy(argument1, argument2, argument3, argument4, argument5, argument6);
    
    if (_result.x == 0 && _result.y == 0)
        return argument0;
    
    return point_direction(0, 0, _result.x, _result.y);
}
