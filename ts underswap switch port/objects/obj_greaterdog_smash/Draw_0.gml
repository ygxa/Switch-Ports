if (!fade)
{
    if (bt_set_surface_transform())
        exit;
    
    draw_sprite_ext(spr_greaterdog_base, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    draw_sprite_ext(spr_greaterdog, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
}

draw_sprite_ext(spr_greaterdog_fist, 0, x + -4, y + 114 + handY, 2, 2, 0, image_blend, image_alpha);

if (attackType == 0)
    draw_sprite_ext(spr_greaterdog_fist, 1, x + 146, y + 114 + handY, 2, 2, 0, image_blend, image_alpha);
