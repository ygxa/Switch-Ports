if (vfinal != -1)
    vfinaldid = true;

if (isSpareable)
{
    goldReward = 0;
    obj_battlemanager.totalGoldReward = 0;
    journal_set_health(0, (1 << 0));
}

with (obj_battlemanager)
{
    isAnyMonsterLeft = false;
    
    for (var i = 0; i < 3; i++)
    {
        var mon = monsters[i];
        
        if (mon != -4 && mon.isActive)
        {
            isAnyMonsterLeft = true;
            break;
        }
    }
    
    if (isAnyMonsterLeft)
    {
        beginAttackMode();
    }
    else
    {
        mainState = (3 << 0);
        drawableText = "";
        obj_battleheart.visible = false;
        battleTriggerEnd();
    }
}
