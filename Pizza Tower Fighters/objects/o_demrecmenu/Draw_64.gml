var str = "demrec state - play";
draw_set_color(c_white);

switch (state)
{
    case (1 << 0):
        str = "demrec state - play";
        draw_line_width(0, 540, (i / length) * 960, 540, 3);
        break;
    
    case (0 << 0):
        str = "demrec state - record";
        break;
    
    case (2 << 0):
        str = "demrec state - stopped";
        break;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(F_Tutorial);
draw_text(0, 0, str);
