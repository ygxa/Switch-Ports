var px;

if (shake)
{
    px = x;
    
    if (irandom(1) == 0)
        x += choose(-1, 1);
}

if (chasing)
{
    drawChase(self);
}
else if (revealed)
{
    var trans = bounceAmount * 2.5 * sin(siner);
    
    if (sprite_index == spr_madhouse_partleft)
    {
        draw_sprite_stretched_ext(spr_shadow, 0, (x + 4) - (trans * 0.5), y + 45, 25 + trans, 15, c_white, fade);
        draw_sprite_ext(spr_madhouse_arm_l, 0, x + 1, y + trans + 26, fade, fade, -10 - (sin(siner2) * 10), c_white, fade);
        draw_sprite_ext(sprite_index, image_index, x - 6, y + trans, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_madhouse_arm_r, 0, x + 26, y + trans + 36, fade, fade, -20 + (sin(siner2) * 10), c_white, fade);
    }
    else
    {
        draw_sprite_stretched_ext(spr_shadow, 0, (x + 4) - (trans * 0.5), y + 45, 25 + trans, 15, c_white, fade);
        draw_sprite_ext(spr_madhouse_arm_r, 0, x + 28, y + trans + 33, fade, fade, -10 + (sin(siner2) * 10), c_white, fade);
        draw_sprite_ext(spr_madhouse_arm_l, 0, x + 4, y + trans + 33, fade, fade, 10 - (sin(siner2) * 10), c_white, fade);
        draw_sprite_ext(sprite_index, image_index, x, y + trans, 1, 1, 0, c_white, 1);
    }
}
else
{
    draw_self();
}

if (shake)
    x = px;
