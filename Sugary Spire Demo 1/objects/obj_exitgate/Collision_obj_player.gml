if (global.panic == 1)
{
    with (obj_player)
    {
        if (grounded && key_up && (state == 0 || state == 65 || state == 66 || state == 67 || state == 61))
        {
            targetDoor = "none";
            audio_stop_all();
            scr_savelevelDetails();
            obj_tv.tvsprite = spr_tvoff;
            
            if (state != 74)
            {
                sprite_index = spr_lookdoor;
                state = 74;
                image_index = 0;
            }
            
            if (!instance_exists(obj_endlevelfade))
            {
                with (instance_create(x, y, obj_endlevelfade))
                {
                    var _cam_x = camera_get_view_x(view_camera[0]);
                    var _cam_y = camera_get_view_y(view_camera[0]);
                    PlayerX = other.x - _cam_x;
                    PlayerY = other.y - _cam_y;
                }
            }
            
            global.panic = false;
        }
    }
}
