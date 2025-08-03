y += verticalOffset;

if (global.flavor_sprites)
    image_blend = merge_color(c_black, flavorColor, attackFade);
else
    image_blend = merge_color(c_black, c_white, attackFade);

if (spared)
{
    if (global.flavor_sprites)
        image_blend = merge_color(c_black, flavorColor, 0.5);
    else
        image_blend = c_gray;
}

draw_self();

if (!leaning)
    draw_sprite_ext(face, floor(shineFrame), x - 8, y - 22, 2, 2, image_angle, image_blend, image_alpha);

y -= verticalOffset;

if (attackType == 0 && attackHelper > 0 && !obj_battlemanager.isBoxMoving)
{
    attackHelper--;
    
    if (attackHelper < 60 && frac(attackHelper / 15) < 0.7)
        draw_sprite_ext(spr_arrowsvert, 0, 312, 254, 2, 2, 0, c_white, 1);
}
