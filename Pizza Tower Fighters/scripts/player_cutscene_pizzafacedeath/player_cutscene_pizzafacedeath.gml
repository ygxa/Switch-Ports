function player_cutscene_pizzafacedeath()
{
    inv = true;
    
    if (distance_to_point(239, y) > 20)
    {
        x = 239;
        vsp += grv;
        hsp = lengthdir_x(8, direction);
        player_col();
        image_xscale = sign(hsp);
        
        switch (object_index)
        {
            case o_player_default:
                sprite_index = s_test_walk;
                break;
            
            case o_player_noise:
            case o_player_doise:
                sprite_index = s_noise_walk;
                break;
            
            case o_player_vigilante:
                sprite_index = s_vigilante_walk;
                break;
            
            case o_player_fakepep:
                sprite_index = s_fakepep_walk;
                break;
        }
    }
    else
    {
        vsp += grv;
        hsp = 0;
        player_col();
        
        switch (object_index)
        {
            case o_player_default:
                if (sprite_index != s_test_pizzaface_blowup)
                {
                    sprite_index = s_test_pizzaface_blowup;
                    image_index = 0;
                }
                
                break;
            
            case o_player_noise:
            case o_player_doise:
                if (sprite_index != s_noise_pizzaface_blowup)
                {
                    sprite_index = s_noise_pizzaface_blowup;
                    image_index = 0;
                }
                
                break;
            
            case o_player_vigilante:
                if (sprite_index != s_vigilante_pizzaface_blowup)
                {
                    sprite_index = s_vigilante_pizzaface_blowup;
                    image_index = 0;
                }
                
                break;
            
            case o_player_fakepep:
                if (sprite_index != s_fakepep_idle)
                {
                    sprite_index = s_fakepep_idle;
                    image_index = 0;
                }
                
                break;
        }
        
        image_xscale = 1;
        
        if (animation_end())
            image_index = 5;
    }
}
