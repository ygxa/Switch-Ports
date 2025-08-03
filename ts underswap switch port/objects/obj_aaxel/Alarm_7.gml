if (y >= 460)
{
    scene_resume();
    instance_destroy(obj_moldrick);
    instance_destroy(obj_norman);
    obj_player.lookDirection = 0;
    instance_destroy();
    exit;
}

alarm[7] = 1;
