if (solidObject != -4)
{
    if (length >= 4)
    {
        solidObject.x = -100;
        solidObject.y = -100;
    }
    else
    {
        solidObject.x = x;
        solidObject.y = y - (20 * length);
    }
}
