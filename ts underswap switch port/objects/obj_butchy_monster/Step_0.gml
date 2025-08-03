if (spared && x > -1000)
{
    attackStage = 1;
    x -= 14;
    
    if ((spareTimer++ % 2) == 1)
        instance_create_xy(x + 126, y + 80, obj_butchy_smoke);
}

if ((spared || attackType == 1) && attackStage != 0)
    siner += 0.8;
else
    siner += 0.15;

if (siner >= (2 * pi))
    siner -= (2 * pi);

if (attackType == 1 && attackStage == 0)
{
    horzSiner += 0.4;
    
    if (horzSiner >= (2 * pi))
        horzSiner -= (2 * pi);
}
else
{
    horzSiner = 0;
}
