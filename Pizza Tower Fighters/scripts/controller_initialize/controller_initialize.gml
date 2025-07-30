function controller_initialize(argument0 = global.P1controllerport)
{
    dpadLeft = gamepad_button_check(argument0, gp_padl);
    dpadLeftRel = gamepad_button_check_released(argument0, gp_padl);
    dpadLeftPress = gamepad_button_check_pressed(argument0, gp_padl);
    dpadRight = gamepad_button_check(argument0, gp_padr);
    dpadRightRel = gamepad_button_check_released(argument0, gp_padr);
    dpadRightPress = gamepad_button_check_pressed(argument0, gp_padr);
    dpadUp = gamepad_button_check(argument0, gp_padu);
    dpadUpRel = gamepad_button_check_released(argument0, gp_padu);
    dpadUpPress = gamepad_button_check_pressed(argument0, gp_padu);
    dpadDown = gamepad_button_check(argument0, gp_padd);
    dpadDownRel = gamepad_button_check_released(argument0, gp_padd);
    dpadDownPress = gamepad_button_check_pressed(argument0, gp_padd);
    leftShoulder = gamepad_button_check(argument0, gp_shoulderl);
    leftShoulderRel = gamepad_button_check_released(argument0, gp_shoulderl);
    leftShoulderPress = gamepad_button_check_pressed(argument0, gp_shoulderl);
    leftTrigger = gamepad_button_check(argument0, gp_shoulderlb);
    leftTriggerRel = gamepad_button_check_released(argument0, gp_shoulderlb);
    leftTriggerPress = gamepad_button_check_pressed(argument0, gp_shoulderlb);
    rightShoulder = gamepad_button_check(argument0, gp_shoulderr);
    rightShoulderRel = gamepad_button_check_released(argument0, gp_shoulderr);
    rightShoulderPress = gamepad_button_check_pressed(argument0, gp_shoulderr);
    rightTrigger = gamepad_button_check(argument0, gp_shoulderrb);
    rightTriggerRel = gamepad_button_check_released(argument0, gp_shoulderrb);
    rightTriggerPress = gamepad_button_check_pressed(argument0, gp_shoulderrb);
    buttonA = gamepad_button_check(argument0, gp_face1);
    buttonARel = gamepad_button_check_released(argument0, gp_face1);
    buttonAPress = gamepad_button_check_pressed(argument0, gp_face1);
    buttonB = gamepad_button_check(argument0, gp_face2);
    buttonBRel = gamepad_button_check_released(argument0, gp_face2);
    buttonBPress = gamepad_button_check_pressed(argument0, gp_face2);
    buttonX = gamepad_button_check(argument0, gp_face3);
    buttonXRel = gamepad_button_check_released(argument0, gp_face3);
    buttonXPress = gamepad_button_check_pressed(argument0, gp_face3);
    buttonY = gamepad_button_check(argument0, gp_face4);
    buttonYRel = gamepad_button_check_released(argument0, gp_face4);
    buttonYPress = gamepad_button_check_pressed(argument0, gp_face4);
    buttonSelect = gamepad_button_check(argument0, gp_select);
    buttonSelectRel = gamepad_button_check_released(argument0, gp_select);
    buttonSelectPress = gamepad_button_check_pressed(argument0, gp_select);
    buttonStart = gamepad_button_check(argument0, gp_start);
    buttonStartRel = gamepad_button_check_released(argument0, gp_start);
    buttonStartPress = gamepad_button_check_pressed(argument0, gp_start);
    stickLeftH = gamepad_axis_value(argument0, gp_axislh);
    stickLeftV = gamepad_axis_value(argument0, gp_axislv);
    stickLeft = gamepad_button_check(argument0, gp_stickl);
    stickLeftRel = gamepad_button_check_released(argument0, gp_stickl);
    stickLeftPress = gamepad_button_check_pressed(argument0, gp_stickl);
    stickRightH = gamepad_axis_value(argument0, gp_axisrh);
    stickRightV = gamepad_axis_value(argument0, gp_axisrv);
    stickRight = gamepad_button_check(argument0, gp_stickr);
    stickRightRel = gamepad_button_check_released(argument0, gp_stickr);
    stickRightPress = gamepad_button_check_pressed(argument0, gp_stickr);
    lsMoveLeft = stickLeftH < 0;
    lsMoveRight = stickLeftH > 0;
    lsMoveUp = stickLeftV < 0;
    lsMoveDown = stickLeftV > 0;
    rsMoveLeft = stickRightH < 0;
    rsMoveRight = stickRightH > 0;
    rsMoveUp = stickRightV < 0;
    rsMoveDown = stickRightV > 0;
    stickLeftPressed = global.b_left_press1;
    stickRightPressed = global.b_right_press1;
    stickDownPressed = global.b_down_press1;
    stickUpPressed = global.b_up_press1;
    stickLeftPressed2 = global.b_left_press2;
    stickRightPressed2 = global.b_right_press2;
    stickDownPressed2 = global.b_down_press2;
    stickUpPressed2 = global.b_up_press2;
    
    if (object_index == O_Player_1 || object_index == O_Player_2)
    {
        rightstickLeftPressed = b_left_press2;
        rightstickRightPressed = b_right_press2;
        rightstickDownPressed = b_down_press2;
        rightstickUpPressed = b_up_press2;
    }
}

function enable_controller()
{
    myControllerID = -4;
    playerID = -4;
}
