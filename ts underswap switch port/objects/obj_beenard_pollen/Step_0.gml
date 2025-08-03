vspeed += 0.1;

if ((bbox_bottom + 2) >= obj_battlemanager.boxY1)
    depth = -2;

if (y > obj_battlemanager.boxY2)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
