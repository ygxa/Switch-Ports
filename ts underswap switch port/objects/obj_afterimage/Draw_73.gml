if (drawEnd)
{
    if (additiveBlending)
        gpu_set_blendmode(bm_add);
    
    gpu_set_fog(true, color, 0, 0);
    draw_self();
    gpu_set_fog(false, c_black, 0, 0);
    
    if (additiveBlending)
        gpu_set_blendmode(bm_normal);
}
