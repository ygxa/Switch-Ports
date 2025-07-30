if place_meeting(x, y, obj_player)
    visited = 1
//New Door Trigger Code
with instance_place(x, y, obj_doortrigger_parent)
{
	other.targetDoor = id_door;
}