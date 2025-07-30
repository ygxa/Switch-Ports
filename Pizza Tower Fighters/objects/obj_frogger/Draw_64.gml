draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_console);

for (var i = 0; i < array_length(console); i++)
    draw_text(0, 10 + (20 * i), console[i]);

draw_set_halign(fa_center);
draw_sprite(spr_frogger, 0, 860, 0);
