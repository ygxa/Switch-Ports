depth = -10;
isMiss = false;
damageNum = 0;
damageSpeed = 0;
damageIndices[0] = 0;
damageLength = 1;
damageLeftSub = 0;
monsterHp = 0;
monsterHpApparent = 0;
monsterHpTarget = 0;
monsterHpMax = 0;
width = 100;
progressBattle = true;
progressMiss = false;
minHpDisplay = 0;
isHeal = false;
prevWidth = width;
surface = -1;
slowFrame = false;
cosmetic = false;
bounce = false;

bounceUp = function()
{
    bounce = true;
    vspeed = -4;
    gravity = 0.5;
    gravity_direction = 270;
    y -= 32;
};

alarm[0] = 30;
