draw_text(x, y - 20, name);
draw_set_color(selected ? c_white : c_gray);
draw_rectangle(x, y, x + image_xscale, y + image_yscale, true);

if (!surface_exists(surf))
    surf = surface_create(image_xscale, image_yscale);

draw_set_color(c_white);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_text(10, 7, text);
surface_reset_target();
draw_surface(surf, x, y);
