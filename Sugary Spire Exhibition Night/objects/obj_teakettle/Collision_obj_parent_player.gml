with (other)
{
	vsp = approach(vsp, -12, 6)
	jumpStop = true
	
	if (state == PlayerState.machslide)
	{
		state = PlayerState.normal
		sprite_index = spr_player_PZ_fall_outOfControl
		image_index = 0
	}
}
