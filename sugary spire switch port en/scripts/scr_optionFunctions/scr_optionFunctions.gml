function set_resolution_option(arg0)
{

}

function create_option() constructor
{
	static add_icon = function(arg0, arg1)
	{
		sprite_index = arg0
		image_index = arg1
		return self;
	}
	
	value = 0
	options = []
	id = ""
	translate_opt = true
	translate_name = true
	on_toggle = undefined
	on_slide = undefined
	on_stop = undefined
	sound = -4
	alpha = 1
	moving = false
	show_percent = false
	sprite_index = -4
	image_index = 0
	icon_alpha = 0
}

function option_normal(arg0, arg1, arg2, arg3, arg4 = true) : create_option() constructor
{
	id = arg0
	type = OptionType.Normal
	options = arg1
	on_toggle = arg2
	value = arg3
	translate_opt = arg4
}

function option_button(arg0, arg1) : create_option() constructor
{
	id = arg0
	on_toggle = arg1
	type = OptionType.Button
}

function option_slider(arg0, arg1, arg2, arg3, arg4 = -4, arg5 = false) : create_option() constructor
{
	id = arg0
	on_slide = arg1
	on_stop = arg2
	type = OptionType.Slider
	sound = arg4
	value = arg3
	show_percent = arg5
}

function option_goto(arg0, arg1 = 0)
{
	var _OldMenu = optionMenu
	optionMenu = arg0
	optionSelected = arg1
	inputBuffer = 2
	event_user(0)
}

function option_create_confirm(arg0, arg1, arg2)
{
	return instance_create(0, 0, obj_option_confirm, 
	{
		previousValue: arg0,
		confirmFunc: arg1,
		resetFunc: arg2
	});
}

function draw_option(arg0, arg1, arg2, arg3)
{
	draw_set_color(c_white)
	
	if (!arg3)
		draw_set_color(#666666)
	
	draw_text(arg0, arg1, arg2)
	draw_set_color(c_white)
}

function update_option_format(arg0, arg1)
{
	switch (arg0)
	{
		case 0:
			if (ini_key_exists("Settings", "resolution"))
			{
				var cur_res = ini_read_real("Settings", "resolution", 1)
				
				if (cur_res > 0)
					ini_write_real("Settings", "opt_resolution", cur_res + 1)
				
				global.selectedResolution = cur_res + 1
			}
			
			if (ini_key_exists("Settings", "timer") || ini_key_exists("Settings", "timertype"))
			{
				var cur_timer_type = ini_read_real("Settings", "timertype", 2)
				var timer_enabled = ini_read_real("Settings", "timer", 1)
				
				if (!timer_enabled)
				{
					ini_write_real("Settings", "opt_timerType", 0)
					global.option_timer_type = 0
				}
				else
				{
					ini_write_real("Settings", "opt_timerType", cur_timer_type + 1)
					global.option_timer_type = cur_timer_type + 1
				}
			}
			
			break
	}
}

function init_option()
{
	global.fullscreen = 0;
	global.selectedResolution = 2;
	global.Letterbox = 0;
	global.smoothcam = false;
	global.hitstunEnabled = true;
	global.Vsync = 1;
	global.ShowHUD = 1;
	global.screentilt = false;
	global.playerrotate = false;
	global.ScreenShake = 1;
	global.tvmessages = false;
	global.lowperformance = false;
	global.TextureFiltering = 0;
	global.unfocusedMute = 1;
	global.musicAttenuation = 0;
	global.toggleTimer = 1;
	global.controllerVibration = 1;
	global.musicVolume = 0.9;
	global.dialogueVolume = 1;
	global.soundVolume = 1;
	global.masterVolume = 1;
	global.speakerOption = 1;
	global.option_sjump_key = 1;
	global.option_sjump_gp = 1;
	global.option_groundpound_key = 1;
	global.option_groundpound_gp = 1;
	global.option_speedrun_timer = 0;
	global.option_timer_type = 3;
	global.option_livesplit_enabled = 0;
	var cur_version = 0;

	
	//if (cur_version > 1)
		//show_debug_message(string("WARNING: optionData.ini Version: {0} is higher than game's expected optionData.ini version: " + cur_version + ". Tomfoolery afoot."))
	
	//if (!ini_section_exists("FileFormat") || !ini_key_exists("FileFormat", "version") || cur_version < 1)
	//{
		//show_debug_message("ALERT: Updating optionData.ini version...")
		//ini_write_real("FileFormat", "version", 1)
		//update_option_format(cur_version, 1)
	//}
	
	//ini_close()
	scr_setinput_init()
	scr_input_create()
	//scr_lang_init()
	global.langStruct = {}
	global.langFiles = []
	global.langError = ""
	//display_reset(0, global.Vsync)
	//set_resolution_option(global.selectedResolution)
	
	with (obj_screen)
		event_perform(ev_alarm, 0)
	
	scr_initKeyNameMap()
}

function quick_write_option(arg0, arg1, arg2)
{
	ini_open("optionData.ini")
	
	if (is_string(arg2))
		ini_write_string(arg0, arg1, arg2)
	else
		ini_write_real(arg0, arg1, arg2)
	
	ini_close()
	
	with (obj_option)
		changedAnyOption = true
}

function create_option_menu(arg0, arg1, arg2, arg3 = camera_get_view_width(view_camera[0]) / 2, arg4 = 150, arg5 = 25)
{
	return -4;
	var q = 
	{
		centered: arg0,
		backto: arg1,
		options: arg2,
		xpad: arg3,
		ypad: arg4,
		textpad: arg5
	}
	return q;
}

function create_option_toggle(arg0, arg1, arg2, arg3)
{
	return -4;
	var q = 
	{
		name: arg1,
		desc: arg2,
		type: OldOptionType.Toggle,
		alpha: 1,
		func: arg3,
		value: 0
	}
	array_push(arg0, q)
	return q;
}

function create_option_press(arg0, arg1, arg2, arg3)
{
	return -4;
	var q = 
	{
		name: arg1,
		desc: arg2,
		type: OldOptionType.Press,
		alpha: 1,
		func: arg3,
		value: 0
	}
	array_push(arg0, q)
	return q;
}

function create_option_multichoice(arg0, arg1, arg2, arg3, arg4)
{
	return -4;
	var q = 
	{
		name: arg1,
		desc: arg2,
		type: OldOptionType.MultiChoice,
		alpha: 1,
		choices: arg3,
		func: arg4,
		value: 0
	}
	array_push(arg0, q)
	return q;
}

function create_option_slider(arg0, arg1, arg2, arg3, arg4, arg5 = undefined)
{
	return -4;
	var q = 
	{
		name: arg1,
		desc: arg2,
		type: OldOptionType.Slider,
		alpha: 1,
		on_move: arg3,
		on_stop: arg4,
		value: 0,
		moving: false,
		sound: undefined
	}
	
	if (!is_undefined(arg5))
		q.sound = fmod_createEventInstance(arg5)
	
	array_push(arg0, q)
	return q;
}

function goto_menu(arg0)
{
	return -4;
	selectedmenu = arg0
	optionselected = 0
	textScroll = -9999
	pgHeight = 0
	showdesc = false
}
