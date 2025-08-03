if (obj_overworldui.state == (1 << 0) && obj_overworldui.currentCharacter == "aaxel")
{
    if (sprite_index != spr_aaxel_bugerpant)
    {
        if (jacket)
        {
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_aaxel_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_aaxel_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_aaxel_up;
                    break;
                
                case 3:
                    sprite_index = spr_aaxel_right_talk;
                    break;
            }
        }
        else
        {
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_aaxel_ns_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_aaxel_ns_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_aaxel_ns_up;
                    break;
                
                case 3:
                    sprite_index = spr_aaxel_ns_right_talk;
                    break;
            }
        }
        
        image_index = obj_overworldui.portraitIndex;
    }
    
    siner += 0.2;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
    
    drawY = y + (sin(siner) * 3);
}
else
{
    if (sprite_index != spr_aaxel_bugerpant)
    {
        if (image_speed == 0)
            image_index = 0;
        
        if (jacket)
        {
            spriteLeft = spr_aaxel_left;
            spriteUp = spr_aaxel_up;
            spriteRight = spr_aaxel_right;
            spriteDown = spr_aaxel_down;
        }
        else
        {
            spriteLeft = spr_aaxel_ns_left;
            spriteUp = spr_aaxel_ns_up;
            spriteRight = spr_aaxel_ns_right;
            spriteDown = spr_aaxel_ns_down;
        }
        
        event_user(15);
    }
    else if (image_speed == 1 && floor(image_index) == 5)
    {
        image_speed = 0;
        image_index = 5;
        alarm[3] = 15;
    }
    else if (image_speed == 0.5 && floor(image_index) == 9)
    {
        image_speed = 0;
        image_index = 9;
        alarm[4] = 80;
    }
    
    siner = 0;
    drawY = number_approach_smooth(drawY, y, 0.5, 0.05);
}
