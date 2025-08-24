function sprite_animation_end(arg0 = sprite_index, arg1 = image_index, arg2 = sprite_get_number(arg0), arg3 = image_speed)
{
	return (arg1 + ((arg3 * sprite_get_speed(arg0)) / ((sprite_get_speed_type(arg0) == 1) ? 1 : game_get_speed(gamespeed_fps)))) >= arg2;
}