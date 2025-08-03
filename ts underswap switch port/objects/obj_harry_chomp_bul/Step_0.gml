mouthSpace = number_approach_smooth(mouthSpace, destMouthSpace, mouthMoveSpeed, 0.005);
middleFrame += 0.1;

if (floor(middleFrame) >= 2)
    middleFrame -= 2;

boxTop = number_approach_smooth(boxTop, 292, 0.25, 0.005);
boxBottom = number_approach_smooth(boxBottom, 360, 0.25, 0.005);
boxLeft = boxLeftStart + (mouthSpaceStart - mouthSpace);
boxRight = boxRightStart - (mouthSpaceStart - mouthSpace);
bt_set_box_custom(boxLeft, boxTop, boxRight, boxBottom);
boxCenter = (boxLeft + boxRight) / 2;

if (step < 45)
{
    destMouthSpace = mouthSpaceStart + (xirandom(6) * xchoose(-1, 1));
}
else if (step == 45)
{
    sfx_play(snd_harhurt, 80, false);
}
else
{
    if (!playedSound)
    {
        sfx_play(snd_bang);
        view_shake(2, 2);
        playedSound = true;
    }
    
    destMouthSpace = -4;
    mouthMoveSpeed = 0.75;
}

if (obj_battlemanager.attackTimer < 15)
{
    if (image_alpha > 0)
        image_alpha -= 0.15;
    
    if (image_alpha < 0)
        image_alpha = 0;
}

step++;
