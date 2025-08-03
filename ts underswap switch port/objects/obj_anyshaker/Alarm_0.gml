if (!instance_exists(object))
{
    instance_destroy();
    exit;
}

with (object)
{
    if (is_undefined(other.startX))
    {
        other.startX = x;
        other.startY = y;
    }
    
    x = other.startX + (other.shakeValue * other.signX);
    y = other.startY + (other.shakeValue * other.signY);
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
    with (object)
    {
        x = other.startX;
        y = other.startY;
    }
    
    instance_destroy();
}
