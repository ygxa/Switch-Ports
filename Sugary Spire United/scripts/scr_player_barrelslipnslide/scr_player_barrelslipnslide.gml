function state_player_barrelslipnslide()
{
	mask_index = obj_player.spr_mask;
	hsp = image_xscale * movespeed;
	if (movespeed <= 8)
		movespeed += 0.2;
	if (vsp < 12)
		vsp += grav;
	sprite_index = spr_player_barrelslipnslide;
	if (floor(image_index) == 6)
	{
		state = 85;
		flash = 1;
	}
	else
		image_speed = 0.35;
}
