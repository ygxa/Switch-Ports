if (bulletType == (0 << 0))
{
    bulletType = (1 << 0);
    image_blend = #14A9FF;
    alarm[0] = which;
    which += 10;
    
    if (obj_lesserdog_monster.attackSpeed != 0)
        alarm[0] -= 5;
    
    go = true;
}
else
{
    bulletType = (0 << 0);
    image_blend = c_white;
    alarm[0] = 15;
    
    if (obj_lesserdog_monster.attackSpeed != 0)
        alarm[0] -= 5;
    
    go = false;
}
