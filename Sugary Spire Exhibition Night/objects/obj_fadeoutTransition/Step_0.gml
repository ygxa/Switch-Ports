var load_finished = loaded && unloaded && lang_flushed

if (fadealpha > 1 && load_finished && !fadein)
{
	fadein = 1
	var _hub_exit = false
	//var _id = id
	
	if (instance_exists(obj_parent_player))
	{
		var target_room = obj_parent_player.targetRoom
		
		if (goToHub == true)
		{
			global.InternalLevelName = "none"
			target_room = obj_parent_player.hubRoom
			obj_parent_player.hubTransition = true
			_hub_exit = !global.CompletedLevel
		}
		if global.randomroom = true && room != hub_basement{
			randomize()
			target_room = choose(entryway_1, entryway_2, entryway_3, entryway_4, entryway_5, entryway_6,entryway_7, entryway_8, entryway_9, entryway_10, entryway_11, entryway_portal, //entryway
			steamy_1, steamy_2, steamy_3, steamy_4, steamy_5, steamy_6, steamy_7, steamy_8, steamy_9, steamy_9B, steamy_10, steamy_11, steamy_12, steamy_13, steamy_14, steamy_sideroom, //steamy
			molasses_1, molasses_2, molasses_3, molasses_3b, molasses_4, molasses_5, molasses_6, molasses_7, molasses_7b, molasses_7c, molasses_7d, molasses_8, molasses_9, molasses_9b, molasses_10, molasses_11, molasses_12, //molasses
			mountain_intro, mountain_1, mountain_2, mountain_3, mountain_3b, mountain_4, mountain_escape1, mountain_5, mountain_6, mountain_7, mountain_8, mountain_9, mountain_10, mountain_11, //fudgetop
			cafe_1, cafe_2, cafe_3, cafe_4, cafe_5, cafe_6, cafe_7, cafe_8, cafe_9, cafe_10, cafe_4B, cafe_4C, cafe_7B, cafe_8B, cafe_8C, cafe_8D, //cafe
			tutorial_1, tutorial_2, tutorial_3, tutorial_4, tutorial_5 //tutorial
			)
		}
		if (room_exists(target_room))
		{
			show_debug_message("Fadeout Transition: goToHub: " + string(goToHub) + ", room: " + room_get_name(target_room))
			room_goto_fixed(target_room)
		}
		else
		{
			room_goto_fixed(rm_missing)
			//show_debug_message("Room \"" + string("{0}", string(target_room)) + "\" does not exist. Sent Player to \"rm_missing\"")
		}
	}
	
	if (room == rm_preinitializer)
		room_goto_fixed(rm_initializer)
	
	if (levelStart)
		scr_levelSet()
	
	if (secretRoom)
		global.RoomIsSecret = true
	
	if (_hub_exit)
	{
	}
}

if (fadein == 0)
	fadealpha += fadespeed

if (load_finished)
{
	if (fadein == 1)
		fadealpha -= fadespeed
	
	if (fadein == 1 && fadealpha < 0)
		instance_destroy()
	
	if (fadein == 0 && fadealpha > 1)
	{
		if (instance_exists(obj_titlecard))
			instance_destroy(obj_titlecard)
	}
}

if (!load_finished && titleCard && !fadein)
	fadealpha = 0
