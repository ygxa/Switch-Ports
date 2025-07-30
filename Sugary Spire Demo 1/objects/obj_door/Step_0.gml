with (obj_player)
{
    if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 0 || state == 61 || state == 65 || state == 66 || state == 67) && !instance_exists(obj_fadeout) && state != 74 && state != 58 && state != 59)
    {
        mach2 = 0;
        image_index = 0;
        obj_camera.chargecamera = 0;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        state = 74;
        global.roomsave = 0;
        
        if (other.ResetSaveroom == true)
        {
            global.collect = 0;
            ds_list_clear(global.saveroom);
            ds_list_clear(global.baddieroom);
        }
    }
}
