switch (vstare)
{
    case 2:
        if (sprite_index != spr_looxstare3)
            sprite_index = spr_looxstare2;
        
        break;
    
    case 3:
        if (sprite_index == spr_looxstare3 && !instance_exists(obj_speechbubble))
        {
            sprite_index = spr_looxstare4;
        }
        else if (sprite_index != spr_loox && obj_battlemanager.mainState != (7 << 0) && obj_battlemanager.mainState != (6 << 0) && !obj_battlemanager.isBoxMoving)
        {
            sprite_index = spr_loox;
            vstare = 4;
        }
        
        break;
}

if (spared)
{
    armOffset = 0;
}
else if (armDir == 1)
{
    armOffset += 0.05;
    
    if (armOffset >= 1.5)
        armDir = 0;
}
else
{
    armOffset -= 0.05;
    
    if (armOffset <= -0.9)
        armDir = 1;
}

if (doReturnAnim)
{
    var dist = point_distance(x, y, xstart, ystart);
    
    if (dist <= 2)
    {
        speed = 0;
        x = xstart;
        y = ystart;
        
        if (sprite_index == spr_looxbite || sprite_index == spr_looxlookleft || sprite_index == spr_looxlookright || sprite_index == spr_looxvegattack3)
        {
            if (vstare == 2)
                sprite_index = spr_looxstare1;
            else if (vstare == 3)
                sprite_index = spr_looxstare2;
            else
                sprite_index = spr_loox;
        }
        
        doReturnAnim = false;
    }
    else
    {
        direction = point_direction(x, y, xstart, ystart);
        speed = dist * 0.25;
    }
}
