if (sprite_index == spr_temdark_b_talk)
{
    if (obj_overworldui.currentCharacter == myID)
        image_index = obj_overworldui.portraitIndex;
    else
        image_index = 0;
}
else if (myID != "temd5" && !stopAnim && (dropForce || obj_overworldui.currentCharacter == myID))
{
    stopAnim = true;
    targetX = dropTargetX;
    targetY = dropTargetY;
    sprite_index = dropSprite;
    image_speed = dropForce ? 3 : 1;
    image_index = 0;
    dropForce = false;
}
else if (stopAnimRev && image_speed != 0 && image_index < 1)
{
    image_speed = 0;
    image_index = 0;
}
else if (stopAnim && image_speed != 0 && floor(image_index) >= (image_number - 1))
{
    image_speed = 0;
    image_index = image_number - 1;
}
else if (firstStopAnim && image_speed != 0 && floor(image_index) >= (image_number - 1))
{
    image_speed = 0;
    image_index = image_number - 1;
    firstStopAnim = false;
}

if (targetX != 0 && (x != targetX || y != targetY))
{
    x = number_approach_smooth(x, targetX, 0.1, 0.5);
    y = number_approach_smooth(y, targetY, 0.1, 0.5);
}
