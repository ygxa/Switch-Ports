canCollide = function(arg0, arg1 = obj_parent_player)
{
	switch (arg1.object_index)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			var _state = global.freezeframe ? arg1.frozenState : arg1.state
			return (_state == PlayerState.cotton && arg1.state != PlayerState.cottondrill) || _state == PlayerState.cottonroll;
			break
		
		default:
			return true;
			break
	}
}
