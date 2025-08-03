event_inherited();

if (!chasing && revealed)
{
    y = number_approach_smooth(y, ystart - 10, 0.2, 0.5);
    fade = number_approach_smooth(fade, 1, 0.15, 0.01);
    bounceAmount = number_approach_smooth(bounceAmount, 1, 0.05, 0.01);
    siner += 0.16666666666666666;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
    
    siner2 += 0.1111111111111111;
    
    if (siner2 >= (2 * pi))
        siner2 -= (2 * pi);
}
