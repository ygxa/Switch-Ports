switch (sprite_index)
{
    case spr_flowey_down:
        sprite_index = spr_flowey_left;
        alarm[0] = 15;
        break;
    
    case spr_flowey_left:
        sprite_index = spr_flowey_right;
        alarm[0] = 15;
        break;
    
    case spr_flowey_right:
        sprite_index = spr_flowey_up;
        alarm[0] = 30;
        break;
    
    case spr_flowey_up:
        scene_resume();
        break;
}
