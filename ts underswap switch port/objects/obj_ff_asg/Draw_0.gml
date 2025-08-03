if (pose != -1)
{
    draw_sprite_ext(pose, image_index, x, y, 2, 2, 0, image_blend, 1);
}
else
{
    draw_sprite_ext(spr_asgb_normal, 0, x, y, 2, 2, 0, image_blend, 1);
    
    if (sprite_index != -1)
        draw_sprite_ext(sprite_index, image_index, x + 20, y, 2, 2, 0, image_blend, 1);
}
