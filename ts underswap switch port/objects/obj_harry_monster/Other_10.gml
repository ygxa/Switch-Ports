if (global.bev_subtype == 2 && vpushed)
    offsetDmgY += 30;

event_inherited();

if (global.bev_subtype == 2)
{
    if (vpushed)
    {
        sprite_index = spr_harry_react_push2;
        image_speed = 0;
        image_index = 1;
    }
    
    alarm[2] = 6;
    
    if (instance_exists(obj_battledamage))
    {
        if (!vpushed)
            obj_battledamage.minHpDisplay = 4;
        
        if (!isRuth && obj_battledamage.monsterHpTarget <= 0)
        {
            forceDrawSelf = true;
            shake = true;
        }
        
        if (isRuth)
            mercyThresholdHit = obj_battledamage.monsterHpTarget <= (maxHp * 0.2);
    }
}
else if (isRuth && global.bev_subtype == 0)
{
    journal_set_health(28, (2 << 0));
}
