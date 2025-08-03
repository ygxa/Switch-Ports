if (!instance_exists(obj_fader))
{
    var xPos, horzSpeed;
    
    if (targetX < x)
    {
        xPos = x + 10;
        horzSpeed = 1;
    }
    else
    {
        xPos = x - 10;
        horzSpeed = -1;
    }
    
    instance_create_xy(xPos, y, obj_md_sewer_text).hspeed = horzSpeed;
}

alarm[1] = irandom_range(30, 60);
