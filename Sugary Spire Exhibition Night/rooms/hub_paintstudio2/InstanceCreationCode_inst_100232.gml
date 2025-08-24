targetRoom = hub_mindpalace
useCustomSprite = true
sprite_index = spr_door_mindpalace
visible = true
image_index = 0
image_alpha = 0
depth = 110
image_speed = 0.35
eas_ini_open(global.SaveFileName)

if (ini_read_string("Game", "Judgment", "none") != "none")
	sprite_index = spr_door_mindpalace2

eas_ini_close()
//eas_save(scr_easyasync_callback)