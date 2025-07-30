function input_distance(argument0, argument1, argument2, argument3, argument4 = undefined, argument5 = false)
{
    var _result = input_xy(argument0, argument1, argument2, argument3, argument4, argument5);
    return point_distance(0, 0, _result.x, _result.y);
}
