if (!global.lowvfx)
{
    with (obj_gamemanager)
    {
        viewXOffset = other.shakeValue;
        viewYOffset = other.shakeValue;
    }
}

if (sign(shakeValue) == -1)
    shakeValue = -(shakeValue + 1);
else
    shakeValue = -shakeValue;

if (shakeValue != 0)
{
    alarm[0] = 2;
}
else
{
    with (obj_gamemanager)
    {
        viewXOffset = 0;
        viewYOffset = 0;
    }
}
