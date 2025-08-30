function scr_judgment_assign()
{
	var per = scr_completion_percent(global.SaveFileName)
	ini_open(global.SaveFileName)
	var j = "disappointing"
	var judgement = ini_read_string("Game", "Judgment", "noone")
	
	if (per >= 100)
		j = "perfect"
	else if (per >= 50)
		j = "fine"
	{}
	if (global.SaveMinutes < 20)
		j = "fast"
	
	if (global.SaveMinutes < 45 && per >= 101)
		j = "holyshit"
	
	if (judgement == "holyshit")
		j = "holyshit"
	
	ini_write_string("Game", "Judgment", j)
	fixed_ini_close()
	

	return scr_judgment_get(j);
}

function scr_judgment_get(arg0)
{
	var j = ds_map_find_value(global.judgment_map, arg0)
	return j ?? ds_map_find_value(global.judgment_map, "none");
}

function scr_judgment_read(arg0)
{
	if (!file_exists(arg0))
		return scr_judgment_get("none");
	
	ini_open(arg0)
	var p = ini_read_string("Game", "Judgment", "none")
	fixed_ini_close()
	//eas_save(scr_easyasync_callback)
	return scr_judgment_get(p);
}

function saveJudgment() constructor
{
	static setProperties = function(arg0)
	{
		properties = arg0
		return self;
	}
	
	properties = 
	{
		title: "",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_null,
		fileindex: 0
	}
	return self;
}

function add_judgment(arg0, arg1)
{
	var j = new saveJudgment().setProperties(arg1)
	j.properties.title = "judgment_title_" + string(arg0)
	j.properties.dialog = ["Hmmm? You'd like to know what I think of your performance tonight?"]
	var judgement = string(arg0)
	
	if judgement = "disappointing"{
		array_push(j.properties.dialog, "Honestly, I'm not sure why you bothered showing up in the first place...")
		array_push(j.properties.dialog, "True art is to be admired, imbecile! Instead of showing your respect for my creative genius, you ran around like a rat, mandhandling my work with your filthy little gloves.")
		array_push(j.properties.dialog, "I had hoped for more from you, confiseur. How disappointing...")
	}
	
	if judgement = "fine"{
		array_push(j.properties.dialog, "It was... adequate, je suppose")
		array_push(j.properties.dialog, "But did you not also sense something more to my paintings? It saddens me that you failed to fully appreciate their depth.")
		array_push(j.properties.dialog, "Regardless, confiseur, you performed acceptably...")
	}	

	if judgement = "perfect"{
		array_push(j.properties.dialog, "Not only have you returned all of my precious INK, but you did it with such showmanship too!")
		array_push(j.properties.dialog, "I was worried your fiasco would upset the Critics, but I've never seen them so enthralled!")
		array_push(j.properties.dialog, "I'm sure you're quite happy too, no?  Don't think I didn't see you lining your pockets while you were busy \"admiring\" my paintings!")
		array_push(j.properties.dialog, "Ha! I jest. You earned it, confiseur. Your performance tonight was beyond reproach!")
	}

	if judgement = "fast"{
		array_push(j.properties.dialog, "You haven't given me enough time to think about it! I feel that-")
		array_push(j.properties.dialog, "Quit looking at your timepiece, you blasted thing!")
		array_push(j.properties.dialog, "You ought to slow down a little now and then, it might do you some good.")
	}

	if judgement = "holyshit"{
		array_push(j.properties.dialog, "Mon Dieu, my expectations for you have been completely and utterly surpassed!")
		array_push(j.properties.dialog, "Magnifique! Fantastique! Confiseur, for you I have no more words!")
		array_push(j.properties.dialog, "If only the others could appreciate my art the way you do. C'est la vie...")
	}
	
	array_push(j.properties.dialog, "Now, if you'll excuse me, I have some important meditations to return to...")
	ds_map_set(global.judgment_map, arg0, j)
	return j
}



function scr_judgment_init()
{
	if (!variable_global_exists("judgment_map"))
	{
		global.judgment_map = ds_map_create()
		add_judgment("none", 
		{
			title: "none",
			titlespr: spr_null,
			titleindex: 0,
			splash: spr_null,
			splashindex: 0,
			filespr: spr_null,
			fileindex: 0
		})
	}
	else
	{
		var default_judgment = ds_map_find_value(global.judgment_map, "none")
		ds_map_clear(global.judgment_map)
		ds_map_set(global.judgment_map, "none", default_judgment)
	}
	
	add_judgment("disappointing", 
	{
		title: "disappointing",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_judgment_files,
		fileindex: 0
	})
	add_judgment("fine", 
	{
		title: "fine",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_judgment_files,
		fileindex: 1
	})
	add_judgment("perfect", 
	{
		title: "perfect",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_judgment_files,
		fileindex: 2
	})
	add_judgment("fast", 
	{
		title: "fast",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_judgment_files,
		fileindex: 3
	})
	add_judgment("holyshit", 
	{
		title: "holyshit",
		titlespr: spr_null,
		titleindex: 0,
		splash: spr_null,
		splashindex: 0,
		filespr: spr_judgment_files,
		fileindex: 4
	})
}
