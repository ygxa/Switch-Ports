if (bodyIndex == 0)
{
    image_index = 1;
    legFrame = 0;
    siner = 0;
}
else
{
    image_index = 0;
    legFrame = bodyIndex % 2;
    siner = bodyIndex * 0.5;
    depth += bodyIndex;
}

alarm[0] = 5;
