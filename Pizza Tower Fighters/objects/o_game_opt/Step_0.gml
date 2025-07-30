if (!goaway)
{
    if (!instance_exists(O_Fade))
        x = approach(x, xstart, 20);
    else
        x = approach(x, xstart2, 20);
}
else
{
    x = approach(x, xstart2, 20);
    
    if (x == xstart2 && !instance_exists(O_Fade))
        fadeToRoom(other.target, 10, 0);
}
