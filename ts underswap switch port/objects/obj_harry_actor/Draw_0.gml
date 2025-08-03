if (fly)
{
    var px = x;
    var py = y;
    x += (cos(siner) * 8 * amp);
    y += (sin(siner) * 4 * amp);
    draw_self();
    x = px;
    y = py;
}
else
{
    event_inherited();
}
