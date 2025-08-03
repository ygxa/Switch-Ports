draw_self();

if (side)
{
    draw_sprite_ext(spr_metb_umbrella, umbrellaOpen, x - 8, y - 3, 1, 1, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_metb_hand_umbrella, 0, x - 8, y, 1, 1, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_metb_hand, 0, x + 9, y + 1, 1, 1, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(spr_metb_umbrella, umbrellaOpen, x + 6, y - 3, 1, 1, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_metb_hand_umbrella, 0, x + 6, y, 1, 1, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_metb_hand, 0, x - 10, y + 1, 1, 1, image_angle, image_blend, image_alpha);
}
