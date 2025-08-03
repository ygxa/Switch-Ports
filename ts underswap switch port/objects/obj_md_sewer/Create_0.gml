if (ds_map_find_value(global.flags, "plot") >= 25)
{
    instance_destroy();
    exit;
}

siner = 0;
targetX = -1;
targetY = -1;
moveStep = 0;
firstTime = true;
bridgeX = -1;
beganBridgeMove = false;
widerRange = false;
image_speed = 0.3;
depth = -2000;

if (room != rm_ruins3)
{
    active = true;
    
    with (obj_dodgemode_handler)
        cutscene = true;
}
else
{
    active = false;
}
