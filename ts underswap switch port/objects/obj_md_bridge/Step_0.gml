if (revealed && !freeze)
{
    y = number_approach_smooth(y, targetY, 0.2, 0.5);
    shadowFade = number_approach_smooth(shadowFade, 1, 0.15, 0.01);
    bounceAmount = number_approach_smooth(bounceAmount, 1, 0.05, 0.01);
    siner += 0.16666666666666666;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
}
