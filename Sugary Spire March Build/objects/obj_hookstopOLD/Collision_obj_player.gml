/*
if other.state = states.hooks
{
	with (obj_player)
	{
		if substate == HookType.up
		{
			state = states.Sjump
			sprite_index = spr_player_outofcontrolfall
			movespeed = -vsp
		}
		else if substate == HookType.down
		{
			state = states.freefall
			sprite_index = spr_player_freefall
		}
		else
		{
			state = playerPrevState
			sprite_index = playerPrevSprite
		}
	}
}
*/