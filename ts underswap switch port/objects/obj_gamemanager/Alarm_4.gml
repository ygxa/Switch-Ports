var normView = true;

with (obj_roomview_parent)
{
    event_user(1);
    normView &= !place_meeting(x, y, obj_player);
}

if (normView)
{
    forceView = false;
    forceViewX = 0;
    forceViewY = 0;
    forceViewSpeed = 4;
    normalViewSpeed = 4;
    
    if (!customViewMode)
    {
        with (obj_player)
        {
            var cam = view_get_camera(0);
            camera_set_view_target(cam, -4);
            camera_set_view_pos(cam, clamp(floor(x) - 160, 0, room_width - 320), clamp(floor(y) - 120, 0, room_height - 240));
        }
    }
}

viewWaitFrame = false;
