draw_set_font(font_caption);
draw_set_colour(c_red);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
__draw_text_hook(5, get_game_height() - 5, errors);
draw_set_colour(c_white);
draw_set_valign(fa_top);
