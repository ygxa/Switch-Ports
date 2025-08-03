if (state == 2)
{
    timer++;
    image_yscale = image_yscale_orig + (yScaleFudge * (timer / timeToDie));
    
    if (timer >= timeToDie)
        setState(state + 1);
}

x = xstart + (max(1, obj_asgore_monster.attackIntensity) * 2.25 * sin(siner));
siner += 0.045;

if (siner >= (2 * pi))
    siner -= (2 * pi);
