if (image_alpha < 1)
    image_alpha += 0.08;
else
    image_alpha = 1;

if (state == 0)
{
    image_angle = number_approach_smooth(image_angle, targetDirection, 0.25, 0.1);
    
    if (image_angle == targetDirection)
    {
        if (global.currentmusic != -4)
            music_gain(0, 1500);
        
        view_shake(2, 2);
        sfx_play(snd_throw);
        move_towards_point(640, 420, 16);
        state = 1;
    }
}
else if (state == 1)
{
    if (x > 658)
    {
        scene_resume();
        instance_destroy();
    }
}
