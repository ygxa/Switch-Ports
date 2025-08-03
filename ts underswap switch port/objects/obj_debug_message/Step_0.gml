if (keyboard_check_pressed(vk_space))
{
    killTimer = -1;
    image_alpha = 1;
}
else if (killTimer == 0)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
else
{
    killTimer--;
}

if (keyboard_check_pressed(vk_escape))
    instance_destroy();
