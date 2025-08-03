draw_self();

if (image_index < 12)
{
    var heartAlpha = clamp((image_index - 3) / 5, 0, 1);
    
    if (heartAlpha != 0)
    {
        with (obj_battleheart)
            draw_sprite_ext(spr_redsoul_outline, image_index, x, y, 1, 1, 0, c_white, heartAlpha);
    }
}
