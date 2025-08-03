set_font(fnt_main);
draw_set_color((ind == -1) ? c_gray : textColor);
draw_set_halign(alignment);
draw_set_valign(fa_middle);
draw_text(x, y, text);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
