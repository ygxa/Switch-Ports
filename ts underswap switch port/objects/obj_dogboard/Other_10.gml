moveTimer++;

if (dodging)
{
    if (room == rm_star7B)
    {
        if (cutscene && !star7success)
        {
        }
        else if (!star7moving)
        {
            star7timer++;
            
            if (star7teleport != 2)
            {
                with (obj_gamemanager)
                {
                    forceView = true;
                    forceViewSpeed = 7;
                    
                    if (other.star7timer == 1)
                        forceViewX = camera_get_view_x(view_camera[0]);
                    else if (other.star7timer < 47)
                        forceViewX += 4;
                    
                    forceViewY = 0;
                }
            }
            
            if (!cutscene && ((global.debug && keyboard_check(vk_f3)) || star7timer >= 910 || global.playerhp <= 1))
            {
                cutscene = true;
                
                with (obj_dodgemode_handler)
                    cutscene = false;
                
                with (obj_star_cbrace)
                    dodging = false;
                
                if (global.playerhp <= 1)
                {
                    global.playerhp = 1;
                    dx_scene("star.rm7b_failure");
                }
                else
                {
                    star7success = true;
                    dx_scene("star.rm7b_success");
                }
            }
            else if (star7timer < 47)
            {
                x += 4;
            }
            else if (star7teleport != 2)
            {
                if (star7timer == 47)
                {
                    with (obj_bg_parallax)
                        disabled = true;
                }
                else if ((star7timer - 207) >= 0 && ((star7timer - 207) % 160) == 0)
                {
                    layer_x("Tiles_1", 0);
                    layer_x("Tiles_2", 0);
                    layer_x("Tiles_3", 0);
                    
                    if (star7success && star7teleport == 1)
                    {
                        star7teleport = 2;
                        
                        with (obj_gamemanager)
                        {
                            forceView = false;
                            customViewMode = true;
                            camera_set_view_pos(view_camera[0], 1030, 0);
                        }
                        
                        with (obj_dogboard)
                            x += 640;
                        
                        with (inst_get("cb"))
                            x += 640;
                        
                        with (obj_player)
                            x += 640;
                        
                        with (obj_bg_parallax)
                        {
                            enableOverride = true;
                            disabled = false;
                            viewOffset = -1030;
                            parallaxOffsets[0] = layer_get_x("Parallax_0") - 14;
                        }
                        
                        scene_resume();
                    }
                }
                
                if (star7teleport != 2)
                {
                    layer_x("Parallax_0", layer_get_x("Parallax_0") - 0.8);
                    layer_x("Tiles_1", layer_get_x("Tiles_1") - 4);
                    layer_x("Tiles_2", layer_get_x("Tiles_2") - 4);
                    layer_x("Tiles_3", layer_get_x("Tiles_3") - 4);
                }
            }
            
            if (!cutscene)
            {
                var moveSpeed = 3;
                
                if (global.control_cancel)
                    moveSpeed = 2;
                
                if (global.control_left)
                {
                    x -= moveSpeed;
                    var minX = obj_gamemanager.forceViewX + 40;
                    
                    if (x < minX)
                        x = minX;
                }
                
                if (global.control_right)
                {
                    x += moveSpeed;
                    var maxX = (obj_gamemanager.forceViewX + 320) - 40 - sprite_width;
                    
                    if (x > maxX)
                        x = maxX;
                }
                
                if (global.control_up)
                {
                    y -= moveSpeed;
                    
                    if (y < 145)
                        y = 145;
                }
                
                if (global.control_down)
                {
                    y += moveSpeed;
                    
                    if (y > 205)
                        y = 205;
                }
                
                with (obj_player)
                {
                    x = other.x + 20;
                    y = other.y - 7;
                    lookDirection = 4;
                    lookDirectionLag = 4;
                }
                
                if (star7timer > 60 && star7timer < 870 && (star7timer % 12) == 0)
                {
                    if (star7timer > 300 && star7timer < 472)
                    {
                        var rangeStart = camera_get_view_y(view_camera[0]) + 140;
                        var rangeEnd = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 30;
                        var _y = ((star7timer % 48) <= 13) ? rangeStart : ((rangeStart + rangeEnd) / 2);
                        
                        for (var i = 0; i < 4; i++)
                        {
                            with (instance_create(obj_star_bonebullet))
                            {
                                y = _y;
                                image_angle = random(360);
                            }
                            
                            _y += ((rangeEnd - rangeStart) / 8);
                        }
                    }
                    else if (star7timer >= 792)
                    {
                        var rangeStart = camera_get_view_y(view_camera[0]) + 140;
                        var rangeEnd = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 30;
                        var _y1 = ((((rangeEnd - rangeStart) / 2) - 12) * ((864 - star7timer) / 72)) + ((rangeStart + rangeEnd) / 2) + 12;
                        var _y2 = ((rangeStart + rangeEnd) / 2) - (_y1 - ((rangeStart + rangeEnd) / 2));
                        
                        with (instance_create(obj_star_bonebullet))
                        {
                            y = _y1;
                            image_angle = random(360);
                        }
                        
                        with (instance_create(obj_star_bonebullet))
                        {
                            y = _y2;
                            image_angle = random(360);
                        }
                    }
                    else
                    {
                        instance_create(obj_star_bonebullet);
                    }
                }
            }
            else if (star7success)
            {
                with (obj_player)
                {
                    x = other.x + 20;
                    y = other.y - 7;
                    
                    if (!other.star7hack)
                    {
                        lookDirection = 4;
                        lookDirectionLag = 4;
                    }
                }
            }
        }
        else
        {
            with (obj_player)
            {
                x = other.x + 20;
                y = other.y - 7;
            }
        }
        
        exit;
    }
    
    with (obj_madhouse)
        event_user(1);
    
    if (room == rm_star22_chase1)
    {
        if (speedup > 0)
            speedup--;
        
        if (obj_gamemanager.forceViewX >= 2540)
        {
            if (vspeed == 0)
            {
                if (x < 2820)
                    x += ((speedup == 0) ? 5 : 4);
                else
                    doPose(spr_dogboard_walk_right, 0, 0, false);
                
                with (obj_player)
                {
                    x = other.x + 20;
                    y = other.y - 7;
                    
                    if (!other.cutscene)
                    {
                        lookDirection = 3;
                        lookDirectionLag = 3;
                        specialArmor = -2;
                        image_index = 0;
                        image_speed = 0;
                    }
                }
                
                if (!cutscene && alarm[1] == -1)
                {
                    boosterIndex = 0;
                    doPose(spr_dogboard_walk_right, 0, 1, false);
                    alarm[1] = 30;
                }
                
                with (obj_gamemanager)
                {
                    forceView = true;
                    forceViewSpeed = 7;
                    forceViewX = room_width - 320;
                    forceViewY = 0;
                }
                
                if (global.playerhp < 1)
                    global.playerhp = 1;
                
                obj_dodgemode_handler.cutscene = false;
            }
            else
            {
                with (obj_player)
                {
                    x = other.x + 20;
                    y = other.y - 7;
                }
            }
            
            exit;
        }
        
        with (obj_gamemanager)
        {
            forceView = true;
            forceViewSpeed = 7;
            forceViewX += ((other.speedup == 0) ? 5 : 4);
            forceViewY = 0;
        }
        
        x += ((speedup == 0) ? 5 : 4);
        var moveSpeed = 3;
        
        if (global.control_cancel)
            moveSpeed = 2;
        
        if (global.control_left)
        {
            x -= moveSpeed;
            var minX = obj_gamemanager.forceViewX + 90;
            
            if (x < minX)
                x = minX;
        }
        
        if (global.control_right)
        {
            x += moveSpeed;
            var maxX = (obj_gamemanager.forceViewX + 320) - 40;
            
            if (x > maxX)
                x = maxX;
        }
        
        if (global.control_up)
        {
            y -= moveSpeed;
            
            if (y < 100)
                y = 100;
        }
        
        if (global.control_down)
        {
            y += moveSpeed;
            
            if (y > 165)
                y = 165;
        }
        
        with (obj_player)
        {
            x = other.x + 20;
            y = other.y - 7;
            lookDirection = 4;
            lookDirectionLag = 4;
        }
    }
    else
    {
        if (camera_get_view_y(view_camera[0]) <= 240)
        {
            y = number_approach_smooth(y, 80, 0.015, 0.1);
            
            if (obj_player.image_speed > 0.1)
                obj_player.image_speed -= 0.005;
            
            if (image_speed > 0.1)
                image_speed -= 0.005;
            
            if (!yeet)
            {
                if (cutscene)
                    x = number_approach_smooth(x, 140, 0.015, 0.1);
                
                with (obj_player)
                {
                    x = other.x + 20;
                    y = other.y - 7;
                }
                
                if (!cutscene && alarm[4] == -1)
                    alarm[4] = 5;
                
                with (obj_gamemanager)
                {
                    forceView = true;
                    forceViewSpeed = 7;
                    forceViewX = 0;
                    forceViewY = 0;
                }
                
                if (global.playerhp < 1)
                    global.playerhp = 1;
                
                obj_dodgemode_handler.cutscene = false;
            }
            
            exit;
        }
        
        y -= 4;
        var moveSpeed = 3;
        
        if (global.control_cancel)
            moveSpeed = 2;
        
        if (global.control_left)
        {
            x -= moveSpeed;
            
            if (x < 100)
                x = 100;
        }
        
        if (global.control_right)
        {
            x += moveSpeed;
            
            if (x > 176)
                x = 176;
        }
        
        if (global.control_up)
        {
            y -= moveSpeed;
            var minY = camera_get_view_y(view_camera[0]) + 40;
            
            if (y < minY)
                y = minY;
        }
        
        if (global.control_down)
        {
            y += moveSpeed;
            var maxY = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - 80;
            
            if (y > maxY)
                y = maxY;
        }
        
        with (obj_player)
        {
            x = other.x + 20;
            y = other.y - 7;
        }
        
        actualViewY -= 4;
        
        with (obj_gamemanager)
        {
            forceView = true;
            forceViewSpeed = 7;
            forceViewX = 0;
            forceViewY = clamp(other.actualViewY, 0, room_height - 240);
        }
    }
}
