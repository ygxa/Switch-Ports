draw_self();
draw_sprite_ext(spr_compass_needle, 0, x, y, image_xscale, image_yscale, needleRotLerped, c_white, 1);
draw_sprite_ext(lang_get_sprite(spr_widget_text), 0, x, y + 48, 2, 2, 0, c_white, 1);
