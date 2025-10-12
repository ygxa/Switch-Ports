switch (state)
{
	case PlayerState.normal:
		if (!instance_exists(obj_fadeoutTransition))
		{
			var length = array_length(hub_array) - 1
			
			if (playerID.key_up2)
				selected--
			
			if (playerID.key_down2)
				selected++
			
			ScrollY = lerp(ScrollY, selected * -48, 0.15)
			selected = clamp(selected, 0, length)
			
			if (playerID.key_jump2)
			{
				if (hub_array[selected][0] != room)
				{
					alarm[0] = 180
					state = PlayerState.titlescreen
					
					with (obj_parent_player)
					{
						targetRoom = other.hub_array[other.selected][0]
						targetDoor = "E"
						movespeed = 0
					}
				}
				else
				{
					state = PlayerState.frozen
					
					with (obj_parent_player)
						state = PlayerState.normal
				}
			}
		}
		
		break
	
	case PlayerState.titlescreen:
		if (playerID.key_jump && alarm[0] != -1)
			alarm[0] = 1
		
		break
}
