if (step < 26)
{
    larBlend = merge_color(origLarBlend, c_white, larBlender);
    harBlend = merge_color(origHarBlend, c_white, harBlender);
    larBlender = number_approach_linear(larBlender, 1, 0.1);
    harBlender = number_approach_linear(harBlender, 1, 0.1);
    x = number_approach_smooth(x, obj_larry_monster.x + 20, 0.05, 0.005);
    var shakeInt = round(step / 20);
    
    if ((step % 2) == 0)
        armX = armXStart + shakeInt;
    else
        armX = armXStart - shakeInt;
}
else if (step == 26)
{
    preShakeX = x;
    preShakeY = y;
}
else if (step >= 30 && step < 36)
{
    x = preShakeX + (preShakeAmt * fakeRandom[step % 5]);
    y = preShakeY + (preShakeAmt * fakeRandom[(step + 1) % 5]);
    
    if (preShakeAmt < 3)
        preShakeAmt++;
}
else if (step == 36)
{
    x = preShakeX;
    y = preShakeY;
    armX = -8;
    armY = 56;
    drawState = 1;
    bt_bullet(obj_harry_chomp_bul, 0, 0, obj_harry_monster);
    view_shake(2, 2);
    sfx_play(snd_throw);
    sfx_play(snd_grab);
}
else if (step > 36)
{
    x = preShakeX + (sin(step / 10) * 2);
}

if (obj_battlemanager.attackTimer <= 15 && obj_battlemanager.attackTimer > 5)
{
    larBlender = number_approach_linear(larBlender, 0, 0.15);
    larBlend = merge_color(origLarBlend, c_white, larBlender);
    x += 1;
}
else if (obj_battlemanager.attackTimer == 5)
{
    with (obj_larry_monster)
    {
        image_alpha = 1;
        visible = true;
    }
    
    visible = false;
}

step++;
