if (o_pizzascape_deathzone.activated != 0)
{
    switch (targeting)
    {
        case 1:
            if (instance_exists(O_Player_1))
                x = O_Player_1.x;
            
            break;
        
        case 2:
            if (instance_exists(O_Player_2))
                x = O_Player_2.x;
            
            break;
    }
    
    vsp += grv;
    player_col();
    
    if (blue_aftereffect <= 0)
    {
        blue_aftereffect = 6;
        
        with (instance_create_depth(x, y, layer, o_afterimage))
        {
            depth = other.depth + 1;
            image_xscale = other.image_xscale;
            image_blend = #F03030;
            sprite_index = other.sprite_index;
            image_alpha = 1.25;
            image_index = other.image_index - 1;
            full = 1;
        }
    }
    else
    {
        blue_aftereffect--;
    }
}
else
{
    y -= 5;
}
