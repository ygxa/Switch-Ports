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
        
        vspecific = 100 + xirandom(2);
        
        with (obj_dogaressa_monster)
            vspecific = other.vspecific;
        
        break;
    
    case 0:
        global.areapopulations[global.currentarea]--;
        journal_set_health(25, (2 << 0));
        goldReward += 5;
        
        with (obj_dogaressa_monster)
        {
            isSpareable = false;
            defense = -8;
            attack += 2;
        }
        
        break;
    
    case 1:
        journal_set_health(25, (1 << 0));
        
        if (origX != -1)
        {
            x = mainPosX;
            y = mainPosY;
            instance_destroy(obj_dogisplash_notabullet);
        }
        
        break;
}

event_inherited();
