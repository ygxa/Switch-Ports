obj_mettalot.y += 3;
obj_player.y += 0.5;

if (obj_mettalot.y < 630)
{
    alarm[10] = 1;
}
else
{
    obj_player.dummyOverride = false;
    scene_resume();
    music_lcplay("ruinedcity", true);
    instance_destroy();
}
