var dir = direction;
var destDir = point_direction(x, y, obj_player.x, obj_player.y);
direction = number_approach_linear(dir, dir + angle_difference(destDir, dir), clamp(16 / sqrt(max(1, 1.5 * point_distance(x, y, obj_player.x, obj_player.y))), 0, 16));
image_angle = direction - 90;

if (x > (room_width + 60) || x < -60)
    instance_destroy();

if (y > (room_height + 60) || y < -60)
    instance_destroy();
