switch (stage)
{
    case 0:
        step += (0.035 + (0.005 * obj_lesserdog_monster.attackSpeed));
        
        if (step >= 1)
        {
            stage = 1;
            var side = irandom(2);
            
            if (side == obj_lesserdog_monster.lastSearch)
                side = (side + choose(1, 2)) % 3;
            
            obj_lesserdog_monster.lastSearch = side;
            
            switch (side)
            {
                case 0:
                    x = -80;
                    y = irandom_range(300, 480);
                    break;
                
                case 1:
                    y = 560;
                    x = irandom_range(0, 640);
                    break;
                
                case 2:
                    x = 720;
                    y = irandom_range(300, 480);
                    break;
            }
            
            targX = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
            targY = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
            dir = point_direction(x, y, targX, targY);
            dist = point_distance(x, y, targX, targY) * 0.95;
            corner1x = x + lengthdir_x(22, dir + 90);
            corner1y = y + lengthdir_y(22, dir + 90);
            corner2x = x + lengthdir_x(22, dir - 90);
            corner2y = y + lengthdir_y(22, dir - 90);
            step = 0;
            break;
        }
        
        with (obj_lesserdog_monster)
            neckLength = number_approach_smooth2(neckLength, 90, other.step);
        
        break;
    
    case 1:
        step += (0.02 + (0.005 * obj_lesserdog_monster.attackSpeed));
        
        if (step >= 0.5)
        {
            step = 1;
            stage = 2;
        }
        
        length = number_approach_smooth2(length, dist, step);
        lendir_x = lengthdir_x(length, dir);
        lendir_y = lengthdir_y(length, dir);
        lendir2_x = lengthdir_x(length + 25, dir);
        lendir2_y = lengthdir_y(length + 25, dir);
        
        if (step >= 1)
            step = 0;
        
        break;
    
    case 2:
        face += 0.2;
        
        if (floor(face) >= 4)
            face -= 4;
        
        if (step < 40)
        {
            step++;
        }
        else
        {
            step = 0;
            sfx_play(snd_doghurt);
            face = 4;
            stage = 3;
        }
        
        break;
    
    case 3:
        if (step < 8)
        {
            step++;
        }
        else
        {
            step = 0;
            stage = 4;
        }
        
        break;
    
    case 4:
        step += 0.04;
        
        if (step >= 1)
        {
            stage = 5;
            step = 0;
            break;
        }
        
        length = number_approach_smooth2(length, 0, step);
        lendir_x = lengthdir_x(length, dir);
        lendir_y = lengthdir_y(length, dir);
        lendir2_x = lengthdir_x(length + 25, dir);
        lendir2_y = lengthdir_y(length + 25, dir);
        break;
    
    case 5:
        step += 0.035;
        
        if (step >= 0.6)
        {
            with (obj_lesserdog_monster)
            {
                headInd = 2;
                neckLength = other.returnNeckLength;
            }
            
            instance_destroy();
            break;
        }
        
        with (obj_lesserdog_monster)
        {
            headInd = 2;
            neckLength = number_approach_smooth2(neckLength, other.returnNeckLength, other.step);
        }
        
        break;
}

if (stage != 0 && stage < 5)
{
    var heartX1, heartY1, heartX2, heartY2;
    
    with (obj_battleheart)
    {
        heartX1 = bbox_left;
        heartY1 = bbox_top;
        heartX2 = bbox_right;
        heartY2 = bbox_bottom;
    }
    
    if (rectangle_in_triangle(heartX1, heartY1, heartX2, heartY2, corner1x, corner1y, corner1x + lendir2_x, corner1y + lendir2_y, corner2x + lendir2_x, corner2y + lendir2_y))
        event_user(0);
    else if (rectangle_in_triangle(heartX1, heartY1, heartX2, heartY2, corner2x, corner2y, corner2x + lendir_x, corner2y + lendir_y, corner1x, corner1y))
        event_user(0);
}
