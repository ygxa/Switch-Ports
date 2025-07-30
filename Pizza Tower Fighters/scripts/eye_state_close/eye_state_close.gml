function eye_state_close()
{
    if (sprite_index != s_secreteye_close)
    {
        sprite_index = s_secreteye_close;
        image_index = 0;
        audio_play_sound(su_eye_close, 50, false);
        audio_stop_sound(su_fakepep_bodyslam);
        audio_stop_sound(su_vigi_smg);
        audio_stop_sound(su_noise_tornado);
        instance_destroy(par_projectile);
    }
    
    if (ate == 1)
    {
        O_Player_1.x = x;
        O_Player_1.y = y;
        O_Player_1.inv = true;
    }
    else if (ate == 2)
    {
        O_Player_2.x = x;
        O_Player_2.y = y;
    }
    
    if (floor(image_index) >= 6 && !captured)
        image_index = 6;
    
    if (floor(image_index) == (image_number - 1))
    {
        image_speed = 0;
        
        if (!instance_exists(fadeid))
            fadeid = instance_create_depth(0, 0, -1000000, o_secretfade);
        
        while (fadeid.fadein == 0 || !instance_exists(fadeid))
            exit;
        
        switch (currentlayout)
        {
            case 1:
                instance_deactivate_layer(layout1tile3);
                instance_deactivate_layer(layout1tile2);
                instance_deactivate_layer(layout1tile1);
                instance_deactivate_layer(layout1obj);
                layer_set_visible(layout1obj, false);
                layer_set_visible(layout1tile1, false);
                layer_set_visible(layout1tile2, false);
                layer_set_visible(layout1tile3, false);
                instance_activate_layer(layout2obj);
                layer_set_visible(layout2tile2, true);
                layer_set_visible(layout2tile1, true);
                layer_set_visible(layout2obj, true);
                currentlayout = 2;
                o_spawn.x = 941;
                o_spawn.y = 301;
                
                if (instance_exists(O_Player_1))
                {
                    O_Player_1.x = o_spawn.x;
                    O_Player_1.y = o_spawn.y;
                }
                
                if (instance_exists(O_Player_2))
                {
                    O_Player_2.x = o_spawn.x;
                    O_Player_2.y = o_spawn.y;
                }
                
                break;
            
            case 2:
                instance_deactivate_layer(layout2obj);
                layer_set_visible(layout2obj, false);
                layer_set_visible(layout2tile2, false);
                layer_set_visible(layout2tile1, false);
                layer_set_visible(layout3tile2, true);
                layer_set_visible(layout3tile1, true);
                instance_activate_layer(layout3obj);
                layer_set_visible(layout3obj, true);
                currentlayout = 3;
                o_spawn.x = 828;
                o_spawn.y = 221;
                
                if (instance_exists(O_Player_1))
                {
                    O_Player_1.x = o_spawn.x - 50;
                    O_Player_1.y = o_spawn.y;
                }
                
                if (instance_exists(O_Player_2))
                {
                    O_Player_2.x = o_spawn.x - 50;
                    O_Player_2.y = o_spawn.y;
                }
                
                break;
            
            case 3:
                instance_activate_layer(layout4obj);
                layer_set_visible(layout4obj, true);
                layer_set_visible(layout4tile3, true);
                layer_set_visible(layout4tile2, true);
                layer_set_visible(layout4tile1, true);
                instance_deactivate_layer(layout3obj);
                layer_set_visible(layout3tile2, false);
                layer_set_visible(layout3tile1, false);
                layer_set_visible(layout3obj, false);
                currentlayout = 4;
                o_spawn.x = 616;
                o_spawn.y = 638;
                
                if (instance_exists(O_Player_1))
                {
                    O_Player_1.x = o_spawn.x;
                    O_Player_1.y = o_spawn.y;
                }
                
                if (instance_exists(O_Player_2))
                {
                    O_Player_2.x = o_spawn.x;
                    O_Player_2.y = o_spawn.y;
                }
                
                break;
            
            case 4:
                instance_activate_layer(layout1tile3);
                instance_activate_layer(layout1tile2);
                instance_activate_layer(layout1tile1);
                instance_activate_layer(layout1obj);
                layer_set_visible(layout1obj, true);
                layer_set_visible(layout1tile1, true);
                layer_set_visible(layout1tile2, true);
                layer_set_visible(layout1tile3, true);
                instance_deactivate_layer(layout4obj);
                layer_set_visible(layout4obj, false);
                layer_set_visible(layout4tile3, false);
                layer_set_visible(layout4tile2, false);
                layer_set_visible(layout4tile1, false);
                currentlayout = 1;
                o_spawn.x = xstart;
                o_spawn.y = ystart;
                
                if (instance_exists(O_Player_1))
                {
                    O_Player_1.x = o_spawn.x;
                    O_Player_1.y = o_spawn.y;
                }
                
                if (instance_exists(O_Player_2))
                {
                    O_Player_2.x = o_spawn.x;
                    O_Player_2.y = o_spawn.y;
                }
                
                break;
        }
        
        x = o_spawn.x;
        y = o_spawn.y;
        image_speed = 1;
        state = (4 << 0);
        fadeid = -4;
        captured = false;
    }
}
