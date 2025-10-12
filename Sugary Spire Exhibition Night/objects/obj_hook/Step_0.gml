if (global.freezeframe)
	exit

if (!instance_exists(hookStopID))
{
	show_debug_message(string("Hook ({0}) at ({1}, {2}) didn't find stop", id, x, y))
	instance_destroy()
}

switch (state)
{
	case PlayerState.frozen:
		visible = true
		break
	
	case PlayerState.normal:
		var target_dir = point_direction(x, y, xstart, ystart)
		var pnt_dist = min(point_distance(x, y, xstart, ystart), gobackspeed)
		x += lengthdir_x(pnt_dist, target_dir)
		y += lengthdir_y(pnt_dist, target_dir)
		
		if (point_distance(x, y, xstart, ystart) <= 9)
		{
			x = xstart
			y = ystart
			state = PlayerState.frozen
		}
		
		visible = true
		break
	
	case PlayerState.titlescreen:
		var target_dir = point_direction(x, y, hookStopID.x, hookStopID.y)
		xprevious = x
		yprevious = y
		x += lengthdir_x(movespeed, target_dir)
		y += lengthdir_y(movespeed, target_dir)
		var hsp = sign(x - xprevious)
		var vsp = sign(y - yprevious)
		
		with (playerID)
		{
			if (state == PlayerState.oldtaunt)
			{
				x = other.x
				y = other.y - 14
				xscale = sign(other.image_xscale)
				
				if (tauntStored.state == PlayerState.frostburnjump || tauntStored.state == PlayerState.frostburnnormal || tauntStored.state == PlayerState.frostburnslide || tauntStored.state == PlayerState.frostburnslide)
					sprite_index = spr_player_PZ_frostburn_hook
				else
					sprite_index = spr_player_PZ_hook_vertical
			}
		}
		
		visible = false
		
		if (point_distance(x, y, hookStopID.x, hookStopID.y) <= movespeed)
		{
			x = hookStopID.x
			y = hookStopID.y
			state = PlayerState.normal
			visible = true
			
			with (playerID)
			{
				x = other.hookStopID.x
				y = other.hookStopID.y - 14
				
				if (state == PlayerState.oldtaunt)
					scr_taunt_setVariables()
			}
		}
		
		break
}
