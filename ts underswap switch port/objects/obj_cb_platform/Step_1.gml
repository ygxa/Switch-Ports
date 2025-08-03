if (!currentlyColliding && attach)
{
    attach = false;
    
    with (obj_battleheart)
    {
        if (jumpState == 1)
        {
            jumpState = 2;
            soulGrav = 0;
        }
    }
}

if (hover)
{
    hoverSiner += 0.1;
    y = ystart + (sin(hoverSiner) * 2);
}
