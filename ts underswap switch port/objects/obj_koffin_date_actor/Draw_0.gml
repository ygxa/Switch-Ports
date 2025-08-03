draw_sprite_ext(sprite_index, image_index, x, y + batYOff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (drawBat)
    draw_sprite_ext(spr_kk_bat, batImageIndex, x + 2, (y - 45) + batYOff, image_xscale, image_yscale, image_angle, c_white, image_alpha);
