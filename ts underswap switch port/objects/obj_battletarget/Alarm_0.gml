selectorVisible = true;
selectorSpeed = 11 + xirandom(2);

if (xirandom(1) == 0)
{
    selectorDir = 3;
    selectorX = x - (sprite_width * 0.5) - 16;
}
else
{
    selectorDir = 2;
    selectorX = x + (sprite_width * 0.5) + 8;
}
