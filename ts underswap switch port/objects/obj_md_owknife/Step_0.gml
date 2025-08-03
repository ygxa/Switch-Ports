if (state == 0)
{
    image_angle = number_approach_smooth(image_angle, targetDir, 0.25, 0.5);
    
    if (y >= 180)
    {
        state = 1;
        speed = 0;
        gravity = 0.25;
        gravity_direction = 270;
        hspeed = 1.5;
        vspeed = -2;
        sfx_play(snd_click);
        alarm[1] = 30;
    }
}
else
{
    image_angle += 25;
    
    if (image_angle > 360)
        image_angle -= 360;
    
    if (done && y > 245)
        instance_destroy();
}
