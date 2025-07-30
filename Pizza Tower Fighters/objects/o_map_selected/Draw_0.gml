draw_sprite(s_b_mapselect, 0, 494 + tox, 0);
draw_sprite_ext(sprite_index, -1, x + tox2, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
alpha = lerp(alpha, 1, 0.1);
drawy = lerp(drawy, 0, 0.1);
draw_sprite_ext(sprite, 0, x + (sprite_get_width(sprite_index) / 2) + tox2, y - 30 - drawy, 1, 1, 0, c_white, alpha);
