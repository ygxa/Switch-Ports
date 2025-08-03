if (!doonce)
{
    doonce = true;
    
    if (back)
        image_index = 8;
}

if (!back)
{
    image_index += image_spd;
    
    if (floor(image_index) >= 8)
        instance_destroy();
}
else
{
    image_index -= image_spd;
    
    if (image_index < 1)
        instance_destroy();
}
