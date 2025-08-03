if (gamepad_is_connected(checkingPadIndex))
{
    global.control_gamepad = true;
    global.control_gamepad_device = checkingPadIndex;
    gamepad_set_axis_deadzone(checkingPadIndex, global.gamepad_axis_deadzone);
    gamepad_set_button_threshold(checkingPadIndex, global.gamepad_button_threshold);
    
    if (checkingPadTimer >= 60)
    {
        global.gamepad_buttons_type = gamepad_identify_type(checkingPadIndex);
        checkingPadPress = false;
    }
    else
    {
        global.gamepad_buttons_type = -1;
        checkingPadPress = true;
    }
    
    global.last_connected_gamepad = checkingPadIndex;
}

checkingPadIndex = -1;
