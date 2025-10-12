depth = 4

canCollide = function(arg0, arg1 = obj_parent_player)
{
	switch (arg1.object_index)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			var _state = global.freezeframe ? arg1.frozenState : arg1.state
			return _state == PlayerState.minecart || _state == PlayerState.minecart_launched || _state == PlayerState.minecart_bump;
			break
		
		case obj_minecart:
		case obj_creamThief:
		case obj_cherryBombCart:
			return true;
			break
		
		default:
			return false;
			break
	}
}
