function state_player_flushed() {
	

	//if grounded {
	//	if key_down 
	//		sprite_index = spr_player_skatecrouch
	//	else if movespeed < 7
	//		sprite_index = spr_player_skateslow
	//	else
	//		sprite_index = spr_player_skate
	//}

	//move = (key_left + key_right);
	
	//if move = 0 && movespeed < 3 
	//	movespeed += 0.1
	//if (move != 0 && move != xscale) && movespeed > 6 && Dashpad_buffer <= 0 && !key_down //Slowdown
	//{
	//	movespeed -= 0.05;
	//}
	//if (move != 0 && move == xscale) && movespeed < 14 && !key_down //Go Faster
	//	movespeed += 0.1;
	//if movespeed > 4 && Dashpad_buffer <= 0 && key_down
	//	movespeed -= 0.05
	////Clamp Movespeed
	//movespeed = clamp(movespeed, 0, 18);
	//hsp = (xscale * movespeed);
	//if key_slap2 && !suplexmove {
	//	state = states.frostburnspin
	//	image_index = 0
	//	if movespeed < 14
	//		movespeed += 3
	//	suplexmove = true;
		
	//}
	//if scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog) 
	//{
		
	//	if place_meeting_slope(x, y + 1) {
	//		state = states.frostburnwallrun
	//		verticalMovespeed = movespeed
	//	}
	//	else {
	//		instance_create(x, y, obj_bangeffect);
	//		xscale *= -1;
	//		movespeed /= 2;
	//	}
	//}
	
	//if key_jump && grounded && !key_down
	//{
	//	vsp = -8
	//	sprite_index = spr_player_skatejumpstart
	//	image_index = 0
	//}

	//if key_jump && !key_down && !grounded && doublejump = 0
	//{
	//	vsp = -10
	//	doublejump = 1
	//	sprite_index = spr_player_skatedoublejumpstart
	//	image_index = 0
	//	if movespeed < 14
	//	movespeed += 2
	//}

	//if grounded 
	//	doublejump = 0

	//if key_down && !grounded
	//{
	//	sprite_index = spr_player_skatedive
	//	vsp = 10
	//	if movespeed < 10
	//	movespeed += 1
	
	//}
	//var _xscale = xscale;
	//if scr_slope_ext(x, y + 1) && !scr_solid_slope(x, y + 1) {
	//	#region Object
	//	with (instance_place(x, (y + 1), obj_slope))
	//	{
	//		var slope_acceleration = abs(image_yscale) / abs(image_xscale)
	//		//Roll Momentum
	//		if _xscale == sign(image_xscale) && sprite_index != spr_player_skatedive
	//		{
	//			if other.movespeed > 0 {
	//				other.movespeed -= (0.30 * slope_acceleration)
	//			} else {
	//				other.movespeed = 0;
	//				other.xscale = -sign(image_xscale)
	//			}
	//		}
	//		else if _xscale == -sign(image_xscale)
	//		{
	//			if other.movespeed < 14 {
	//				other.movespeed += (0.30 * slope_acceleration)
	//			}
	//		}
	//	}
	//	with (instance_place(x, (y + 1), obj_slopePlatform))
	//	{
	//		var slope_acceleration = abs(image_yscale) / abs(image_xscale)
	//		//Roll Momentum
	//		if _xscale == sign(image_xscale) && sprite_index != spr_player_skatedive
	//		{
	//			if other.movespeed > 0 {
	//				other.movespeed -= (0.30 * slope_acceleration)
	//			} else {
	//				other.movespeed = 0;
	//				other.xscale = -sign(image_xscale)
	//			}
	//		}
	//		else if _xscale == -sign(image_xscale)
	//		{
	//			if other.movespeed < 14 {
	//				other.movespeed += (0.30 * slope_acceleration)
	//			}
	//		}
	//	}
	//}
	//	#endregion
	//if sprite_index = spr_player_skatejumpstart && animation_end()
	//	sprite_index = spr_player_skatejump
	//if sprite_index = spr_player_skatedoublejumpstart && animation_end()
	//	sprite_index = spr_player_skatedoublejump
	//if sprite_index = spr_player_skatediveland && animation_end()
	//	sprite_index = spr_player_skate
		
	//if sprite_index = spr_player_skateslow image_speed = clamp(movespeed / 16, .1, .5) else image_speed = .35
}
