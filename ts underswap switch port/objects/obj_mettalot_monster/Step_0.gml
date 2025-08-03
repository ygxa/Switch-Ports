if (!spared && !died)
    handSiner++;
else if (died)
    handSiner += 0.5;

if (visible && !spared)
{
    shineFrame += 0.05;
    
    if (shineFrame >= 2)
        shineFrame -= 2;
    
    if (path_index == -1)
    {
        x = number_approach_smooth(x, initX, 0.5, 0.5);
        y = number_approach_smooth(y, initY, 0.5, 0.5);
        bodySiner += 0.1;
        
        if (bodySiner >= (2 * pi))
            bodySiner -= (2 * pi);
        
        if (!spared && bobbing)
            verticalOffset = sin(bodySiner) * 6;
    }
    else
    {
        bodySiner = 0;
        verticalOffset = number_approach_smooth(verticalOffset, 0, 0.5, 0.5);
    }
}
else
{
    bodySiner = 0;
    verticalOffset = 0;
    shineFrame = 0;
}

if (attackType == 0)
    attackFade = number_approach_linear(attackFade, 0.5, 0.05);
else
    attackFade = number_approach_linear(attackFade, 1, 0.1);

if (fading)
{
    obj_battlemanager.mainState = (0 << 0);
    obj_battleheart.canMove = false;
    image_alpha -= 0.01;
    leftHand.image_alpha = image_alpha;
    rightHand.image_alpha = image_alpha;
    
    if (image_alpha <= 0)
    {
        fading = false;
        alarm[1] = 60;
    }
}

if (leaning)
    leftHand.image_angle = -5 + (dsin(15 * handSiner) * 5.5);

if (!pose && !resetHands)
{
    leftHand.x = x + leftHand.offsetX + (5 * sin(0.15 * handSiner));
    leftHand.y = y + leftHand.offsetY + (10 * sin(0.25 * handSiner));
    rightHand.x = (x + rightHand.offsetX) - (5 * sin(0.15 * handSiner));
    rightHand.y = y + rightHand.offsetY + (10 * sin(0.25 * handSiner));
    rightHand.image_angle = 0;
    
    if (waving)
        leftHand.image_angle = -5 + (dsin(15 * handSiner) * 17.5);
    else
        leftHand.image_angle = 0;
}
else
{
    leftHand.x = number_approach_smooth(leftHand.x, leftHand.destX, handSpeed, 0.02);
    leftHand.y = number_approach_smooth(leftHand.y, leftHand.destY, handSpeed, 0.02);
    rightHand.x = number_approach_smooth(rightHand.x, rightHand.destX, handSpeed, 0.02);
    rightHand.y = number_approach_smooth(rightHand.y, rightHand.destY, handSpeed, 0.02);
    
    if (point_distance(leftHand.x, leftHand.y, leftHand.destX, leftHand.destY) < 3 && point_distance(rightHand.x, rightHand.y, rightHand.destX, rightHand.destY) < 3 && resetHands)
        resetHands = false;
}
