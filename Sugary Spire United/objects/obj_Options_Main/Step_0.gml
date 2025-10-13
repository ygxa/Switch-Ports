bgx++;
bgy++;
if (selected == 0)
{
	scr_getinput();
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected--;
		scr_sound(sound_step);
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
	{
		optionselected++;
		scr_sound(sound_step);
	}
	switch (optionselected)
	{
		case 0:
			subtitle = "GO BACK TO MAIN SCREEN";
			CursorY = -999;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case 1:
			subtitle = "ADJUST AUDIO SETTINGS";
			CursorY = 100;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Audio);
			}
			break;
		case 2:
			subtitle = "ADJUST VIDEO SETTINGS";
			CursorY = 200;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Video);
			}
			break;
		case 3:
			subtitle = "CHANGE CONTROL INPUTS";
			CursorY = 300;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Input);
			}
			break;
		case 4:
			subtitle = string_upper("CHANGE MOD OPTIONS");
			CursorY = 400;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Mod_old);
			}
	}
	if (key_attack2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
}
