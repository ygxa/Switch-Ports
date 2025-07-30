if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat(2) {
		instance_create((x + 16), y + 16, obj_debris2)
		with instance_create((x + 16), y + 16, obj_debris2) {
			sprite_index = spr_smallbreak2Escape_Debris;
		}
		with instance_create((x + 16), y + 16, obj_debris2) {
			sprite_index = spr_smallbreak2Escape_Debris;
		}		
	}
	instance_create(x, y, obj_collect)

	//Destroyable Sound but Fixed
    audio_stop_sound(sound_destroyblock1);
    audio_stop_sound(sound_destroyblock2);
    
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	
    ds_list_add(global.saveroom, id)
}
        /*var lay_id = layer_get_id("Tiles_1")
    var map_id = layer_tilemap_get_id(lay_id)
    var data = tilemap_get_at_pixel(map_id, x, y)
    data = tile_set_empty(data)
    tilemap_set_at_pixel(map_id, data, x, y)*/
