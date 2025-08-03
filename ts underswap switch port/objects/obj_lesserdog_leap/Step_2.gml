if (leaping)
{
    if ((x - 20) <= obj_battlemanager.boxX1)
    {
        leaping = false;
        side = 2;
        x = obj_battlemanager.boxX1 + 20;
        gravity = 0;
        speed = 0;
        targetAngle = -90;
        image_index = 0;
        alarm[0] = 15 - (obj_lesserdog_monster.attackSpeed * 5);
    }
    else if ((y - 20) <= obj_battlemanager.boxY1)
    {
        leaping = false;
        side = 1;
        y = obj_battlemanager.boxY1 + 20;
        gravity = 0;
        speed = 0;
        targetAngle = 180;
        image_index = 0;
        alarm[0] = 15 - (obj_lesserdog_monster.attackSpeed * 5);
    }
    else if ((x + 20) >= obj_battlemanager.boxX2)
    {
        leaping = false;
        side = 3;
        x = obj_battlemanager.boxX2 - 20;
        gravity = 0;
        speed = 0;
        targetAngle = 90;
        image_index = 0;
        alarm[0] = 15 - (obj_lesserdog_monster.attackSpeed * 5);
    }
    else if ((y + 20) >= obj_battlemanager.boxY2)
    {
        leaping = false;
        side = 0;
        y = obj_battlemanager.boxY2 - 20;
        gravity = 0;
        speed = 0;
        targetAngle = 0;
        image_index = 0;
        alarm[0] = 15 - (obj_lesserdog_monster.attackSpeed * 5);
    }
    else
    {
        switch (side)
        {
            case 0:
                targetAngle = 180;
                break;
            
            case 3:
                targetAngle = 0;
                break;
            
            case 2:
                targetAngle = 90;
                break;
            
            case 1:
                targetAngle = 270;
                break;
        }
        
        image_angle = number_approach_smooth(image_angle, targetAngle, 0.05, 0.5);
    }
}
else
{
    image_angle = number_approach_smooth(image_angle, targetAngle, 0.5, 0.5);
}
