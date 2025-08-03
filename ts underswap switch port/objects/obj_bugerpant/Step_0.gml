if (dummyOverride)
    exit;

if (sprite_index == spr_bugerpant_jump)
    exit;

if (obj_overworldui.state == (1 << 0) && obj_overworldui.currentCharacter == "bug")
{
    switch (mode)
    {
        case 0:
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_bugerpant_s_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_bugerpant_s_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_bugerpant_up_talk;
                    break;
                
                case 3:
                    sprite_index = spr_bugerpant_s_right_talk;
                    break;
            }
            
            break;
        
        case 1:
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_bugerpant_w_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_bugerpant_w_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_bugerpant_up_talk;
                    break;
                
                case 3:
                    sprite_index = spr_bugerpant_w_right_talk;
                    break;
            }
            
            break;
        
        case 2:
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_bugerpant_h_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_bugerpant_h_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_bugerpant_up_talk;
                    break;
                
                case 3:
                    sprite_index = spr_bugerpant_h_right_talk;
                    break;
            }
            
            break;
        
        case 3:
            switch (lookDirection)
            {
                case 1:
                    sprite_index = spr_bugerpant_n_down_talk;
                    break;
                
                case 2:
                    sprite_index = spr_bugerpant_n_left_talk;
                    break;
                
                case 0:
                    sprite_index = spr_bugerpant_up_talk;
                    break;
                
                case 3:
                    sprite_index = spr_bugerpant_n_right_talk;
                    break;
            }
            
            break;
    }
    
    image_index = obj_overworldui.portraitIndex;
}
else
{
    if (sprite_index == spr_bugerpant_ground)
    {
        if (floor(image_index) >= 1)
        {
            image_index = 1;
            image_speed = 0;
        }
        
        exit;
    }
    
    if (image_speed == 0)
        image_index = 0;
    
    if (room == rm_ruinc_grillbys)
    {
        if (obj_ruinc_grillbys.musicStopped)
        {
            lookDirection = 2;
            mode = 2;
        }
        else
        {
            lookDirection = 1;
            mode = 0;
        }
    }
    
    switch (mode)
    {
        case 0:
            spriteLeft = spr_bugerpant_s_left;
            spriteDown = spr_bugerpant_s_down;
            spriteRight = spr_bugerpant_s_right;
            break;
        
        case 1:
            spriteLeft = spr_bugerpant_w_left_talk;
            spriteDown = spr_bugerpant_w_down_talk;
            spriteRight = spr_bugerpant_w_right_talk;
            break;
        
        case 2:
            spriteLeft = spr_bugerpant_h_left;
            spriteDown = spr_bugerpant_h_down;
            spriteRight = spr_bugerpant_h_right;
            break;
    }
    
    event_user(15);
}
