function input_cursor_dy(argument0 = 0, argument1 = undefined)
{
    static _global = __input_global();
    
    if (argument0 < 0)
    {
        __input_error("Invalid player index provided (", argument0, ")");
        return undefined;
    }
    
    if (argument0 >= 1)
    {
        __input_error("Player index too large (", argument0, " must be less than ", 1, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    var _cursor = _global.__players[argument0].__cursor;
    return __input_transform_coordinate(_cursor.__x - _cursor.__prev_x, _cursor.__y - _cursor.__prev_y, _cursor.__coord_space, argument1 ?? _cursor.__coord_space).y;
}
