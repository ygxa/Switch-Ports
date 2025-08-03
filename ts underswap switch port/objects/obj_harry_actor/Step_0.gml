event_inherited();

if (fly)
{
    flySpeed = number_approach_smooth(flySpeed, 0.5, 0.05, 0.02);
    y -= flySpeed;
    
    if (amp < 2)
        amp += 0.02;
    
    siner += 0.3;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
}
