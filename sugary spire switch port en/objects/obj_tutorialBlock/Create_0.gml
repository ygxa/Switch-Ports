shakealil = 0
eas_ini_open(global.SaveFileName)

if (ini_read_string("Misc", "TutorialBlock", "0") != "0")
{
	instance_destroy()
}
else if (ini_read_string("Ranks", "tutorial", "none") != "none")
{
	shakealil = 2
	alarm[0] = 80
}

eas_ini_close()
//eas_save(scr_easyasync_callback)
depth = 4
