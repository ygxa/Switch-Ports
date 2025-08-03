if (obj_battlemanager.boxY1 <= 200)
{
    pose = true;
    leaning = true;
    bobbing = false;
    sprite_index = spr_mett_body_lean;
    path_end();
    image_index = 1;
    rightHand.image_angle = 0;
    rightHand.destX = initX - 16;
    rightHand.destY = initY + 38;
    rightHand.sprite_index = spr_mett_hand_groundr;
    leftHand.image_angle = 0;
    leftHand.destX = initX + 44;
    leftHand.destY = initY + 32;
    leftHand.sprite_index = spr_mett_hand_clench_lean;
    leftHand.depth = depth + 1;
}
else if (obj_battlemanager.boxY1 <= 240)
{
    leaning = true;
    sprite_index = spr_mett_body_lean;
    image_index = 0;
    alarm[2] = 1;
}
else
{
    alarm[2] = 1;
}
