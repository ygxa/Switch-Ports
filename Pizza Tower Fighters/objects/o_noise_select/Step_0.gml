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

if (selected == true && sprite == 1)
    sprite = 2;

switch (sprite)
{
    case 1:
        sprite_index = s_cs_noise;
        break;
    
    case 2:
        sprite_index = s_cs_notfound;
        
        if (floor(image_index) == (image_number - 1) && selected == true)
            sprite = 3;
        
        if (floor(image_index) == (image_number - 1) && selected == false)
            sprite = 1;
        
        break;
    
    case 3:
        sprite_index = s_cs_noise_sel;
        break;
}

if (global.player1 != "NO" && global.player2 != "NO" && sprite == 3)
{
    selected = false;
    sprite = 2;
}
