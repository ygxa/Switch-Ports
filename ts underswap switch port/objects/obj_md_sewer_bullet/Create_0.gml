event_inherited();

if (global.playerarmdf >= 2.5)
    damageAmount = choose(5, 5.5);
else
    damageAmount = 5;

image_speed = 0.4;
image_alpha = 0;
depth = -900;
var b = instance_nearest(x, y, obj_ruins_bandage);
var cam = view_get_camera(0);
var _xv = camera_get_view_x(cam);

if (b != -4 && !b.visible && b.x >= _xv && b.x <= (_xv + camera_get_view_width(cam)))
    move_towards_point(b.x + 1, b.y + 1, 7);
else
    move_towards_point((obj_player.x + irandom(20)) - 10, (obj_player.y + irandom(20)) - 10, irandom_range(6, 6.5));
