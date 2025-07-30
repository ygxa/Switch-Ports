if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_bangeffect);
	var rep = 4 + ((sprite_width/32) - 1);
	repeat(rep) {
		instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_metaldebris)
		with instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_metaldebris) {
			sprite_index = spr_metaldebrishard
		}
	}
    //tile_layer_delete_at(1, x, y)
    //tile_layer_delete_at(1, (x + 32), y)
    //tile_layer_delete_at(1, (x + 32), (y + 32))
    //tile_layer_delete_at(1, x, (y + 32))
    with (obj_camera) {
        shake_mag = 20;
        shake_mag_acc = (40 / room_speed);
    }
    scr_sound(sound_metaldestroy);
    ds_list_add(global.saveroom, id);
}
