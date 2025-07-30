if (!instance_exists(ID)) || (obj_player.state == states.mach3 || obj_player.state == states.pizzanoshoulderbash || obj_player.state == states.pizzanosidejump || obj_player.state == states.minecart)
	exit;
// Inherit the parent event
event_inherited();

