if (sprite_index == spr_beenard_hurt)
{
    draw_self();
}
else
{
    draw_sprite_ext(bodySprite, floor(wingIndex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(faceSprite, image_index, x + 4, y + 10, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
