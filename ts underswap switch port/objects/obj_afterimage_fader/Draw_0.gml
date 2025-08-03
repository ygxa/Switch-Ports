if (transformable)
{
    if (bt_set_surface_transform())
        exit;
}
else if (cutoff)
{
    if (bt_set_surface_cutoff())
        exit;
}
else if (drawEnd)
{
    exit;
}

draw_self();
