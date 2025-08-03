monsterHpApparent = monsterHp;

if (isHeal)
{
    monsterHpTarget = clamp(monsterHp + damageNum, 0, 600);
    
    if (monsterHpApparent == monsterHpTarget)
        monsterHpApparent--;
}
else
{
    monsterHpTarget = clamp(monsterHp - damageNum, 0, monsterHp);
    
    if (monsterHpApparent == monsterHpTarget)
        monsterHpApparent++;
}

damageSpeed = min(monsterHpMax / 6, damageNum / 30);
vspeed = -4;
gravity = 0.5;
gravity_direction = 270;
y -= 32;
var dmg = floor(damageNum);
damageLength = 0;

do
{
    damageIndices[damageLength++] = dmg % 10;
    dmg = floor(dmg / 10);
}
until (dmg <= 0);

damageLeftSub = damageLength * 16;
