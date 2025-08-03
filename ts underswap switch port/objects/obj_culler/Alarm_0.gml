var inst0id = inst_get(0);
var doorSolid = obj_ruin_door.s;

with (all)
{
    if (object_index != obj_culler && object_index != obj_ruin_walllever && object_index != obj_player && !(x == 0 && y == 0) && !persistent && object_index != obj_ruin_door && id != inst0id && id != doorSolid)
        instance_deactivate_object(id);
}

instance_activate_region(camera_get_view_x(view_camera[0]) - 160, camera_get_view_y(view_camera[0]) - 120, camera_get_view_width(view_camera[0]) + 320, camera_get_view_height(view_camera[0]) + 240, true);
alarm[0] = 20;
