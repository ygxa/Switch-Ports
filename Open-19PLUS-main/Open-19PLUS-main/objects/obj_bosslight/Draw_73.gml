x = camera_get_view_x(view_camera[1]);
y = camera_get_view_y(view_camera[1]);
surface_set_target(surf);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, w, h, 0);
gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);

with (target)
{
    draw_set_alpha(1);
    draw_circle(x - other.x, y - other.y, other.radius, 0);
}

gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf, x, y);
