if (!go)
{
    alarm[0] = 1;
    exit;
}

if (!obj_battlemanager.isBoxMoving)
{
    selectorVisible = true;
    selectorSpeed = 6;
    
    if (xirandom(1) == 0)
    {
        if (selectorIndex == 0)
        {
            selectorDir = 3;
            selectorSprIndex = spr_battletargetselskinny;
            selectorX = x - (sprite_width * 0.5) - 16;
            selectorY = y - 7;
        }
        else
        {
            selectorDir = 1;
            selectorSprIndex = spr_battletargetselskinny_horiz;
            selectorX = x - 64;
            selectorY = y - 8;
        }
    }
    else if (selectorIndex == 0)
    {
        selectorDir = 2;
        selectorSprIndex = spr_battletargetselskinny;
        selectorX = x + (sprite_width * 0.5) + 8;
        selectorY = y - 7;
    }
    else
    {
        selectorDir = 0;
        selectorSprIndex = spr_battletargetselskinny_horiz;
        selectorX = x - 64;
        selectorY = y + sprite_height + 8;
    }
    
    currSelector = instance_create_xy(selectorX, y - 7, obj_gunselector);
    
    with (currSelector)
    {
        depth = -2 - other.selectorIndex;
        dir = other.selectorDir;
        x = other.selectorX;
        y = other.selectorY;
        sprite_index = other.selectorSprIndex;
        deltaPos = other.selectorSpeed;
    }
}
else
{
    alarm[0] = 2;
}
