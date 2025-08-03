if (followParent)
    x = parentObj.x;

if (y >= (obj_battlemanager.boxY2 - 4) && watchForFloor)
    handleFloorCollision();

if (spin)
    image_angle += 3;

if (fade)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
