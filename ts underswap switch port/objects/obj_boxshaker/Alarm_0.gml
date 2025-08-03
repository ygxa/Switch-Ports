if (!obj_battlemanager.boxTransform)
{
    instance_destroy();
    exit;
}

with (obj_battlemanager)
{
    boxTranslateX = other.shakeValue * other.signX;
    boxTranslateY = other.shakeValue * other.signY;
}

if (sign(shakeValue) == -1)
    shakeValue = -(shakeValue + 1);
else
    shakeValue = -shakeValue;

if (shakeValue >= 1 || shakeValue <= -1)
{
    alarm[0] = shakeSpeed;
}
else
{
    with (obj_battlemanager)
    {
        boxTranslateX = 0;
        boxTranslateY = 0;
    }
    
    instance_destroy();
}
