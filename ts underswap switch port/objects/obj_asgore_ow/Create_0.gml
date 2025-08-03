event_inherited();
spriteLeft = spr_asg_left;
spriteUp = spr_asg_up;
spriteRight = spr_asg_right;
defaultDirection = 4;
robe = false;
sad = false;
dark = false;
sequence = undefined;
leversPulled = 0;
quickHideFix = false;
state = 0;
pathToRun = -1;
runningPath = -1;
type = 0;
var plotv = ds_map_find_value(global.flags, "plot");

switch (room)
{
    case rm_ruin_entrance:
        type = 1;
        
        if (plotv == 3)
        {
            global.player_direction_on_room_start = 0;
            ds_map_set(global.flags, "plot", 4);
            pathToRun = pth_asg_ruin_entrance;
            global.currentnpc = id;
            dx_scene("asg.ruined1");
        }
        else if (plotv == 4)
        {
            state = 2;
            x = 140;
            y = 96;
            lookDirection = 1;
            sprite_index = spr_asg_down;
        }
        else
        {
            instance_destroy(obj_trigger_code);
            instance_destroy();
        }
        
        break;
    
    case rm_ruin2:
        type = 2;
        defaultDirection = 1;
        
        if (plotv == 5)
        {
            global.player_direction_on_room_start = 0;
            ds_map_set(global.flags, "plot", 6);
            pathToRun = pth_asg_ruin2_1;
            global.currentnpc = id;
            dx_scene("asg.ruined2");
        }
        else if (plotv == 6)
        {
            x = 80;
            y = 40;
            state = 0;
            lookDirection = 1;
            sprite_index = spr_asg_down;
        }
        else
        {
            instance_destroy();
        }
        
        break;
    
    case rm_ruin3_spikepath:
        type = 3;
        dirChangeCounter = 0;
        alarm[4] = 30;
        
        if (plotv == 7)
        {
            global.player_direction_on_room_start = 0;
            ds_map_set(global.flags, "plot", 8);
            global.currentnpc = id;
            dx_scene("asg.ruined3");
        }
        else if (plotv == 10)
        {
            x = 340;
            y = 220;
        }
        else if (plotv >= 11)
        {
            instance_destroy();
        }
        
        break;
    
    case rm_ruin4_md:
        type = 4;
        counter = 0;
        
        if (plotv < 12)
        {
            global.player_direction_on_room_start = 3;
            global.currentnpc = id;
            lookDirection = 2;
            pathToRun = -1;
            dx_scene("asg.ruined4");
        }
        else if (plotv == 12 || plotv == 13)
        {
            x = 90;
            y = 50;
            lookDirection = 1;
            defaultDirection = 1;
            
            if (plotv == 13)
                instance_destroy(obj_trigger_code);
            else
                state = 2;
        }
        else if (plotv == 14)
        {
            instance_destroy(obj_md_stand);
            instance_destroy(obj_trigger_code);
            var t = instance_create_xy(195, 360, obj_trigger_scene);
            t.image_yscale = 5;
            t.sceneName = "asg.ruined4_post";
            lookDirection = 2;
            x = 230;
            y = 355;
        }
        else if (plotv >= 15)
        {
            instance_destroy(obj_md_stand);
            instance_destroy(obj_trigger_code);
            instance_destroy();
        }
        
        break;
    
    case rm_ruin5:
        type = 5;
        
        if (plotv == 15)
        {
            global.player_direction_on_room_start = 3;
            global.currentnpc = id;
            lookDirection = 2;
            pathToRun = pth_asg_ruin5_1;
            dx_scene("asg.ruined5");
        }
        else if (plotv == 16)
        {
            x = 280;
            y = 80;
            lookDirection = 2;
        }
        else if (plotv == 17)
        {
            instance_destroy(inst_get(0));
            x = 380;
            y = 80;
            lookDirection = 2;
        }
        else if (plotv >= 18)
        {
            instance_destroy(inst_get(0));
            instance_destroy(obj_trigger_code);
            instance_destroy();
        }
        
        break;
    
    case rm_ruin6_long:
        type = 6;
        
        if (plotv == 18)
        {
            ds_map_set(global.flags, "plot", 19);
            
            with (obj_door)
                fadeAndStopMusic = true;
            
            lookDirection = 3;
            global.player_direction_on_room_start = 3;
            moveState = 0;
            global.currentnpc = id;
            stoppedWalkMusic = false;
            dx_scene("asg.ruined6_intro");
        }
        else
        {
            with (obj_ruin_longroom)
            {
                roomOrder = array_create(2);
                roomOrder[0] = 0;
                roomOrder[1] = 4;
                doLoop = false;
            }
            
            instance_destroy();
        }
        
        break;
    
    case rm_ruina_front:
        type = 7;
        visible = false;
        break;
    
    case rm_ruina_main:
    case -1007:
        type = 8;
        
        if (ds_map_find_value(global.flags, "plot") >= 31)
            robe = true;
        
        break;
    
    case rm_ruina_hallway:
        if (ds_map_find_value(global.flags, "plot") >= 30)
        {
            instance_destroy();
            exit;
        }
        else
        {
            ds_map_set(global.flags, "plot", 30);
        }
        
        type = 9;
        pathToRun = pth_asg_home_hallway;
        event_user(2);
        
        with (obj_player)
        {
            x = -18;
            y = 138;
        }
        
        break;
    
    case rm_ruina_garden:
        type = 10;
        robe = true;
        sad = true;
        dark = ruth_enabled();
        defaultDirection = 0;
        lookDirection = 0;
        break;
    
    case -1001:
    case -1002:
    case -1003:
    case -1004:
    case -1005:
    case -1006:
        break;
}

if (robe)
{
    spriteDown = sad ? (dark ? spr_asgr_down_dark : spr_asgr_down_sad) : spr_asgr_down;
    sprite_index = spriteDown;
    spriteUp = spr_asgr_up;
}
