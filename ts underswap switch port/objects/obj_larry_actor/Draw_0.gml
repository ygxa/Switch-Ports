if (fly)
{
    var px = x;
    var py = y;
    x += (cos(siner) * -8 * amp);
    y += (sin(siner) * 4 * amp);
    draw_self();
    x = px;
    y = py;
}
else if (pushing)
{
    var px = x;
    
    if (pushTimer >= 30)
        x += ((pushTimer % 2) ? 1 : -1);
    
    draw_self();
    x = px;
}
else
{
    event_inherited();
}
