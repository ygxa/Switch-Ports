if (state == 0)
{
    if (x > 251)
    {
        music_kill_current();
        x = 251;
        hspeed = 0;
        state = 1;
        scene_resume();
    }
}
else if (state == 2)
{
    if (x < -138)
    {
        hspeed = 0;
        state = 1;
    }
}

if (pose == spr_asgb_think)
    image_speed = 0.05;
else if (talking && instance_exists(obj_speechbubble) && instance_exists(obj_speechbubble.writer) && !obj_speechbubble.writer.isDone)
    image_speed = 0.2;
else if (floor(image_index) == 0)
    image_speed = 0;
