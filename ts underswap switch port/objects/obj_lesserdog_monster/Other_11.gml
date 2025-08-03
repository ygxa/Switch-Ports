switch (global.bev_subtype)
{
    case 0:
        attackTime = 0;
        
        if (!doneSearch)
            attackType = 0;
        else
            attackType = xirandom(3);
        
        if (isSpareable)
            attackType = -1;
        
        with (obj_battlemanager)
        {
            attackTimer = 150;
            
            if (other.attackType == 2 || other.attackType == 3)
                attackTimer -= 40;
            
            if (other.attackType == 3)
                bt_set_boxtype((4 << 0));
            
            if (other.attackType == -1)
                attackTimer = 1;
            
            attackTime = attackTimer;
        }
        
        break;
    
    case 1:
        if (attackTime == 1)
        {
            switch (attackType)
            {
                case 0:
                    doneSearch = true;
                    bt_bullet(obj_lesserdog_search);
                    break;
                
                case 1:
                    bt_bullet(obj_lesserdog_leap, ((obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2) - 40, (obj_battlemanager.boxY2 - 8 - 20) + 6);
                    break;
                
                case 2:
                    bt_bullet(obj_lesserdog_down_telescope);
                    break;
                
                case 3:
                    bt_bullet(obj_lesserdog_side_telescope);
                    break;
            }
        }
        
        attackTime++;
        break;
    
    case 2:
        break;
}
