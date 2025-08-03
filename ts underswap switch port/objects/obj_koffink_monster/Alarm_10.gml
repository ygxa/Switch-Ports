x = xstart + shakeValue;
shakeValue = -(shakeValue - sign(shakeValue));

if (shakeValue != 0)
{
    alarm[10] = shakeSpeed;
}
else
{
    x = xstart;
    
    if (hurtSprite != -1)
    {
        if (instance_exists(obj_battledamage))
        {
            if (obj_battledamage.monsterHpTarget != 0)
                alarm[10] = 1;
        }
        else
        {
            if (!shakeForDiannex)
                sprite_index = normalSprite;
            
            shakeForDiannex = false;
        }
    }
}
