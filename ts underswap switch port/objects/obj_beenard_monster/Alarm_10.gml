x = xstart + shakeValue;
shakeValue = -(shakeValue - sign(shakeValue));

if (shakeValue != 0)
{
    alarm[10] = shakeSpeed;
}
else
{
    x = xstart;
    
    if (!instance_exists(obj_battledamage) || obj_battledamage.monsterHpTarget != 0)
        sprite_index = normalSprite;
}
