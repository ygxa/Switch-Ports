event_inherited();
bulletStage = 0;
warning = true;
timeBeforeLaunch = 30;
targetType = 0;
target = 0;
side = 0;

switch (targetType)
{
    case 0:
        y = obj_battleheart.y + 8;
        break;
    
    case 1:
        y = obj_battleheart.y - 32;
        break;
    
    case 2:
        y = obj_battleheart.y + 32;
        break;
}

image_xscale = 2;
image_yscale = 2;
siner = 0;
alarm[1] = 10;
alarm[0] = timeBeforeLaunch;
