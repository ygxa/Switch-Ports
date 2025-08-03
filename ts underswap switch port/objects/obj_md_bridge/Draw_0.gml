if (revealed)
{
    var trans = bounceAmount * 2.5 * sin(siner);
    draw_sprite_stretched_ext(spr_shadow, 0, x - (trans * 0.5), y + 25, 19 + trans, 15, c_white, shadowFade);
    draw_sprite_ext(sprite_index, image_index, x, y + trans, 1, 1, 0, c_white, 1);
}
else
{
    draw_self();
}
