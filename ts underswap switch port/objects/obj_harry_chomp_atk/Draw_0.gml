if (drawState == 0)
{
    draw_sprite_ext(spr_harry_grabbed, image_index, x + armX, y + armY, image_xscale, image_yscale, image_angle, harBlend, image_alpha);
    draw_sprite_ext(spr_larry_grab, image_index, x, y, image_xscale, image_yscale, image_angle, larBlend, image_alpha);
}
else
{
    draw_sprite_ext(spr_larry_armthrow, image_index, x + armX, y + armY, image_xscale, image_yscale, image_angle, larBlend, image_alpha);
    draw_sprite_ext(spr_larry_throw, image_index, x, y, image_xscale, image_yscale, image_angle, larBlend, image_alpha);
}
