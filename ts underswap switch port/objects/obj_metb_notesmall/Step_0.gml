if (y < obj_battlemanager.boxY1 || y > obj_battlemanager.boxY2)
    fading = true;

if (fading)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
