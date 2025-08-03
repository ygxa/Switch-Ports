image_alpha = 1;

switch (dir)
{
    case 1:
        image_yscale = -1;
        creepY = -sprite_height;
        break;
    
    case 0:
        creepY = sprite_height;
        break;
    
    case 2:
        image_angle = 90;
        creepX = sprite_height;
        break;
    
    case 3:
        image_angle = 270;
        creepX = -sprite_height;
        break;
}

alarm[1] = 1;
