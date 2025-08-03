switch (mode)
{
    case 0:
        switch (lookDirection)
        {
            case 1:
                sprite_index = spr_met_down;
                break;
            
            case 2:
                sprite_index = spr_met_left;
                break;
            
            case 0:
                sprite_index = spr_met_up;
                break;
            
            case 3:
                sprite_index = spr_met_right;
                break;
        }
        
        break;
    
    case 1:
        switch (lookDirection)
        {
            case 1:
                sprite_index = spr_met_down_closedeyes;
                break;
            
            case 0:
                sprite_index = spr_met_up;
                break;
        }
        
        break;
    
    case 2:
        sprite_index = spr_met_pose;
        image_index = pose;
        image_speed = 0;
        break;
    
    case 3:
        sprite_index = spr_met_clap;
        image_speed = 1;
        break;
    
    case 4:
        sprite_index = spr_met_whisper;
        image_speed = 0;
        break;
    
    case 5:
        sprite_index = spr_met_pose;
        image_index = pose;
        image_speed = 0;
        break;
}

if (mode <= 1 || mode == 4)
{
    image_speed = 0;
    
    if (obj_overworldui.state != (1 << 0) || obj_overworldui.currentCharacter != "met")
    {
        image_index = 0;
        event_user(15);
    }
    else
    {
        image_index = obj_overworldui.portraitIndex;
    }
    
    if (forceLookDirection != 4)
        lookDirection = forceLookDirection;
    
    lookDirectionLag = lookDirection;
    handIndexLag = handIndex;
}

modeLag = mode;
siner += 0.1;

if (siner >= (2 * pi))
    siner -= (2 * pi);

if (approachX != -1)
    x = number_approach_smooth(x, approachX, 0.5, 0.5);
