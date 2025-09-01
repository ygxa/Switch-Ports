handle_savedoption()
kill_sounds([activeSFX])
var onOffToggle = ["OFF", "ON"]
var toMainPage = new option_button("BACK", function()
{
	event_play_oneshot("event:/SFX/ui/menuBack")
	option_goto(backMenu, backOption)
})

switch (optionMenu)
{
	default:
		alignCenter = true
		backMenu = -4
		backOption = 0
		options = [new option_button("AUDIO", function()
		{
			option_goto(OptionMenu.Audio)
		}).add_icon(spr_newpause_icons, 5), new option_button("VIDEO", function()
		{
			option_goto(OptionMenu.Video)
		}).add_icon(spr_newpause_icons, 6), new option_button("GAME", function()
		{
			option_goto(OptionMenu.Game)
		}).add_icon(spr_newpause_icons, 8), new option_button("CONTROLS", function()
		{
			option_goto(OptionMenu.Controls)
		}).add_icon(spr_newpause_icons, 7), new option_button("MODDED", function()
		{
			option_goto(OptionMenu.Modded)
		}).add_icon(spr_newpause_icons, 4)]
		
		/*
		if (room == rm_mainmenu)
		{
			var lang_menu = new option_button("opt_language", function()
			{
				option_goto(OptionMenu.Language)
				instance_create(0, 0, obj_option_lang)
				scr_input_varinit()
			})
			lang_menu.add_icon(spr_newpause_icons, 9)
			array_push(options, lang_menu)
		}
		*/
		
		break
	
	case OptionMenu.Audio:
		backMenu = OptionMenu.Base
		backOption = 0
		alignCenter = false
		sliderSprite = spr_optionslide_bar
		sliderIcon = spr_optionslide_end
		var speaker_options = ["opt_aud_mono", "opt_aud_stereo"]
		options = [toMainPage, new option_slider("opt_aud_master", function(arg0)
		{
			global.masterVolume = arg0 / 100
			set_volume_options()
		}, function(arg0)
		{
			global.masterVolume = arg0 / 100
			set_volume_options()
			quick_write_option("Settings", "mastervol", global.masterVolume)
		}, round(global.masterVolume * 100), "event:/SFX/ui/sliderMaster"), new option_slider("opt_aud_music", function(arg0)
		{
			global.musicVolume = arg0 / 100
			set_volume_options()
		}, function(arg0)
		{
			global.musicVolume = arg0 / 100
			set_volume_options()
			quick_write_option("Settings", "musicvol", global.musicVolume)
		}, round(global.musicVolume * 100), "event:/SFX/ui/sliderMusic"), new option_slider("opt_aud_sfx", function(arg0)
		{
			global.soundVolume = arg0 / 100
			set_volume_options()
		}, function(arg0)
		{
			global.soundVolume = arg0 / 100
			set_volume_options()
			quick_write_option("Settings", "soundvol", global.soundVolume)
		}, round(global.soundVolume * 100), "event:/SFX/ui/sliderSFX"), new option_normal("opt_aud_focus", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "unfocusmute", arg0)
			global.unfocusedMute = arg0
		}, global.unfocusedMute), new option_normal("opt_aud_attenuation", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "musicAttenuation", arg0)
			global.musicAttenuation = arg0
		}, global.musicAttenuation), new option_normal("opt_aud_speaker", speaker_options, function(arg0)
		{
			quick_write_option("Settings", "speaker", arg0)
			global.speakerOption = arg0
			fmod_studio_system_set_parameter_by_name("speakerOption", arg0, true)
		}, global.speakerOption)]
		break
	
	case OptionMenu.Video:
		backMenu = OptionMenu.Base
		backOption = 1
		alignCenter = false
		var res = []
		/*
, new option_normal("LETTERBOX", letterbox_option, function(arg0)
		{
			quick_write_option("Settings", "letterbox", arg0)
			global.Letterbox = arg0
			
			with (obj_screen)
				event_user(1)
		}, global.Letterbox)
		*/
		var letterbox_option = ["OFF", "SIMPLE", "DOODLE", "DYNAMIC"]
		options = [toMainPage, new option_normal("opt_vid_vsync", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "vsync", arg0)
			//display_reset(0, global.Vsync)
			global.Vsync = arg0
		}, global.Vsync), new option_normal("opt_vid_texturefilter", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "TextureFiltering", arg0)
			global.TextureFiltering = arg0
		}, global.TextureFiltering), new option_normal("opt_vid_showHUD", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "showHUD", arg0)
			global.ShowHUD = arg0
		}, global.ShowHUD)]
		break
	
	case OptionMenu.Window:
		backMenu = OptionMenu.Video
		backOption = 1
		alignCenter = false
		options = [toMainPage, new option_button("opt_vid_windowmode_windowed", function()
		{
			set_fullscreen_option(0)
		}), new option_button("opt_vid_windowmode_exclusive", function()
		{
			set_fullscreen_option(1)
		}), new option_button("opt_vid_windowmode_borderless", function()
		{
			set_fullscreen_option(2)
		})]
		break
	
	case OptionMenu.Game:
		backMenu = OptionMenu.Base
		backOption = 2
		alignCenter = false
		var timer_options = ["OFF", "PER LEVEL", "PER SAVE", "BOTH"]
		options = [toMainPage, new option_normal("VIBRATION", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "vibration", arg0)
			global.controllerVibration = arg0
		}, global.controllerVibration), new option_normal("SCREEN SHAKE", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "screenshake", arg0)
			global.ScreenShake = arg0
		}, global.ScreenShake), new option_normal("TIMER", timer_options, function(arg0)
		{
			quick_write_option("Settings", "opt_timerType", arg0)
			global.option_timer_type = arg0
		}, global.option_timer_type), new option_normal("SPEEDRUN TIMER", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "timerspeedrun", arg0)
			global.option_speedrun_timer = arg0
		}, global.option_speedrun_timer), new option_normal("FPS COUNTER", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "fps", arg0)
			global.FPS = arg0
		}, global.FPS)]
		
		if (room == rm_mainmenu)
		{
			array_push(options, new option_button("RESET CLOTHES PROGRESS", function()
			{
				instance_create(0, 0, obj_option_clothes)
			}))
		}
		
		break

	case OptionMenu.Modded:
		backMenu = OptionMenu.Base
		backOption = 4
		alignCenter = false
		options = [toMainPage, new option_normal("Swap Mode", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "swapmode", arg0)
			global.swapmode = arg0
		}, global.swapmode), new option_normal("Fudgetop And Cafe", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "fudge&cafe", arg0)
			global.fudgetopcafe = arg0
		}, global.fudgetopcafe), new option_normal("Basement", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "basement", arg0)
			global.basement = arg0
		}, global.basement), new option_normal("PAN Pizzano", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "panpizzano", arg0)
			global.panpizzano = arg0
		}, global.panpizzano)]
		
		break
	
	case OptionMenu.Language:
		backMenu = OptionMenu.Base
		backOption = 4
		alignCenter = false
		break
	
	case OptionMenu.Controls:
		backMenu = OptionMenu.Base
		backOption = 3
		alignCenter = false
		options = [toMainPage, new option_button("opt_ctrl_keyboard", function()
		{
			option_goto(OptionMenu.Keyboard)
		}), new option_button("opt_ctrl_controller", function()
		{
			option_goto(OptionMenu.Gamepad)
		})]
		break
	
	case OptionMenu.Keyboard:
		backMenu = OptionMenu.Controls
		backOption = 1
		alignCenter = false
		options = [toMainPage, new option_button("opt_ctrl_bindings", function()
		{
			if (!instance_exists(obj_option_keyconfig))
			{
				scr_input_varinit()
				
				with (instance_create(x, y, obj_option_keyconfig))
					gamepad = false
			}
		}), new option_normal("opt_ctrl_keyboardsuperjump", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "dsjumpkey", arg0)
			global.option_sjump_key = arg0
		}, global.option_sjump_key), new option_normal("opt_ctrl_keyboardgroundpound", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "dgroundpoundkey", arg0)
			global.option_groundpound_key = arg0
		}, global.option_groundpound_key)]
		break
	
	case OptionMenu.Gamepad:
		backMenu = OptionMenu.Controls
		backOption = 2
		alignCenter = false
		options = [toMainPage, new option_button("opt_ctrl_bindings", function()
		{
			if (!instance_exists(obj_option_keyconfig))
			{
				scr_input_varinit()
				
				with (instance_create(x, y, obj_option_keyconfig))
					gamepad = true
			}
		}), new option_button("opt_ctrl_deadzones", function()
		{
			option_goto(OptionMenu.Deadzones)
		}), new option_normal("opt_ctrl_controllersuperjump", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "dsjumpgp", arg0)
			global.option_sjump_gp = arg0
		}, global.option_sjump_gp), new option_normal("opt_ctrl_controllergroundpound", onOffToggle, function(arg0)
		{
			quick_write_option("Settings", "dgroundpoundgp", arg0)
			global.option_groundpound_gp = arg0
		}, global.option_groundpound_gp)]
		break
	
	case OptionMenu.Deadzones:
		backMenu = OptionMenu.Gamepad
		backOption = 2
		alignCenter = false
		sliderSprite = spr_optionSlider
		sliderIcon = spr_optionSliderIcon2
		options = [toMainPage, new option_slider("opt_ctrl_dz_gen", function(arg0)
		{
			global.deadzones[Deadzones.Master] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.Master] = arg0 / 100
			quick_write_option("Settings", "deadzoneMaster", global.deadzones[Deadzones.Master])
		}, round(global.deadzones[Deadzones.Master] * 100)), new option_slider("opt_ctrl_dz_vert", function(arg0)
		{
			global.deadzones[Deadzones.Vertical] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.Vertical] = arg0 / 100
			quick_write_option("Settings", "deadzoneVertical", global.deadzones[Deadzones.Vertical])
		}, round(global.deadzones[Deadzones.Vertical] * 100)), new option_slider("opt_ctrl_dz_horiz", function(arg0)
		{
			global.deadzones[Deadzones.Horizontal] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.Horizontal] = arg0 / 100
			quick_write_option("Settings", "deadzoneHorizontal", global.deadzones[Deadzones.Horizontal])
		}, round(global.deadzones[Deadzones.Horizontal] * 100)), new option_slider("opt_ctrl_dz_press", function(arg0)
		{
			global.deadzones[Deadzones.Press] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.Press] = arg0 / 100
			quick_write_option("Settings", "deadzonePress", global.deadzones[Deadzones.Press])
		}, round(global.deadzones[Deadzones.Press] * 100)), new option_slider("opt_ctrl_dz_superjump", function(arg0)
		{
			global.deadzones[Deadzones.SJump] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.SJump] = arg0 / 100
			quick_write_option("Settings", "deadzoneSJump", global.deadzones[Deadzones.SJump])
		}, round(global.deadzones[Deadzones.SJump] * 100)), new option_slider("opt_ctrl_dz_crouchwalk", function(arg0)
		{
			global.deadzones[Deadzones.Crouch] = arg0 / 100
		}, function(arg0)
		{
			global.deadzones[Deadzones.Crouch] = arg0 / 100
			quick_write_option("Settings", "deadzoneCrouch", global.deadzones[Deadzones.Crouch])
		}, round(global.deadzones[Deadzones.Crouch] * 100))]
		break
}

trace("New Options")
trace(options)
