shader_set(shd_premultiply);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), bgcolor, image_alpha);
pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, image_alpha);
shader_set(shd_premultiply);
draw_sprite_stretched_ext(spr_pitfalltv, 0, 0, 0, get_game_width(), get_game_height(), c_white, image_alpha);
