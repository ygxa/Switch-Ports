if (!window_has_focus() || !variable_global_exists("fullscreen"))
{
	alarm[0] = 1
	exit
}

set_resolution_option(global.selectedResolution)
