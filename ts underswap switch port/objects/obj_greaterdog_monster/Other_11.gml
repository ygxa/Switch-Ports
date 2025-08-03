switch (global.bev_subtype)
{
    case 0:
        switch (attackType)
        {
            case -1:
                obj_battlemanager.attackTime = 1;
                bt_set_boxtype((0 << 0));
                break;
            
            case 0:
                obj_battlemanager.attackTime = 150;
                bt_set_boxtype((1 << 0));
                break;
            
            case 1:
                obj_battlemanager.attackTime = 165;
                bt_set_boxtype((4 << 0));
                break;
            
            case 2:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((14 << 0));
                bt_bullet(obj_greaterdog_legs, 316, 256);
                break;
        }
        
        attackTime = 0;
        break;
    
    case 1:
        switch (attackType)
        {
            case 0:
                if (attackTime == 1)
                    bt_bullet(obj_dogwell_bul, (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2, obj_battlemanager.boxY2 - 54);
                
                break;
            
            case 1:
                if (attackTime == 1)
                    bt_bullet(obj_greaterdog_smash, x, y);
                
                break;
            
            case 2:
                if (obj_battlemanager.attackTimer < 30)
                    y = number_approach_smooth(y, ystart, 0.2, 0.5);
                else
                    y = number_approach_smooth(y, 108, 0.2, 0.5);
                
                if (obj_battlemanager.attackFrame == 10)
                    bt_bullet(obj_greaterdog_tail, 316, 259);
                
                break;
        }
        
        attackTime++;
        break;
    
    case 2:
        y = ystart;
        break;
}
