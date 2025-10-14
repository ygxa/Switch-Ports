if (global.player_input_device < 0)
{
    visible = false
    active = false
    x = -100
    y = -100
    return;
}
var move = gamepad_axis_value(global.player_input_device, gp_axislh)
var move2 = gamepad_axis_value(global.player_input_device, gp_axislv)
if (!active)
{
    if (abs(move) > 0.2 || abs(move2) > 0.2)
    {
        active = true
        visible = true
        x = xstart
        y = ystart
    }
    return;
}
x += (move * acc)
y += (move2 * acc)
var clickingL = input_check("slap")
var clickingR = input_check("taunt")
clickedL = input_check_pressed("slap")
clickedR = input_check_pressed("taunt")
image_index = (clickingL || clickingR)
x = clamp(x, 0, (960 + 63))
y = clamp(y, 0, (540 + 63))
