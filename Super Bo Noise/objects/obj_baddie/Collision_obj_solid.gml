if (place_meeting_collision(x, y))
    exit;

if (state != 6 && state != 156 && state != 139 && state != 268 && (!place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_onewaybigblock)))
    instance_destroy();
