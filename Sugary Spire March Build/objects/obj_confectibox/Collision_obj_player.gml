if sprite_index != spr_confectiboxopen {
	with (obj_creamThief) {
		hsp = 0;
		vsp = 0; 
		state = thiefstate.idle;
		sprite_index = spr_creamthief_lose;
	}	
	var _content = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), BoxContent);
	if object_get_parent(_content.object_index) == par_confecti {
		with instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_explosioneffect) {
			sprite_index = spr_taunteffect;	
			depth = -2;
		}
		scr_sound(sound_toppingot);
		helptimer = -1
		if (global.toppintotal < 5)
			obj_tv.message = (("YOU ARE MISSING " + string((5 - global.toppintotal))) + " CONFECTI!")
		if (global.toppintotal == 5)
			obj_tv.message = "YOU GOT ALL CONFECTI!"
        obj_tv.showtext = 1;
		obj_tv.alarm[0] = 200;
		global.toppintotal += 1
		global.collect += 1000;
		//Combo Freeze
		global.combofreeze = 30;
		global.combotime = 60;
	}
	repeat (6)
		instance_create(x + 50, y + 50, obj_cagedebris);
	audio_emitter_free(emitter);
	instance_destroy();
	ds_list_add(global.saveroom, id);
}
