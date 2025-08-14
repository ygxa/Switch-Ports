// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input(){
	player_input_device[0] = 0;
	
    for (var i = 0; i < gamepad_get_device_count(); i++)
    {
        if (gamepad_is_connected(i))
            player_input_device[0] = i;
    }	
	
	key_left = keyboard_check(vk_left) || gamepad_button_check(player_input_device[0], gp_padl) || gamepad_axis_value(player_input_device[0], gp_axislh) < -0.5
	key_left2 = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(player_input_device[0], gp_padl) || gamepad_axis_value(player_input_device[0], gp_axislh) < -0.5
	key_right = keyboard_check(vk_right) || gamepad_button_check(player_input_device[0], gp_padr) || gamepad_axis_value(player_input_device[0], gp_axislh) > 0.5
	key_right2 = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(player_input_device[0], gp_padr) || gamepad_axis_value(player_input_device[0], gp_axislh) > 0.5
	key_up = keyboard_check(vk_up) || gamepad_axis_value(player_input_device[0], gp_axislv) < -0.5
	key_down = keyboard_check(vk_down) || gamepad_axis_value(player_input_device[0], gp_axislv) > 0.5 || gamepad_button_check(player_input_device[0], gp_padd)
	key_down2 = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(player_input_device[0], gp_padd) || gamepad_axis_value(player_input_device[0], gp_axislv) > 0.5
	key_run = keyboard_check(ord("X")) || gamepad_button_check(player_input_device[0], gp_face2)
	key_run2 = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(player_input_device[0], gp_face2)
	key_select = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(player_input_device[0], gp_face1)
}