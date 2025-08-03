if (yeet)
{
    draw_self();
    exit;
}

depth = 0;

if (boosterIndex != -1)
    draw_sprite_ext(spr_dogboard_booster_back, floor(boosterIndex), floor(x), floor(y), 1, 1, 0, image_blend, 1);

draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), 1, 1, 0, image_blend, 1);

if (boosterIndex != -1)
{
    if (drawAbove)
        depth = -5000;
    else
        draw_sprite_ext(spr_dogboard_booster_front, floor(boosterIndex), floor(x), floor(y), 1, 1, 0, image_blend, 1);
}
