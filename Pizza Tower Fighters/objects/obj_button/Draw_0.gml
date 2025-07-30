var blockbutton = false;

with (obj_demrecloader)
{
    if (page == 0 && other.name == "<")
        blockbutton = true;
    else
        blockbutton = false;
}

if ((!blockbutton || name == "Delete") && name != "Go back")
{
    image_blend = make_color_rgb(global.buttonrgb1, global.buttonrgb2, global.buttonrgb3);
    draw_self();
}

draw_set_color(selected ? c_white : c_gray);
draw_rectangle(x, y, x + image_xscale, y + image_yscale, true);

if (!surface_exists(surf))
    surf = surface_create(image_xscale, image_yscale);

draw_set_color(c_white);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
draw_surface(surf, x, y);
draw_text(x + 10, y + 7, name);
