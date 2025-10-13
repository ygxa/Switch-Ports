with (other)
{
    if (input_check("up") && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.sjumpprep) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
    {
        other.sprite_index = spr_elevatorclose;
        other.image_index = 0;
        event_play_oneshot("event:/sfx/player/doorenter");
        obj_drawcontroller.chargecamera = 0;
        obj_player.sprite_index = spr_lookdoor;
        obj_player.enteredDoor = other;
        obj_player.targetDoor = other.targetDoor;
        obj_player.targetRoom = other.targetRoom;
        obj_player.image_index = 0;
        obj_player.state = states.door;
        obj_player.mach2 = 0;
        obj_player.elevator = 1;
        show_debug_message(string(other.x - obj_player.x) + "\n" + string(other.y - obj_player.y));
        other.alarm[0] = 60;
    }
}
