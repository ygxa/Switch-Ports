global.scene_on_room_start_override = false;
global.is_ruth_enabled = -1;

if (!viewWaitFrame)
{
    if (instance_exists(obj_player))
    {
        forcedViewThisFrame = false;
        
        with (obj_player)
        {
            with (obj_roomview_parent)
                event_user(2);
            
            if (image_alpha == 1 && visible)
            {
                with (obj_roomview_parent)
                    event_user(0);
            }
        }
        
        event_user(0);
    }
    else
    {
        event_user(0);
    }
}

with (obj_camera_post_parent)
    event_user(0);
