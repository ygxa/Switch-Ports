//Inputs
scr_getinput();
	
//Select your Option
if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
{
    optionselected -= 1;
    scr_sound(sound_step);
}
if ((key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
{
    optionselected += 1;
    scr_sound(sound_step);
}

if (optionselected == 1 && (key_jump || keyboard_check_pressed(vk_return)))
{
	with (obj_playerhat) { image_index = 0; }
	with (obj_player) { scr_characterspr(); }
	file_delete("saveData.ini");
    scr_sound(sound_destroyblock1);
	scr_sound(sound_explosion);
    instance_destroy();
}
if (key_slap2 || keyboard_check_pressed(vk_escape) || (optionselected == 0 && (key_jump || keyboard_check_pressed(vk_return))))
{
    scr_sound(sound_enemythrow);
    instance_destroy();
}


