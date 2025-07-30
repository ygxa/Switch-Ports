function gamepad_check_input(argument0)
{
    for (var i = 32769; i <= 32784; i++)
    {
        if (gamepad_button_check(argument0, i))
            return i;
    }
    
    for (var i = 32785; i <= 32788; i++)
    {
        if (abs(gamepad_axis_value(argument0, i)))
            return i;
    }
}
