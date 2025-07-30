condition = function() {
	return !instance_exists(inst_7F98DFEC);
}
output = function() {
	with (inst_3A2C474F) {
		if !(ds_list_find_index(global.saveroom, id) != -1) {
			instance_create((x ), (y ), obj_cloudeffect)
			repeat (3) {
				instance_create(((x ) + random_range(-5, 5)), ((y ) + random_range(-5, 5)), obj_cloudeffect)
			}
			instance_destroy();
		}
	}
	with (inst_519A9F11) {
		if !(ds_list_find_index(global.saveroom, id) != -1) {
			instance_create((x ), (y ), obj_cloudeffect)
			repeat (3) {
				instance_create(((x ) + random_range(-5, 5)), ((y ) + random_range(-5, 5)), obj_cloudeffect)
			}
			instance_destroy();
		}
	}
	with (inst_3D451B1D) {
		if !(ds_list_find_index(global.saveroom, id) != -1) {
			instance_create((x ), (y ), obj_cloudeffect)
			repeat (3) {
				instance_create(((x ) + random_range(-5, 5)), ((y ) + random_range(-5, 5)), obj_cloudeffect)
			}
			instance_destroy();
		}
	}
}
