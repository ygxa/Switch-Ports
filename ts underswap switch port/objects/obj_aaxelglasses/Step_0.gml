if (image_index == 0 && (x > 640 || (x >= 320 && y < 0)))
{
    image_index = 1;
    speed = 0;
    gravity = 0;
    x = obj_aaxel_monster.x + 62;
    y = (obj_aaxel_monster.y + 38) - 50;
}
else if (image_index == 1)
{
    if (progress >= 1)
    {
        image_alpha -= 0.05;
        
        if (image_alpha <= 0)
            instance_destroy();
    }
    else
    {
        progress += 0.05;
        y = ((obj_aaxel_monster.y + 38) - 50) + (progress * 50);
    }
}
