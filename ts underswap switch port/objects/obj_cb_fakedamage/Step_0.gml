if (isHeal)
{
    if (monsterHpApparent < monsterHpTarget)
    {
        monsterHpApparent += damageSpeed;
        
        if (monsterHpApparent >= monsterHpTarget)
            monsterHpApparent = monsterHpTarget;
    }
}
else if (monsterHpApparent > monsterHpTarget)
{
    monsterHpApparent -= damageSpeed;
    
    if (monsterHpApparent <= monsterHpTarget)
        monsterHpApparent = monsterHpTarget;
}

if ((y + (vspeed + gravity)) > (ystart - 32))
{
    vspeed = 0;
    gravity = 0;
    y = ystart - 32;
}
