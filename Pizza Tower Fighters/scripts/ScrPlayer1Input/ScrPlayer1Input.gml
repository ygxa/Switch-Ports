function ScrPlayer1Input()
{
    key_left = keyboard_check(global.keyboardp1left) || lsMoveLeft || dpadLeft;
    key_right = keyboard_check(global.keyboardp1right) || lsMoveRight || dpadRight;
    key_jump = keyboard_check_pressed(global.keyboardp1key_jump) || buttonAPress;
    key_up = keyboard_check(global.keyboardp1up) || lsMoveUp || dpadUp;
    key_down = keyboard_check(global.keyboardp1down) || lsMoveDown || dpadDown;
    key_E = keyboard_check_pressed(global.keyboardp1key_tilt) || buttonBPress;
    key_Q = keyboard_check_pressed(global.keyboardp1key_special) || buttonYPress;
    key_taunt = keyboard_check_pressed(global.keyboardp1key_taunt) || buttonXPress;
    key_double_pressed = keyboard_check_pressed(global.keyboardp1left) || keyboard_check_pressed(global.keyboardp1right) || dpadLeftPress || dpadRightPress;
    key_down_pressed = keyboard_check_pressed(global.keyboardp1down) || dpadDownPress;
    key_up_pressed = keyboard_check_pressed(global.keyboardp1up) || dpadUpPress;
    
    if ((gamepad_axis_value(global.P1controllerport, gp_axislh) < -0.8 || gamepad_axis_value(global.P1controllerport, gp_axislh) > 0.8) && sprint_controller_trigger == false)
    {
        sprint_controller_trigger = true;
        key_double_pressed = true;
    }
    
    if (gamepad_axis_value(global.P1controllerport, gp_axislh) > -0.2 && gamepad_axis_value(global.P1controllerport, gp_axislh) < 0.2)
        sprint_controller_trigger = false;
}
