draw_set_font(global.thinfont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
__draw_text_transformed_hook(get_game_width() / 2, (get_game_height() / 2) - 40, discstr, discanim, discanim, discspin);

if (discanim == 1 && discsquash)
{
    draw_set_font(global.thinfont);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text_fancy(get_game_width() / 2, get_game_height() - 54, string_get("menu/disclaimercontinue"));
}
