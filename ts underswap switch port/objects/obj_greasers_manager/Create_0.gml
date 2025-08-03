event_inherited();
first = true;
forceFlavor = undefined;
attackType = -1;
attackTime = 0;
attackDelay = 0;
attackDelay2 = 0;
attackStage = 0;
m = false;
a = false;
n = false;

function froggitAttack()
{
    if (attackTime >= attackDelay2)
    {
        var currTarg = obj_battleheart.x - 50;
        var targY = obj_battlemanager.boxY2 - 4;
        
        if (currTarg >= obj_battlemanager.boxX1)
            bt_bullet(obj_frogb_flyup, currTarg, targY, obj_norman_monster);
        
        currTarg = obj_battleheart.x + 50;
        
        if (currTarg <= obj_battlemanager.boxX2)
            bt_bullet(obj_frogb_flyup, currTarg, targY, obj_norman_monster);
        
        attackDelay2 = attackTime + 30 + irandom(6);
    }
}

function whimsunFlyUp()
{
    if (attackTime >= attackDelay)
    {
        var currTarg = obj_battleheart.x - 50;
        var targY = obj_battlemanager.boxY2 - 4;
        
        if (currTarg >= obj_battlemanager.boxX1)
            bt_bullet(obj_whimsunb_flyup, currTarg, targY, obj_norman_monster);
        
        currTarg = obj_battleheart.x + 50;
        
        if (currTarg <= obj_battlemanager.boxX2)
            bt_bullet(obj_whimsunb_flyup, currTarg, targY, obj_norman_monster);
        
        attackDelay = attackTime + 9 + irandom(3);
    }
}
