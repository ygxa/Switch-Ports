switch (global.bev_subtype)
{
    case 2:
        alarm[2] = 10;
        finishedHurt = false;
        
        if (origX != -1)
        {
            x = mainPosX;
            y = mainPosY;
        }
        
        vspecific = 110 + xirandom(2);
        
        with (obj_dogamy_monster)
            vspecific = other.vspecific;
        
        break;
    
    case 0:
        global.areapopulations[global.currentarea]--;
        goldReward += 5;
        
        with (obj_dogamy_monster)
        {
            isSpareable = false;
            defense = -30;
            attack -= 3;
        }
        
        break;
    
    case 1:
        if (origX != -1)
        {
            x = mainPosX;
            y = mainPosY;
            instance_destroy(obj_dogisplash_notabullet);
        }
        
        break;
}

event_inherited();
