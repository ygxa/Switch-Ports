if obj_player.state != states.bombpep
{
	if obj_player.state == states.barrelcrouch {
		with instance_create(x, y,  obj_cookiemount)
		{
			image_xscale = obj_player.xscale
			sprite_index = spr_cookiemountkick
			vsp = -16
			hsp = -image_xscale * 16
		}
	}
	obj_player.state = states.bombpep
	obj_player.bombpeptimer = 0
	obj_player.sprite_index = spr_bombpep_end
}
