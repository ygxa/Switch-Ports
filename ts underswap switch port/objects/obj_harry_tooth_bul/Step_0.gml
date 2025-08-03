if (parent != -4)
{
    if (image_index == 1)
        x = parent.boxLeft + sprite_xoffset + 8;
    else
        x = parent.boxRight - sprite_xoffset - 10;
}

if (obj_battlemanager.attackTimer < 15)
{
    if (image_alpha > 0)
        image_alpha -= 0.15;
    
    if (image_alpha < 0)
        image_alpha = 0;
}
