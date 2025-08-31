if (rm_startupLogo != rm_startupLogo)
	obj_parent_player.state = PlayerState.normal

room_goto_fixed(rm_startupLogo)
instance_destroy()

ini_open("optionData.ini");
ini_write_real("fuckass", "dumbass", 1)
fixed_ini_close()