ini_open(global.SaveFileName)
var has_judgment = ini_read_string("Game", "Judgment", "none") != "none"
fixed_ini_close()
//eas_save(scr_easyasync_callback)

if (scr_check_completion() && !has_judgment)
	instance_destroy()
