if (sprite_index == spr_whimsunow_up)
{
    var py = y;
    y += (sin(siner) * 2);
    draw_self();
    y = py;
}
else
{
    draw_self();
}
