if (ded)
{
    draw_sprite_ext(spr_greaterdog_well, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    exit;
}

if (sprite_index == spr_greaterdog_hurt || vasleep)
{
    draw_sprite_ext(spr_greaterdog_hurt, 1, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    
    if (vout)
        draw_sprite_ext(spr_greaterdog, 2, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    else
        draw_sprite_ext(spr_greaterdog_hurt, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
    
    exit;
}

draw_sprite_ext(spr_greaterdog_base, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
draw_sprite_ext(spr_greaterdog_base_arms, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
draw_sprite_ext(spr_greaterdog_base_arms, 1, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
draw_sprite_ext(sprite_index, vout ? 1 : 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
