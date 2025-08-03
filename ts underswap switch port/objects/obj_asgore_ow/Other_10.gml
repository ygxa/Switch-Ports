if (state == 0)
{
    switch (type)
    {
        case 2:
            dx_scene("asg.ruined2_int");
            break;
        
        case 3:
            if (ds_map_find_value(global.flags, "rh3_wrongswitch") != 0)
                dx_scene("asg.ruined3_int2");
            else if (ds_map_find_value(global.flags, "plot") >= 9)
                dx_scene("asg.ruined3_int3");
            else
                dx_scene("asg.ruined3_int");
            
            break;
        
        case 4:
            switch (ds_map_find_value(global.flags, "rh4_asgint"))
            {
                case 0:
                    ds_map_set_post(global.flags, "rh4_asgint", ds_map_find_value(global.flags, "rh4_asgint") + 1);
                    dx_scene("asg.ruined4_int");
                    break;
                
                case 1:
                    ds_map_set_post(global.flags, "rh4_asgint", ds_map_find_value(global.flags, "rh4_asgint") + 1);
                    dx_scene("asg.ruined4_int2");
                    break;
                
                case 2:
                    ds_map_set_post(global.flags, "rh4_asgint", ds_map_find_value(global.flags, "rh4_asgint") + 1);
                    dx_scene("asg.ruined4_int3");
                    break;
                
                default:
                    dx_scene("asg.ruined4_int4");
                    break;
            }
            
            break;
        
        case 5:
            if (ds_map_find_value(global.flags, "plot") < 17)
            {
                direction = point_direction(x + (sprite_width * 0.5), y + sprite_height, obj_player.x, obj_player.y + (obj_player.sprite_height * 0.5));
                lookDirection = direction_calculate();
                global.currentnpc = id;
                dx_scene("asg.ruined5_int");
            }
            
            break;
        
        case 8:
            dx_scene("asg_home.inside_prenap");
            defaultDirection = 0;
            break;
        
        case 10:
            dx_scene("asg_home.post_interact_gf");
            break;
    }
}
