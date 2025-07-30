if (playerID == -4 || !instance_exists(playerID))
	return

x = playerID.x
y = playerID.y
image_xscale = playerID.image_xscale

if (!is_undefined(targetState) && playerID.state != targetState)
{
	alarm[0] = -1
	instance_destroy()
}
