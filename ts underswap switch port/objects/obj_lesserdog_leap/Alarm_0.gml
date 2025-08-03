var dir = point_direction(x, y, obj_battleheart.x, obj_battleheart.y);
var offX = lengthdir_x(30, dir);
var offY = lengthdir_y(30, dir);
gravity = 0.16;

switch (side)
{
    case 2:
        gravity_direction = 90;
        offX += irandom_range(20, 50);
        break;
    
    case 1:
        gravity_direction = 0;
        offY += irandom_range(20, 50);
        break;
    
    case 3:
        gravity_direction = 270;
        offX -= irandom_range(20, 50);
        break;
    
    case 0:
        gravity_direction = 180;
        offY -= irandom_range(20, 50);
        break;
}

move_towards_point(obj_battleheart.x + offX, obj_battleheart.y + offY, 5);
image_index = 1;
leaping = true;
sfx_play_vol(snd_bark2, 0.7);
