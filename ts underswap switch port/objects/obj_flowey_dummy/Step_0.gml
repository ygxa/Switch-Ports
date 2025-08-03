switch (sprite_index)
{
    case spr_flowey_rise:
        if (floor(image_index) >= 3)
        {
            sprite_index = spr_flowey_down;
            image_index = 0;
            image_speed = 0;
        }
        
        break;
    
    case spr_flowey_sink:
        if (floor(image_index) >= 4)
            instance_destroy();
        
        break;
    
    case spr_flowey_down:
    case spr_flowey_up:
    case spr_flowey_left:
    case spr_flowey_right:
        if (obj_overworldui.state == (1 << 0) && obj_overworldui.currentCharacter == "flow")
            image_index = obj_overworldui.portraitIndex;
        else
            image_index = 0;
        
        break;
}
