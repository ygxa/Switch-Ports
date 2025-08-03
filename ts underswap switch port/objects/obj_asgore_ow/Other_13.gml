if (state != 2)
{
    alarm[3] = 1;
    global.canmove = false;
    exit;
}

switch (type)
{
    case 1:
        state = 0;
        ds_map_set(global.flags, "plot", 5);
        global.currentnpc = id;
        lookDirection = dir_opposite(obj_player.lookDirection);
        pathToRun = pth_asg_ruin_entrance2;
        dx_scene("asg.ruined1_2");
        break;
    
    case 4:
        state = 0;
        global.currentnpc = id;
        dx_scene("asg.ruined4_2");
        break;
}
