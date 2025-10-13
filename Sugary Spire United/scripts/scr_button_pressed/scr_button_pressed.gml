function scr_button_pressed(argument0)
{
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.key_jump))
		return -1;
	else if (gamepad_is_connected(argument0))
	{
		if (gamepad_button_check(argument0, gp_face1) || gamepad_button_check(argument0, gp_start))
			return argument0;
	}
	return -2;
}
