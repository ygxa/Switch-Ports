var drawx = x;
var drawy = y;

if (tauntBuffer)
{
    drawx += irandom_range(-1, 1);
    drawy += irandom_range(-1, 1);
}

var xscale = (abs(image_xscale) + squashval) * sign(image_xscale);
var yscale = image_yscale - squashval;
pal_swap_set(spr_palette, paletteselect, false);
draw_sprite_ext(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha);

if (flash)
    draw_sprite_ext_flash(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, c_white, image_alpha);

if (cottoned)
    draw_sprite_ext_flash(sprite_index, image_index, drawx, drawy + (46 * squashval), xscale, yscale, image_angle, 16681727, 0.6);

pal_swap_reset();

if (global.debugmode == 1)
{
    draw_set_font(font_dev);
    draw_text(x, y - 50, state);
    draw_text(x, y - 150, movespeed);
    
    if (object_index == obj_cottonwitch)
        draw_text(x, y - 100, bombreset);
    
    if (object_index == obj_sluggy)
    {
        draw_text(x, y - 100, idletimer);
        draw_text(x, y - 150, jumptimer);
    }
    
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
}
