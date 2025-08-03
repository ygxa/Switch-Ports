if (vspeed == 0 && bobbing)
{
    bodySiner += (1/30);
    
    if (bodySiner >= (2 * pi))
        bodySiner -= (2 * pi);
    
    y = floor(yOrigin + (sin(bodySiner) * 9));
}
