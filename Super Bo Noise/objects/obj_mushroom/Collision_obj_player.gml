if (other.cutscene == 0 && sprite_index != spr_null && other.state != 110 && other.state != 124 && other.state != 188)
{
    other.jumpstop = 1;
    
    with (other)
    {
        if (state == 107)
        {
            state = 94;
            
            if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
                xscale *= -1;
        }
        
        if (state == 2)
            state = 94;
        
        if (state == 39)
            state = 106;
    }
    
    sprite_index = spr_null;
    
    if (other.state == 94 || other.state == 2)
    {
        other.sprite_index = other.spr_machfreefall;
        other.image_index = 0;
    }
    
    image_index = 0;
    other.vsp = -14;
    other.jumpstop = 1;
    
    if (other.isgustavo)
    {
        other.sprite_index = spr_player_ratmountmushroombounce;
        
        if (!other.brick)
            other.sprite_index = spr_lonegustavo_jumpstart;
        
        other.jumpAnim = 1;
        other.state = 194;
        other.image_index = 0;
    }
}
