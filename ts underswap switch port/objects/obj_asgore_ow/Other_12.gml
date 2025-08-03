if (state == 1)
{
    alarm[5] = 1;
    exit;
}

state = 1;
image_index = 1;
path_start(pathToRun, (pathToRun == pth_asg_home_garden_3 || pathToRun == pth_asg_home_inside_2) ? 4 : 3, path_action_stop, true);
runningPath = pathToRun;
