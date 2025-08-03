var trans = 2.5 * sin(siner);
draw_sprite_stretched(spr_shadow, 0, x - (trans * 0.5) - 3, y + 25, 19 + trans, 15);
draw_sprite_ext(sprite_index, image_index, x + sprite_width, y + trans, -1, 1, 0, #222222, 1);
