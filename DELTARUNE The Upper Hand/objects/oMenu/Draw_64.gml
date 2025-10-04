res_i();

repeat (array_length(menu[page][2]))
{
    print(menu[page][2][i], menu[page][0][0], menu[page][0][1] + (i * 30), undefined, undefined, menu[page][1]);
    i++;
}

if (holdZ == 0)
{
    if (!array_contains(menu[page][1], "arrows" + string(cur)))
    {
        ext(sSymb, 7, round(curPos[0]), round(curPos[1]), 2, 2, undefined, 255);
    }
    else
    {
        gpu_set_blendmode(bm_add);
        ext(sSymb, 7, round(curPos[0]), round(curPos[1]), 2, 2, undefined, 255, 0.5);
        gpu_set_blendmode(bm_normal);
    }
    
    if (array_contains(menu[page][1], "arrows" + string(cur)))
    {
        ext(sSymb, 8, round(curPos[0] - 9 - 2 - sin(op.ti / 15)), round(curPos[1] + 1), -1, 1);
        ext(sSymb, 8, round(curPos[0] + 9 + sin(op.ti / 15)), round(curPos[1] + 1), 1, 1);
    }
}

if ((page == 0 && cur == 2) && !op.challengeMode)
{
    if (credits > 0)
    {
        ext(sSymb, 8, 2 + round(320 - (sin(op.ti / 15) * 2)), 307, -2, 2, undefined, 0);
        ext(sSymb, 8, round(320 - (sin(op.ti / 15) * 2)), 305, -2, 2);
    }
    
    if (credits < 4)
    {
        ext(sSymb, 8, 2 + round(560 + (sin(op.ti / 15) * 2)), 307, 2, 2, undefined, 0);
        ext(sSymb, 8, round(560 + (sin(op.ti / 15) * 2)), 305, 2, 2);
    }
}

if (page == 0 && !(page == 0 && cur == 2))
    trophyAlpha += 0.1;
else
    trophyAlpha -= 0.1;

trophyAlpha = clamp(trophyAlpha, 0, 1);
res_i();
i1 = -1;
i2 = [];

if (array_contains(op.save, "win1") && array_contains(op.save, "win2"))
{
    i1++;
    array_push(i2, 0);
}

if (array_contains(op.save, "winNoHit"))
{
    i1++;
    array_push(i2, 1);
}

if (array_contains(op.save, "challengeMode"))
{
    i1++;
    array_push(i2, 2);
}

repeat (array_length(i2))
{
    ext(sTrophy, i2[i], 137 + (-i1 * 40) + (i * 80), 413 + (dsin((op.ty * 3) + (i * 180)) * 5), 0.5, 0.5, 0, 0, trophyAlpha * 0.25);
    ext(sTrophy, i2[i], 134 + (-i1 * 40) + (i * 80), 410 + (dsin((op.ty * 3) + (i * 180)) * 5), 0.5, 0.5, 0, 16777215, trophyAlpha);
    
    if (!((op.ty + (i * 5)) % 10) && trophyAlpha == 1)
        spawnEEF(134 + (-i1 * 40) + (i * 80), 410 + (dsin((op.ty * 3) + (i * 180)) * 5), sEEF_star2, 0, "ending_star,drawN");
    
    i++;
}

gpu_set_blendmode(bm_subtract);
ext(sPixel, 0, 0, 0, 640, 480, undefined, rgb(255 - frontC, 255 - frontC, 255 - frontC));
gpu_set_blendmode(bm_normal);

if (lightBright > 0)
    lightBright -= 0.016666666666666666;

gpu_set_blendmode(bm_add);
ext(sPixel, 0, 0, 0, 640, 480, undefined, 16777215, lightBright);
gpu_set_blendmode(bm_normal);
