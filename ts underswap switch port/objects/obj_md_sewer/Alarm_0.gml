if (!instance_exists(obj_fader) && bridgeX == -1 && !instance_exists(obj_md_bullet_array))
{
    var py, showTopLayers, px;
    
    with (obj_player)
    {
        showTopLayers = place_meeting(x, y, obj_misczone);
        px = x;
        py = y;
    }
    
    var yPos;
    
    if (py >= y && !showTopLayers)
        yPos = y - 40;
    else
        yPos = y + 40;
    
    var xPos;
    
    if (px >= x)
        xPos = x + 20;
    else
        xPos = x - 20;
    
    var dist = point_distance(xPos, yPos, px, py);
    
    if (dist < 100)
    {
        var extendDir = point_direction(px, py, xPos, yPos);
        xPos += lengthdir_x(100 - dist, extendDir);
        yPos += lengthdir_y(100 - dist, extendDir);
    }
    
    var b = instance_create_xy(xPos, yPos, obj_md_sewer_bullet);
    
    if (widerRange)
    {
        with (b)
            move_towards_point((px + irandom(50)) - 25, (py + irandom(50)) - 25, irandom_range(6, 8));
        
        widerRange = false;
    }
    
    sfx_play(snd_throw);
}

if (room == rm_ruins4 && irandom(4) == 0)
{
    alarm[0] = irandom_range(10, 13);
    widerRange = true;
}
else
{
    alarm[0] = irandom_range(23, 28);
}
