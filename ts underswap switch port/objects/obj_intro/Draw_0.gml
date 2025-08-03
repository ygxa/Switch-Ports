if (image_index == 7)
{
    draw_set_alpha(image_alpha);
    draw_sprite_part(spr_introlong, -1, 0, longyoffset, 320, 110, 0, 30);
    draw_set_alpha(1);
}
else
{
    var a;
    
    if (dontActuallyFade)
    {
        a = image_alpha;
        image_alpha = 1;
    }
    
    var a2 = image_alpha;
    
    if (image_alpha != 1 && nextTarget < 3)
    {
        if (!endbox)
            image_alpha = 1;
        
        draw_self();
        var i = image_index;
        image_index = nextTarget;
        
        if (fade == 2)
            image_alpha = endbox ? a2 : (1 - a2);
        else if (fade == -1)
            image_alpha = 0;
        else
            image_alpha = 1;
        
        gpu_set_colorwriteenable(true, true, true, false);
        draw_self();
        gpu_set_colorwriteenable(true, true, true, true);
        image_index = i;
    }
    else
    {
        image_alpha *= overrideFade;
        draw_self();
    }
    
    image_alpha = a2;
    
    if (dontActuallyFade)
        image_alpha = a;
}
