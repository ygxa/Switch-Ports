if (obj_player.state != 66 && obj_player.state != 67 && obj_player.state != 98)
{
    instance_destroy();
    
    if (instance_exists(obj_watertop))
        obj_watertop.created = 0;
    
    if (instance_exists(obj_minecartRail))
        obj_minecartRail.created = 0;
}
