if (!isMiss)
{
    slowFrame = !slowFrame;
    
    if (slowFrame)
    {
        if (isHeal)
        {
            if (monsterHpApparent < monsterHpTarget)
            {
                monsterHpApparent += damageSpeed;
                
                if (monsterHpApparent >= monsterHpTarget)
                {
                    alarm[0] = 15;
                    monsterHpApparent = monsterHpTarget;
                }
            }
        }
        else if (monsterHpApparent > monsterHpTarget)
        {
            monsterHpApparent -= damageSpeed;
            
            if (monsterHpApparent <= monsterHpTarget)
            {
                alarm[0] = 15;
                monsterHpApparent = monsterHpTarget;
            }
        }
    }
}

if (bounce)
{
    if ((y + (vspeed + gravity)) > (ystart - 32))
    {
        vspeed = 0;
        gravity = 0;
        y = ystart - 32;
    }
}
