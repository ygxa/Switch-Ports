siner += 0.16666666666666666;

if (siner >= (2 * pi))
    siner -= (2 * pi);

if (state == 0)
{
    if (!didMusic && internalEnd)
    {
        music_lcplay("dummyencounter", true);
        scene_resume();
        didMusic = true;
    }
}
else if (state == 1)
{
    if (y < 340)
    {
        y += 4;
    }
    else
    {
        y = 340;
        state = 0;
    }
}
else if (state == 2)
{
    if (path_position == 1)
    {
        music_kill_current();
        music_lcplay("ruined", true);
        obj_asgore_ow.lookDirection = 2;
        obj_player.lookDirection = 3;
        scene_resume();
        instance_destroy();
    }
    else if (path_position >= 0.5)
    {
        obj_asgore_ow.lookDirection = 3;
        obj_player.lookDirection = 3;
    }
}
