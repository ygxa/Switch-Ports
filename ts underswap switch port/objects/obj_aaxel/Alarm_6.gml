if (obj_player.y > (obj_player.ystart - 36))
{
    if (abs(obj_player.x - 96) > 3)
        obj_player.x += (obj_player.x < 96) ? 1 : -1;
    
    obj_player.y -= 2;
    alarm[6] = 1;
}
else
{
    obj_player.image_index = 0;
    obj_player.dummyOverride = false;
    scene_resume();
}
