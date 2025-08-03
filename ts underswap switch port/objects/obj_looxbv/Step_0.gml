if (y >= (obj_battlemanager.boxY2 - 20))
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
