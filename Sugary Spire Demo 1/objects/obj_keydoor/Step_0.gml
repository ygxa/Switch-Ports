with (obj_player)
{
    if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 0 || state == 61 || state == 65 || state == 66 || state == 67) && !instance_exists(obj_fadeout) && state != 74 && state != 58 && state != 59)
    {
        if (ds_list_find_index(global.saveroom, other.id) != -1)
        {
            mach2 = 0;
            image_index = 0;
            obj_camera.chargecamera = 0;
            targetDoor = other.targetDoor;
            targetRoom = other.targetRoom;
            state = 74;
            global.roomsave = 0;
        }
        else if (global.key_inv == 1)
        {
            scr_sound(29);
            state = 58;
            image_index = 0;
            obj_camera.chargecamera = 0;
            targetDoor = other.targetDoor;
            targetRoom = other.targetRoom;
            
            with (other)
            {
                ds_list_add(global.saveroom, id);
                image_index = 0;
                sprite_index = spr_doorvisited;
                image_speed = 0.35;
            }
            
            global.key_inv = 0;
            instance_create(x, y, obj_lock);
            global.roomsave = 0;
        }
    }
}
