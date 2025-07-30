function gamepadvibrate(argument0, argument1, argument2, argument3 = 0, argument4 = false)
{
    if (global.rumble)
        input_vibrate_constant(argument0, argument1, argument2, argument3, argument4);
}
