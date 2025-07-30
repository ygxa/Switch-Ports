function ScrPlayer2Input()
{
    key_left = keyboard_check(global.keyboardp2left) || lsMoveLeft || dpadLeft;
    key_right = keyboard_check(global.keyboardp2right) || lsMoveRight || dpadRight;
    key_jump = keyboard_check_pressed(global.keyboardp2key_jump) || buttonAPress;
    key_up = keyboard_check(global.keyboardp2up) || lsMoveUp || dpadUp;
    key_down = keyboard_check(global.keyboardp2down) || lsMoveDown || dpadDown;
    key_E = keyboard_check_pressed(global.keyboardp2key_tilt) || buttonBPress;
    key_Q = keyboard_check_pressed(global.keyboardp2key_special) || buttonYPress;
    key_taunt = keyboard_check_pressed(global.keyboardp2key_taunt) || buttonXPress;
    key_double_pressed = keyboard_check_pressed(global.keyboardp2left) || dpadLeft || keyboard_check_pressed(global.keyboardp2right) || dpadRight;
    
    if ((gamepad_axis_value(global.P2controllerport, gp_axislh) < -0.8 || gamepad_axis_value(global.P2controllerport, gp_axislh) > 0.8) && sprint_controller_trigger == false)
    {
        sprint_controller_trigger = true;
        key_double_pressed = true;
    }
    
    if (gamepad_axis_value(global.P2controllerport, gp_axislh) > -0.3 && gamepad_axis_value(global.P2controllerport, gp_axislh) < 0.3)
        sprint_controller_trigger = false;
}
