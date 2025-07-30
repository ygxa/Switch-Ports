function input_check_opposing_pressed(argument0, argument1, argument2 = 0, argument3 = false)
{
    var _pressed_n = input_check_pressed(argument0, argument2);
    var _pressed_p = input_check_pressed(argument1, argument2);
    
    if (argument3)
    {
        var _value = 0;
        
        if (_pressed_p)
            _value++;
        
        if (_pressed_n)
            _value--;
        
        return _value;
    }
    else
    {
        if (!_pressed_n && !_pressed_p)
            return 0;
        
        var _held_n = input_check(argument0, argument2);
        var _held_p = input_check(argument1, argument2);
        
        if (_pressed_p && !_held_n)
            return 1;
        
        if (_pressed_n && !_held_p)
            return -1;
        
        return 0;
    }
}
