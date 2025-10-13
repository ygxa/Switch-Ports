x = camera_get_view_x(view_camera[1]);
y = camera_get_view_y(view_camera[1]);
surface_set_target(surf);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, w, h, 0);
gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);

with (obj_player)
{
    draw_set_alpha(1);
    draw_circle((x - other.x) + random_range(-1, 1), (y - other.y) + random_range(-1, 1), other.circleradius + random_range(-1, 1), 0);
}

gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf, x, y);
