if (sprite_index == s_cs_falltv)
{
    if (offsetsaved != offset)
    {
        alarm[0] = offset;
        offsetsaved = offset;
    }
    
    y += vsp;
    
    if (y >= ystart)
    {
        image_speed = 1;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = sprsaved;
            image_index = 0;
        }
    }
    
    return 0;
}
