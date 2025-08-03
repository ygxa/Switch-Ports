event_inherited();

if (global.bev_subtype == 2)
{
    alarm[2] = 6;
    
    if (instance_exists(obj_battledamage))
    {
        obj_battledamage.minHpDisplay = 4;
        
        if (!isRuth && obj_battledamage.monsterHpTarget <= 0)
            forceDrawSelf = true;
        
        if (isRuth)
            mercyThresholdHit = obj_battledamage.monsterHpTarget <= (maxHp * 0.2);
    }
}
