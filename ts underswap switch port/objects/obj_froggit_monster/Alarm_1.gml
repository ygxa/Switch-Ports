if (instance_exists(tongueTargetObj))
{
    tongueAnim = 1;
    tongue = bt_bullet(obj_frogb_tongue, x + 52, y + 56);
    tongue.image_yscale = 0.025;
    tongue.image_angle = point_direction(tongue.x, tongue.y, tongueTargetObj.x, tongueTargetObj.y) + 90;
    tongue.parent = id;
}
