actor_logic();
actor_update_dir();

if (boosterIndex > 0)
{
    boosterIndex += 0.2;
    
    if (floor(boosterIndex) >= 3)
        boosterIndex -= 2;
}

if (dodging)
{
    image_blend = merge_color(c_white, #CCCCCC, obj_dodgemode_handler.alpha);
    
    if (!star7moving)
        exit;
}

switch (stage)
{
    case 0:
        var py = min((room == rm_star7B) ? 140 : 155, obj_player.y);
        
        if (y < py)
            y += ((room == rm_star7B) ? 4 : 2);
        
        if (y >= py)
        {
            y = py;
            image_speed = 0;
            image_index = 0;
            
            if (targetStage >= 1)
            {
                doPose(spr_dogboard_play, 0, 1, false);
                doShake(3);
                stage++;
            }
        }
        
        break;
    
    case 1:
        sfx_play(snd_bark);
        alarm[0] = 10;
        stage = 2;
        break;
    
    case 2:
        if (targetStage >= 3)
        {
            if (alarm[0] == -1 && !instance_exists(obj_exclamation))
            {
                doPose(spr_dogboard_walk_left, 0, 1, false);
                stage++;
            }
        }
        
        break;
    
    case 3:
        var px = obj_player.x + 10;
        
        if (x > px)
            x -= 1;
        
        if (x <= px)
        {
            x = px;
            
            if (ding > 0)
                ding--;
            
            if (sprite_index != spr_dogboard_point)
            {
                doAnim(spr_dogboard_point, 1, function()
                {
                    sfx_play(snd_ding);
                    ding = 20;
                });
            }
            else if (image_speed == 0 && ding == 0 && targetStage >= 4)
            {
                doAnim(spr_dogboard_point, 0);
                
                with (obj_player)
                {
                    dummyOverride = true;
                    approachPos(other.x + 20, other.y - 7, 30, function()
                    {
                        scene_resume();
                        sfx_play(snd_click);
                        obj_dogboard.boosterIndex = 0;
                        
                        if (room != rm_star7B)
                            lookDirection = 2;
                    });
                }
                
                stage++;
            }
        }
        
        break;
    
    case 4:
        if (targetStage >= 5)
        {
            stage = 4.5;
            boosterIndex = 1;
            obj_player.lookDirection = 3;
            doPose(spr_dogboard_countdown, 0, 0, false);
            sfx_play_pitch(snd_bark, 0.7);
            alarm[5] = (room == rm_star7B) ? star7countdown : 20;
        }
        
        break;
    
    case 5:
        x += accel;
        
        if (accel < 5)
            accel += 0.1;
        
        var limit = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 20;
        
        if (x >= limit)
            x = limit;
        
        obj_player.x = x + 18;
        break;
}
