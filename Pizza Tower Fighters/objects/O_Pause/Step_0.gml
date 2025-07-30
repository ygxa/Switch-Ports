controller_initialize(global.P1controllerport);

if (keyboard_check_pressed(vk_escape) || buttonStartPress)
{
    if (!instance_exists(O_Fade) && !instance_exists(o_youwon))
        event_user(TOGGLE_PAUSE);
}

if (PAUSE == true)
{
    var _axis_pressed_left = false;
    var _axis_pressed_right = false;
    var _axis_pressed_down = false;
    var _axis_pressed_up = false;
    
    if (_axis_pressed_left == false && axis_left_prev == false)
    {
        if (gamepad_axis_value(0, gp_axislh) < 0)
            _axis_pressed_left = true;
    }
    
    axis_left_prev = gamepad_axis_value(0, gp_axislh) < 0;
    global.b_left_press = _axis_pressed_left;
    
    if (_axis_pressed_right == false && axis_right_prev == false)
    {
        if (gamepad_axis_value(0, gp_axislh) > 0)
            _axis_pressed_right = true;
    }
    
    axis_right_prev = gamepad_axis_value(0, gp_axislh) > 0;
    global.b_right_press = _axis_pressed_right;
    
    if (_axis_pressed_down == false && axis_down_prev == false)
    {
        if (gamepad_axis_value(0, gp_axislv) > 0)
            _axis_pressed_down = true;
    }
    
    axis_down_prev = gamepad_axis_value(0, gp_axislv) > 0;
    global.b_down_press = _axis_pressed_down;
    
    if (_axis_pressed_up == false && axis_up_prev == false)
    {
        if (gamepad_axis_value(0, gp_axislv) < 0)
            _axis_pressed_up = true;
    }
    
    axis_up_prev = gamepad_axis_value(0, gp_axislv) < 0;
    global.b_up_press = _axis_pressed_up;
}
