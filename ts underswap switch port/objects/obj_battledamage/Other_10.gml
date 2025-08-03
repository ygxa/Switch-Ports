monsterHpApparent = monsterHp;

if (isHeal)
{
    monsterHpTarget = clamp(monsterHp + damageNum, 0, monsterHpMax);
    
    if (monsterHpApparent == monsterHpTarget)
        monsterHpApparent--;
}
else
{
    monsterHpTarget = clamp(monsterHp - damageNum, 0, monsterHp);
    
    if (monsterHpApparent == monsterHpTarget)
        monsterHpApparent++;
}

damageSpeed = min(monsterHpMax / 6, damageNum / 15);
bounceUp();
var dmg = floor(damageNum);
damageLength = 0;

do
{
    damageIndices[damageLength++] = dmg % 10;
    dmg = floor(dmg / 10);
}
until (dmg <= 0);

damageLeftSub = damageLength * 16;
alarm[0] = -1;
