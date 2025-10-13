draw_set_alpha(0.4);
draw_set_colour(c_black);
draw_rectangle(0, 0, get_game_width(), get_game_height(), false);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_sprite(spr_manual, page, get_game_width() / 2, get_game_height() / 2);

if (page == 14)
{
    draw_set_colour(c_black);
    draw_set_font(global.manualfont);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    __draw_text_hook(get_game_width() / 2, (get_game_height() / 2) + 15, creditsstr);
}

draw_set_colour(c_white);
draw_set_font(global.thinfont);
draw_set_valign(fa_top);
draw_set_halign(fa_right);

if (page > 0)
    draw_text_fancy(240, 432, string_get("menu/manual/previous"));

draw_set_halign(fa_left);

if (page < maxpage)
    draw_text_fancy(740, 432, string_get("menu/manual/next"));
