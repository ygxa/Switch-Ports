function ScrCPU_FindNearestPoint()
{
    switch (global.player1)
    {
        case "PS":
            if (instance_exists(o_player_default))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_default.x, o_player_default.y, layer, o_cpu_findme))
                                follow = o_player_default;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
        
        case "NO":
            if (instance_exists(o_player_noise))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_noise.x, o_player_noise.y, layer, o_cpu_findme))
                                follow = o_player_noise;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
        
        case "TV":
            if (instance_exists(o_player_vigilante))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_vigilante.x, o_player_vigilante.y, layer, o_cpu_findme))
                                follow = o_player_vigilante;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
        
        case "FP":
            if (instance_exists(o_player_fakepep))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_fakepep.x, o_player_fakepep.y, layer, o_cpu_findme))
                                follow = o_player_fakepep;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
        
        case "DO":
            if (instance_exists(o_player_doise))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_doise.x, o_player_doise.y, layer, o_cpu_findme))
                                follow = o_player_doise;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
        
        case "sheen":
            if (instance_exists(o_player_sheen))
            {
                with (other)
                {
                    if (place_meeting(x, y + 1, o_parentwall))
                    {
                        if (!instance_exists(o_cpu_findme))
                        {
                            with (instance_create_layer(o_player_sheen.x, o_player_sheen.y, layer, o_cpu_findme))
                                follow = o_player_sheen;
                        }
                    }
                }
            }
            else
            {
                follow = -4;
            }
            
            break;
    }
}
