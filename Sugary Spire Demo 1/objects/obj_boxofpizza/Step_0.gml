with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == 62 || state == 29)) || ((state == 64 || state == 71 || state == 72) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeout) && state != 74 && state != 59)
        {
            other.depth = -10;
            scr_sound(112);
            obj_player.box = 1;
            mach2 = 0;
            obj_camera.chargecamera = 0;
            x = other.x;
            obj_player.targetDoor = other.targetDoor;
            obj_player.targetRoom = other.targetRoom;
            sprite_index = spr_player_downpizzabox;
            image_index = 0;
            state = 74;
        }
    }
    
    if (other.image_yscale == -1)
    {
        if ((((key_up || state == 60) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == 57 || state == 86 || state == 60)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeout))
        {
            scr_sound(112);
            other.depth = -10;
            obj_player.box = 1;
            other.depth = -8;
            mach2 = 0;
            obj_camera.chargecamera = 0;
            x = other.x;
            obj_player.targetDoor = other.targetDoor;
            obj_player.targetRoom = other.targetRoom;
            sprite_index = spr_player_uppizzabox;
            image_index = 0;
            state = 74;
        }
    }
}
