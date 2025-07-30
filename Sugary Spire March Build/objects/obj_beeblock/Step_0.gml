if place_meeting(x + 2, y, obj_donutShitted) || place_meeting(x - 2, y, obj_donutShitted)
	{
	instance_destroy()
	instance_destroy(obj_donutShitted)
	}