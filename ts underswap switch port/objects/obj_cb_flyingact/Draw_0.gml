set_font(fnt_main);
draw_set_color(c_black);
draw_text_transformed(x - 2, y - 2, text, image_xscale, image_yscale, direction);
draw_text_transformed(x - 2, y, text, image_xscale, image_yscale, direction);
draw_text_transformed(x - 2, y + 2, text, image_xscale, image_yscale, direction);
draw_text_transformed(x + 2, y + 2, text, image_xscale, image_yscale, direction);
draw_text_transformed(x + 2, y, text, image_xscale, image_yscale, direction);
draw_text_transformed(x + 2, y - 2, text, image_xscale, image_yscale, direction);
draw_set_color(c_white);
draw_text_transformed(x, y, text, image_xscale, image_yscale, direction);

with (obj_crossbones_monster)
{
    var a = lastActButtonArgs;
    
    if (array_length(a) < 6)
        break;
    
    var w = sprite_get_width(a[2]);
    var h = sprite_get_height(a[2]);
    draw_rectangle_pix(a[0], a[1] + h, w, 40, 0, 1);
    
    with (obj_battlemanager)
        drawButtonBase(a[0], a[1], a[2], a[3], a[4], a[5]);
}
