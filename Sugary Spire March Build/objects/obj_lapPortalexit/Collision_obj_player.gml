if ((sprite_index == spr_secreteye) && ds_list_find_index(global.saveroom, id) == -1)
{
    with(obj_player)
	{
		dir = xscale
		yscale = 1
	    hsp = 0
	    vsp = 0
		x = other.x
		y = other.y
		state = states.donothing
		substate = 1
		
	}
	image_index = 0
	sprite_index = spr_secreteye_tele
	ds_list_add(global.saveroom, id)
}

