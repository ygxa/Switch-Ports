pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();

if (sprite_index == spr_rankD && image_index >= (image_number - 1) && obj_player.character == "P")
    draw_sprite_ext(spr_rankD_goodjob, 0, x + irandom_range(-1, 1), y + irandom_range(-1, 1), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
