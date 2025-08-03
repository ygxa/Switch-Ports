switch (global.bev_subtype)
{
    case 0:
        if (vchoosedid && vchoose == 1)
        {
            attackType = 9;
            bt_set_boxtype((0 << 0));
        }
        else if (isSpareable)
        {
            obj_battlemanager.attackTime = 0;
            obj_battlemanager.attackTimer = 0;
            attackType = -1;
            break;
        }
        
        if (attackType != 9)
        {
            if (predetermined < 2)
            {
                attackType = predetermined;
                predetermined++;
            }
            else
            {
                attackType = xirandom(1);
            }
        }
        
        vchoosedid = false;
        attackTime = 0;
        bulletsGenerated = false;
        
        if (attackType == 9)
            obj_battlemanager.attackTime = infinity;
        else
            obj_battlemanager.attackTime = 100;
        
        break;
    
    case 1:
        attackTime++;
        
        switch (attackType)
        {
            case 0:
                if (attackTime == 1)
                    obj_battlemanager.attackTime = 150;
                
                if (attackTime == 1 || (attackTime % 20) == 0)
                {
                    var side = choose(-1, 1);
                    var beeBul;
                    
                    if (side == 1)
                        beeBul = bt_bullet(obj_beenard_bee_bul, obj_battlemanager.boxX1, random_range(obj_battleheart.y + 60, obj_battleheart.y - 60));
                    else
                        beeBul = bt_bullet(obj_beenard_bee_bul, obj_battlemanager.boxX2 + sprite_width, random_range(obj_battleheart.y + 60, obj_battleheart.y - 60));
                    
                    beeBul.moveDir = side;
                }
                
                break;
            
            case 1:
                bt_set_boxtype((4 << 0));
                
                if (!bulletsGenerated)
                {
                    var targ = ystart + yhover;
                    y = number_approach_smooth(y, targ, 0.5, 0.5);
                    
                    if (y == targ && floor(wingIndex) == 0)
                    {
                        visible = false;
                        bulletsGenerated = true;
                        
                        repeat (4)
                            bt_bullet(obj_beenard_flower);
                        
                        repeat (2)
                            bt_bullet(obj_beenard_flower).state = -1;
                        
                        instance_create_xy(x, y, obj_beenard_shake);
                    }
                }
                
                break;
            
            case 9:
                if (!bulletsGenerated && !obj_battlemanager.isBoxMoving)
                {
                    isSpareable = true;
                    
                    with (instance_create_xy(obj_battlemanager.boxX1 + 30, obj_battlemanager.boxY1 + 30, obj_beenard_name_bul))
                    {
                        text = dxd_raw("battles.beenard.name1");
                        nameIdx = 0;
                    }
                    
                    with (instance_create_xy(obj_battlemanager.boxX1 + 30, obj_battlemanager.boxY2 - 54, obj_beenard_name_bul))
                    {
                        text = dxd_raw("battles.beenard.name2");
                        nameIdx = 1;
                    }
                    
                    with (instance_create_xy(obj_battlemanager.boxX2 - 30, obj_battlemanager.boxY1 + 30, obj_beenard_name_bul))
                    {
                        alignment = 2;
                        text = dxd_raw("battles.beenard.name3");
                        nameIdx = 2;
                    }
                    
                    with (instance_create_xy(obj_battlemanager.boxX2 - 30, obj_battlemanager.boxY2 - 54, obj_beenard_name_bul))
                    {
                        alignment = 2;
                        text = dxd_raw("battles.beenard.name4");
                        nameIdx = 3;
                    }
                    
                    bulletsGenerated = true;
                }
                
                break;
        }
        
        break;
    
    case 2:
        if (attackType != 9)
        {
            bulletsGenerated = false;
            attackType = -1;
        }
        
        break;
}
