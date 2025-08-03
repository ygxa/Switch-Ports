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

if (additiveBlending)
    gpu_set_blendmode(bm_add);

gpu_set_fog(true, color, 0, 0);
draw_self();
gpu_set_fog(false, c_black, 0, 0);

if (additiveBlending)
    gpu_set_blendmode(bm_normal);
