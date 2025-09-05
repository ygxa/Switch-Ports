if global.aspectratio{
	room_width += 240
	obj_camera.Cam_x += 100000
	with all
		x += 120

	var tiles = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4", "Tiles_5", "Tiles_BG"];
	for (var i = 0; i < array_length(tiles); i++) {
		var tilemap_id = layer_tilemap_get_id(tiles[i]);
		var current_x = tilemap_get_x(tilemap_id);
		tilemap_x(tilemap_id, current_x + 120);
	}
}

scr_roomStart_SetPosition_player(id)

if (global.Combo <= 0 && room != global.LevelFirstRoom && !instance_exists(obj_exitgate) && !instance_exists(obj_lapPortal))
	global.ComboLost = true

with (obj_coneball_timesUp)
{
	x = other.x
	y = other.y
	image_alpha = 0
}

with (obj_parent_confecti)
{
	ds_queue_clear(followQueue)
	x = other.x
	y = other.y
	targetx = other.x
	targety = other.y
	distance = 0
	magnitude = 0
}

with (obj_spookey)
{
	x = other.x
	y = other.y
	hsp = 0
	vsp = 0
}

roomName = room_get_name(room)

if (global.option_speedrun_timer)
	global.GLOBAL_FUN = 0