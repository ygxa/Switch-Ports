var _x = x - floor(sprite_xoffset);
var _y = (y - floor(sprite_yoffset)) + (floor(sprite_height * 0.25) * 3);
s.x = _x;
s.y = _y;

if (type == 7 && !visible)
{
    layer_sprite_index(layer_sprite_get_id(layer_get_id("AsgoreLayer"), "asgoreTree"), obj_overworldui.portraitIndex);
}
else
{
}

switch (state)
{
    case 0:
        if (global.currentnpc == id)
        {
            if (dark && type == 10 && ds_map_find_value(global.flags, "plot") >= 35)
            {
                lookDirection = 4;
                sprite_index = spr_asgr_kneel_dark;
            }
            else if (robe)
            {
                switch (lookDirection)
                {
                    case 1:
                        sprite_index = sad ? (dark ? spr_asgr_down_dark : spr_asgr_down_talk_sad) : spr_asgr_down_talk;
                        break;
                    
                    case 2:
                        sprite_index = spr_asgr_left_talk;
                        break;
                    
                    case 0:
                        sprite_index = spr_asgr_up_talk;
                        break;
                    
                    case 3:
                        sprite_index = dark ? spr_asgr_right_dark : spr_asgr_right_talk;
                        break;
                }
            }
            else
            {
                switch (lookDirection)
                {
                    case 1:
                        sprite_index = spr_asg_down_talk;
                        break;
                    
                    case 2:
                        sprite_index = spr_asg_left_talk;
                        break;
                    
                    case 0:
                        sprite_index = spr_asg_up_talk;
                        break;
                    
                    case 3:
                        sprite_index = spr_asg_right_talk;
                        break;
                }
            }
            
            if (obj_overworldui.state == (1 << 0) && (obj_overworldui.currentCharacter == "asg" || obj_overworldui.currentCharacter == "asgr"))
                image_index = obj_overworldui.portraitIndex;
            else
                image_index = 0;
        }
        else
        {
            if (defaultDirection != 4)
            {
                lookDirection = defaultDirection;
            }
            else if (type == 3)
            {
                var dizz = ds_map_find_value(global.flags, "rh3_asgdizzy");
                
                if (dizz != 2)
                {
                    direction = point_direction(x + (sprite_width * 0.5), y + sprite_height, obj_player.x, obj_player.y + (obj_player.sprite_height * 0.5));
                    var prev = lookDirection;
                    lookDirection = direction_calculate();
                    
                    if (prev != lookDirection)
                    {
                        dirChangeCounter++;
                        
                        if (dirChangeCounter >= 6 && true && global.canmove)
                        {
                            dirChangeCounter = 0;
                            global.currentnpc = id;
                            
                            if (dizz == 0)
                                dx_scene("asg.ruined3_dizzy");
                            else
                                dx_scene("asg.ruined3_dizzy2");
                            
                            ds_map_set_post(global.flags, "rh3_asgdizzy", ds_map_find_value(global.flags, "rh3_asgdizzy") + 1);
                        }
                    }
                }
                else
                {
                    lookDirection = 3;
                }
            }
            
            if (dark && type == 10 && ds_map_find_value(global.flags, "plot") >= 35)
            {
                lookDirection = 4;
                sprite_index = spr_asgr_kneel_dark;
            }
            
            event_user(15);
            image_index = 0;
        }
        
        break;
    
    case 1:
        image_speed = 0.2;
        
        switch (type)
        {
            case 0:
                if (y < -sprite_height)
                {
                    scene_resume();
                    instance_destroy();
                }
                
                break;
            
            case 1:
                lookDirection = 0;
                
                if (path_position >= 0.6 && runningPath != pth_asg_ruin_entrance)
                {
                    sprite_index = spr_asg_duck;
                    lookDirection = 4;
                }
                
                if (path_position == 1)
                {
                    image_speed = 0;
                    image_index = 0;
                    
                    if (runningPath == pth_asg_ruin_entrance)
                    {
                        state = 2;
                        lookDirection = 1;
                    }
                    else
                    {
                        state = -1;
                        alarm[6] = 5;
                    }
                }
                
                break;
            
            case 2:
                if (runningPath == pth_asg_ruin2_1)
                    lookDirection = 0;
                else
                    lookDirection = direction_calculate();
                
                if (path_position == 1)
                {
                    image_speed = 0;
                    image_index = 0;
                    
                    if (runningPath == pth_asg_ruin2_1)
                    {
                        state = 0;
                        lookDirection = 1;
                    }
                    else if (runningPath == pth_asg_ruin2_2_1_1 || runningPath == pth_asg_ruin2_2_2_1)
                    {
                        state = -1;
                        leversPulled = 0;
                        
                        if (runningPath == pth_asg_ruin2_2_2_1)
                            defaultDirection = 0;
                        
                        lookDirection = defaultDirection;
                        alarm[1] = 6;
                    }
                    else if (runningPath == pth_asg_ruin2_2_1_2 || runningPath == pth_asg_ruin2_2_2_2)
                    {
                        state = 0;
                        lookDirection = 1;
                        pathToRun = pth_asg_ruin2_3;
                        scene_resume();
                    }
                    else
                    {
                        state = -1;
                        alarm[0] = 1;
                    }
                }
                
                break;
            
            case 3:
                if (runningPath == pth_asg_ruin3_3)
                    lookDirection = direction_calculate();
                else
                    lookDirection = 3;
                
                if (path_position == 1)
                {
                    image_speed = 0;
                    image_index = 0;
                    
                    if (runningPath == pth_asg_ruin3_1)
                    {
                        state = 0;
                        instance_destroy(inst_get(100));
                    }
                    else if (runningPath == pth_asg_ruin3_2)
                    {
                        state = 0;
                        lookDirection = 2;
                        obj_player.lookDirection = 3;
                        global.currentnpc = id;
                        dx_scene("asg.ruined3_success");
                        pathToRun = pth_asg_ruin3_3;
                    }
                    else
                    {
                        state = -1;
                        alarm[0] = 1;
                    }
                }
                
                break;
            
            case 4:
                if (pathToRun == -1)
                {
                    if ((counter == 0 && y >= 365) || (counter == 1 && y >= 370) || (counter == 2 && y >= 375))
                    {
                        counter++;
                        sfx_play(snd_bang);
                        view_shake(3, 2);
                    }
                    
                    if (y > 377)
                    {
                        if (y > 380)
                        {
                            vspeed = 0;
                            y = 380;
                            
                            with (obj_player)
                            {
                                lookDirection = 0;
                                image_speed = 0;
                                dummyOverride = false;
                            }
                            
                            var i = instance_create_xy(142, 303, obj_md_doorbreak);
                            i.image_xscale = 1.8;
                            i.image_yscale = 3.84;
                            state = 0;
                        }
                        else
                        {
                            with (obj_player)
                            {
                                lookDirection = 3;
                                dummyOverride = true;
                                image_speed = 0.2;
                                x += 2;
                                y++;
                            }
                        }
                    }
                }
                else
                {
                    switch (runningPath)
                    {
                        case pth_asg_ruin4_1:
                        case pth_asg_ruin4_4:
                            lookDirection = direction_calculate();
                            
                            if (path_position == 1)
                            {
                                image_speed = 0;
                                image_index = 0;
                                state = -1;
                                alarm[0] = 1;
                            }
                            
                            break;
                        
                        case pth_asg_ruin4_2_1:
                            lookDirection = direction_calculate();
                            
                            if (path_position == 1)
                            {
                                image_speed = 0;
                                image_index = 0;
                                
                                if (y > 170)
                                {
                                    y -= 4;
                                    visible = false;
                                }
                                else
                                {
                                    state = 0;
                                    pathToRun = pth_asg_ruin4_2_2;
                                    visible = true;
                                    event_user(2);
                                }
                            }
                            
                            break;
                        
                        case pth_asg_ruin4_2_2:
                            lookDirection = direction_calculate();
                            
                            if (path_position == 1)
                            {
                                image_speed = 0;
                                image_index = 0;
                                state = 2;
                                defaultDirection = 1;
                                lookDirection = defaultDirection;
                            }
                            
                            break;
                        
                        case pth_asg_ruin4_3_1:
                        case pth_asg_ruin4_3_1_alt:
                        case pth_asg_ruin4_3_1_alt2:
                            lookDirection = direction_calculate();
                            
                            if (path_position == 1)
                            {
                                image_speed = 0;
                                image_index = 0;
                                
                                if (y < 320)
                                {
                                    y += 4;
                                    
                                    if (visible)
                                    {
                                        global.canmove = true;
                                        visible = false;
                                    }
                                }
                                else
                                {
                                    state = 0;
                                    pathToRun = pth_asg_ruin4_3_2;
                                    visible = true;
                                    event_user(2);
                                }
                            }
                            else
                            {
                                global.canmove = false;
                            }
                            
                            break;
                        
                        case pth_asg_ruin4_3_2:
                            lookDirection = direction_calculate();
                            
                            if (path_position == 1)
                            {
                                image_speed = 0;
                                image_index = 0;
                                state = 0;
                                defaultDirection = 2;
                                lookDirection = defaultDirection;
                            }
                            
                            break;
                    }
                }
                
                break;
            
            case 5:
                lookDirection = 3;
                
                if (path_position == 1)
                {
                    image_speed = 0;
                    image_index = 0;
                    
                    if (runningPath == pth_asg_ruin5_1 || runningPath == pth_asg_ruin5_2)
                    {
                        state = 0;
                        lookDirection = 2;
                    }
                    else
                    {
                        state = -1;
                        alarm[0] = 1;
                    }
                }
                
                break;
            
            case 6:
                if (runningPath == pth_asg_ruin6)
                {
                    lookDirection = 3;
                    
                    if (path_position == 1)
                    {
                        image_speed = 0;
                        image_index = 0;
                        state = -1;
                        alarm[0] = 1;
                    }
                }
                else if (moveState == 0)
                {
                    if (obj_player.x >= (x + 20))
                    {
                        moveState = 1;
                        lookDirection = 3;
                        sprite_index = lookDirection;
                        dx_scene("asg.ruined6_chat");
                    }
                    else
                    {
                        image_speed = 0;
                        image_index = 0;
                        
                        with (obj_player)
                        {
                            if (y < 150)
                                y += 1;
                            else
                                y = 150;
                        }
                    }
                }
                else if (moveState == 2)
                {
                    if (obj_ruin_longroom.currentRoom == 4)
                    {
                        if (!stoppedWalkMusic && x >= 300)
                        {
                            stoppedWalkMusic = true;
                            music_gain(0, 1000);
                        }
                        
                        if (x >= 390)
                        {
                            with (obj_player)
                            {
                                dummyOverride = false;
                                image_speed = 0;
                                image_index = 0;
                                hspeed = 0;
                            }
                            
                            hspeed = 3;
                            moveState = 3;
                        }
                    }
                }
                else if (moveState == 3)
                {
                    if (x >= 460)
                    {
                        x = 460;
                        moveState = -1;
                        state = 0;
                        lookDirection = 2;
                        hspeed = 0;
                        
                        with (obj_ruin_longroom)
                        {
                            roomOrder = array_create(2);
                            roomOrder[0] = 0;
                            roomOrder[1] = 4;
                            currentRoom = 4;
                            currentRoomIndex = 1;
                        }
                        
                        global.currentnpc = id;
                        dx_scene("asg.ruined6_end");
                        
                        with (obj_stalkertem)
                            enabled = true;
                    }
                }
                
                break;
            
            case 7:
                if (runningPath == pth_asg_home_outside)
                {
                    if (path_position == 1)
                    {
                        lookDirection = 4;
                        sprite_index = spr_asg_hug;
                        image_index = 0;
                        image_speed = 1;
                        obj_player.visible = false;
                        runningPath = -1;
                    }
                    else
                    {
                        lookDirection = direction_calculate();
                        
                        if (sequence == undefined && path_position >= 0.98)
                        {
                            if (items_get_armor() == 6)
                            {
                                sequence = layer_sequence_create(layer_create(obj_player.depth - 10), obj_player.x, obj_player.y, seq_hat_drop);
                                layer_sequence_play(sequence);
                            }
                        }
                    }
                }
                else if (sprite_index == spr_asg_hug)
                {
                    if (floor(image_index) >= 19)
                    {
                        lookDirection = 1;
                        sprite_index = spr_asg_down;
                        image_index = 1;
                        image_speed = 0.1;
                        vspeed = -1;
                        
                        with (obj_player)
                        {
                            visible = true;
                            
                            if (items_get_armor() == 6)
                                drawArmor = false;
                        }
                    }
                    else
                    {
                        image_speed = 1;
                    }
                }
                else if (vspeed == -1)
                {
                    if (y < 310)
                    {
                        vspeed = 0;
                        image_speed = 0;
                        image_index = 0;
                        y = 310;
                        scene_resume();
                        state = 0;
                    }
                    else
                    {
                        sprite_index = spr_asg_down;
                        image_speed = 0.1;
                        vspeed = -1;
                    }
                }
                else if (runningPath == pth_asg_home_outside_2)
                {
                    if (path_position == 1)
                    {
                        image_speed = 0;
                        image_index = 0;
                        state = -1;
                        alarm[0] = 1;
                    }
                }
                
                break;
            
            case 8:
                if (runningPath == pth_asg_home_inside)
                {
                    if (x >= 380)
                    {
                        state = -1;
                        var f = instance_create(obj_fader);
                        f.extraFrames = 1;
                        
                        f.completeCallback = function()
                        {
                            global.scene_on_room_start_override = true;
                            ds_map_clear(global.inst_custom_ids);
                            room_goto(rm_ruina_hallway);
                        };
                        
                        global.entrancespawn_on_room_start = -1;
                        global.player_direction_on_room_start = 3;
                        global.fader_on_room_start = true;
                    }
                    else
                    {
                        lookDirection = direction_calculate();
                        
                        with (obj_player)
                        {
                            lookDirection = direction_calculate();
                            image_speed = 0.2;
                            dummyOverride = true;
                        }
                    }
                }
                else if (runningPath == pth_asg_home_inside_2)
                {
                    if (path_position == 1)
                    {
                        image_speed = 0;
                        image_index = 0;
                        state = -1;
                        alarm[0] = 1;
                    }
                    else
                    {
                        lookDirection = 1;
                    }
                }
                
                break;
            
            case 9:
                if (runningPath == pth_asg_home_hallway)
                {
                    if (path_position == 1)
                    {
                        image_speed = 0;
                        image_index = 0;
                        state = 0;
                        lookDirection = 0;
                        
                        with (obj_player)
                        {
                            lookDirection = 0;
                            dummyOverride = false;
                            image_speed = 0;
                            image_index = 0;
                        }
                        
                        scene_resume();
                    }
                    else
                    {
                        lookDirection = 3;
                        
                        with (obj_player)
                        {
                            lookDirection = 3;
                            image_speed = 0.2;
                            dummyOverride = true;
                            x += 3;
                        }
                    }
                }
                else if (runningPath == pth_asg_home_hallway_2)
                {
                    if (path_position == 1)
                    {
                        image_speed = 0;
                        image_index = 0;
                        state = -1;
                        alarm[0] = 1;
                        scene_resume();
                    }
                    else
                    {
                        lookDirection = 2;
                    }
                }
                
                break;
            
            case 10:
                if (runningPath != -1)
                {
                    if (path_position == 1)
                    {
                        if (runningPath == pth_asg_home_garden_3)
                        {
                            runningPath = -1;
                            image_speed = 0;
                            image_index = 0;
                            state = 0;
                            lookDirection = 1;
                            defaultDirection = 1;
                            alarm[9] = 25;
                        }
                        else
                        {
                            runningPath = -1;
                            image_speed = 0;
                            image_index = 0;
                            state = 0;
                            lookDirection = 0;
                            defaultDirection = 0;
                        }
                    }
                    else
                    {
                        lookDirection = (runningPath == pth_asg_home_garden_3) ? 1 : 0;
                    }
                }
                else if (sprite_index == spr_asgr_kneel_hug)
                {
                    if (floor(image_index) >= (image_number - 1))
                    {
                        image_index = image_number - 1;
                        image_speed = 0;
                    }
                    else
                    {
                        image_speed = 1;
                    }
                }
                else if (sprite_index == spr_asgr_kneel_hug_end)
                {
                    if (floor(image_index) >= (image_number - 1))
                    {
                        image_speed = 0;
                        lookDirection = 1;
                        vspeed = -2;
                        obj_player.visible = true;
                    }
                    else
                    {
                        image_speed = 1;
                    }
                }
                else if (vspeed == 2)
                {
                    if (y >= 432)
                    {
                        y = 432;
                        vspeed = 0;
                        lookDirection = 4;
                        sprite_index = spr_asgr_kneel_hug;
                        image_index = 0;
                        image_speed = 1;
                        
                        with (obj_player)
                        {
                            visible = false;
                            drawArmor = false;
                        }
                    }
                    else if (y >= 430)
                    {
                        if (sequence == undefined)
                        {
                            if (items_get_armor() == 6)
                            {
                                sequence = layer_sequence_create(layer_create(obj_player.depth - 10), obj_player.x, obj_player.y, seq_hat_drop2);
                                layer_sequence_play(sequence);
                            }
                        }
                    }
                }
                else if (vspeed == -2)
                {
                    if (y <= 380)
                    {
                        y = 380;
                        vspeed = 0;
                        image_speed = 0;
                        image_index = 0;
                        state = 0;
                    }
                }
                else if (vspeed == 3)
                {
                    if (y >= 900)
                        instance_destroy();
                }
                
                break;
        }
        
        event_user(15);
        break;
}

if (sprite_index != _lastSpriteIndex)
{
    _lastSpriteIndex = sprite_index;
    
    if (sprite_index == -1)
        _offsetY = 0;
    else
        _offsetY = sprite_height - sprite_yoffset;
}

depth = -(y + _offsetY);
