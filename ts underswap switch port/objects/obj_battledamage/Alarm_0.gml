if (cosmetic)
{
    instance_destroy();
    exit;
}

with (obj_battlemanager)
{
    if (!other.isMiss && mainState == (2 << 0) && subState == 1)
    {
        var mon = monsters[chosenMonster];
        mon.hp = other.monsterHpTarget;
        
        if (other.monsterHpTarget == 0)
        {
            if (mon.invincible)
            {
                global.bev_subtype = 1;
                
                with (mon)
                    event_user(4);
            }
            else
            {
                global.playerkills++;
                global.bev_subtype = 0;
                ds_map_set_post(global.flags, "last_killed", ds_map_find_value(global.flags, "last_killed") + 1);
                
                with (mon)
                {
                    isActive = false;
                    event_user(0);
                }
                
                totalXpReward += mon.xpReward;
                totalGoldReward += mon.goldReward;
                
                with (obj_battlemanager)
                    isGeneralEnemy = false;
            }
        }
        
        if (other.progressBattle)
        {
            with (obj_battletarget)
                doFade = true;
            
            checkForWin();
            
            if (isAnyMonsterLeft)
                beginAttackMode();
        }
    }
    else if (other.progressMiss)
    {
        with (obj_battletarget)
            doFade = true;
        
        checkForWin();
        
        if (isAnyMonsterLeft)
            beginAttackMode();
    }
}

instance_destroy();
