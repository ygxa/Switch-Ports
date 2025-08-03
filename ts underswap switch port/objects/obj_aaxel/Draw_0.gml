if (shadow)
{
    var trans = 2.5 * sin(siner);
    draw_sprite_stretched(spr_shadow, 0, (x + 10) - (trans * 0.5), y + 45, 24 + trans, 15);
}

var py = y;
y = drawY;
draw_self();
y = py;
