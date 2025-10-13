x = camera_get_view_x(view_camera[1]);
y = camera_get_view_y(view_camera[1]);
w = camera_get_view_width(view_camera[1]);
h = camera_get_view_height(view_camera[1]);

if (!surface_exists(surf))
    surf = surface_create(w, h);

if (surface_get_width(surf) != w || surface_get_height(surf) != h)
    surface_resize(surf, w, h);

surface_set_target(surf);
draw_sprite_stretched_ext(spr_1x1, 0, -32, -32, w + 64, h + 64, c_black, 0.4);
gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);

with (obj_player)
{
    draw_set_alpha(0.4);
    draw_circle((x - other.x) + random_range(-1, 1), (y - other.y) + random_range(-1, 1), 300 + random_range(-1, 1), 0);
    draw_set_alpha(1);
    draw_circle((x - other.x) + random_range(-1, 1), (y - other.y) + random_range(-1, 1), 250 + random_range(-1, 1), 0);
}

with (obj_lamp)
    draw_circle(((x - other.x) + random_range(-1, 1)) - 10, (y - other.y) + random_range(-1, 1), 40 + random_range(-1, 1), 0);

gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf, x, y);
