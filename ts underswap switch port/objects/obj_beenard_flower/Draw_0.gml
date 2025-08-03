if (y != ystart)
{
    draw_set_color(c_white);
    draw_line_width_pix(xstart, ystart, x, y - (sprite_height * 0.5), 4 * targetScale);
}

draw_self();
