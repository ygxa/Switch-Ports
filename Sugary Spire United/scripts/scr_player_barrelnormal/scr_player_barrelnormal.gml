function state_player_barrelnormal()
{
	mask_index = obj_player.spr_mask;
	move = key_left + key_right;
	hsp = move * movespeed;
	if (vsp < 12)
		vsp += grav;
	if (!grounded && !key_jump)
	{
		state = 79;
		image_index = 0;
		hsp = 0;
	}
	if ((key_down && grounded) || scr_solid(x, y - 3))
	{
		state = 83;
		image_index = 0;
	}
	if (key_attack && grounded)
	{
		movespeed = 0;
		state = 80;
		landAnim = 0;
	}
	if (place_meeting(x, y, obj_water2))
		vsp -= 1;
	movespeed = 2.5;
	if (move == 0)
		sprite_index = spr_player_barrelidle;
	if (move != 0)
	{
		sprite_index = spr_player_barrelmove;
		xscale = move;
	}
	image_speed = 0.35;
}
