function pizzaface_death()
{
    if (sprite_index != s_pizzaface_defeated)
    {
        sprite_index = s_pizzaface_defeated;
        image_index = 0;
        image_speed = 1;
        inv = true;
        cputimer = 5;
        audio_play_sound(su_pizzaface_dying, 100, false);
        
        switch (global.player1)
        {
            case "PS":
                o_player_default.state = (30 << 0);
                break;
            
            case "NO":
                o_player_noise.state = (26 << 0);
                break;
            
            case "FP":
                o_player_fakepep.state = (26 << 0);
                break;
            
            case "TV":
                o_player_vigilante.state = (24 << 0);
                break;
            
            case "DO":
                o_player_doise.state = (30 << 0);
                break;
        }
        
        palette = 2;
        global.TOTALSCORE += 50;
        
        if (!instance_exists(fadeid))
            fadeid = instance_create_depth(0, 0, -1000000, o_secret_top);
        
        if (!instance_exists(fadeid))
            exit;
    }
    
    palette += 0.004;
    x = ObjGame.x;
    y = ObjGame.y;
    
    if (palette > 2.5)
    {
        if (cputimer == 0)
        {
            cputimer = 4;
            
            with (instance_create_layer(x, y, layer, o_cloudeffect_pf))
                hsp = irandom_range(-5, 5);
        }
        else
        {
            cputimer--;
        }
    }
    
    if (palette > 2.88)
    {
        if (hitstun == 0)
        {
            hitstun = 2;
            
            with (instance_create_layer(x + irandom_range(400, -400), y + irandom_range(300, -300), layer, o_player_vigi_explosion))
                playa = 1;
        }
        else
        {
            hitstun--;
        }
    }
    
    if (palette > 2.99 && !instance_exists(O_Fade))
    {
        audio_stop_sound(su_pizzaface_dying);
        fadeToRoom(R_Arcade_Finish, 30, 16777215);
        instance_destroy(o_arcade_score_system);
    }
}
