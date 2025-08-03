pose = true;
path_end();
var i = 0;

repeat (2)
{
    var star = instance_create_xy((x - 36) + (i * 14), (y - 36) + (i * 14), obj_mettwink_star);
    star.image_index = i;
    i++;
}

rightHand.image_angle = 0;
rightHand.destX = rightHand.initX;
rightHand.destY = rightHand.initY;
rightHand.sprite_index = spr_mett_hand_peacer;
leftHand.image_angle = 0;
leftHand.destX = leftHand.initX;
leftHand.destY = leftHand.initY;
leftHand.sprite_index = spr_mett_hand_peacel;
