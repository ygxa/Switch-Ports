if (boosterIndex != -1 && drawAbove)
{
    depth = -5000;
    draw_sprite_ext(spr_dogboard_booster_front, floor(boosterIndex), floor(x), floor(y), 1, 1, 0, image_blend, 1);
    depth = 0;
}
