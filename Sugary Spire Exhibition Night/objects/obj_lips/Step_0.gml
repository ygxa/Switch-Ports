var pl = obj_parent_player

if (point_in_rectangle(pl.x, pl.y, x - 500, y - 300, x + 500, y + 300))
	suck = true
else
	suck = false

if (suck == true)
{
	with (pl)
	{
		if (state == PlayerState.doughmount || state == PlayerState.doughmountspin || state == PlayerState.doughmountballoon)
		{
			sprite_index = spr_bump
			state = PlayerState.bump
			
			with (instance_create(x, y, obj_dogMount))
				state = 1
		}
	}
}

if (place_meeting(x, y, pl) && suck == true)
{
	with (instance_nearest(x, y, obj_dogMount))
	{
		state = 0
		image_blend = c_white
	}
	
	instance_destroy()
}
