function input_radial_sector(argument0, argument1, argument2, argument3, argument4 = 0, argument5 = 360, argument6 = 0, argument7 = 1, argument8 = undefined)
{
    var _result = input_xy(argument0, argument1, argument2, argument3, argument8, false);
    var _distance = point_distance(0, 0, _result.x, _result.y);
    
    if (_distance <= max(0, argument6) || _distance > argument7)
        return false;
    
    if (angle_difference(argument4, argument5) == 0)
        return true;
    
    argument4 %= 360;
    
    if (argument4 < 0)
        argument4 += 360;
    
    argument5 = (argument5 % 360) - argument4;
    
    if (argument5 < 0)
        argument5 += 360;
    
    var _direction = point_direction(0, 0, _result.x, _result.y) - argument4;
    
    if (_direction < 0)
        _direction += 360;
    
    return _direction < argument5;
}
