if (cutoff)
{
    if (bt_set_surface_cutoff())
        exit;
}

var _y = y;
y += (sin(siner) * bounceAmplitude);
draw_self();
y = _y;
