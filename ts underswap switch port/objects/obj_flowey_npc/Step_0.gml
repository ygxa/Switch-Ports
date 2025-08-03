event_inherited();

if (room == rm_star5 || room == rm_star6 || specialMode)
{
    if (rises == 1)
    {
        if (sprite_index != spr_flowey_sink)
        {
            sprite_index = spr_flowey_sink;
            image_speed = 1.5;
            image_index = 0;
            lookDirection = 4;
        }
        else if (floor(image_index) >= 4)
        {
            if (destroySpecial)
                instance_destroy();
            else
                visible = false;
        }
    }
    else if (sprite_index == spr_flowey_rise)
    {
        if (floor(image_index) >= 3)
        {
            sprite_index = spr_flowey_down;
            image_index = 0;
            image_speed = 0;
            lookDirection = 1;
            
            if (room == rm_star6 || resumeSceneSpecial)
                scene_resume();
        }
    }
    else
    {
        event_user(15);
        
        if (global.currentnpc == id)
        {
            if (instance_exists(obj_overworldui.writer) && !obj_overworldui.writer.isDone)
                image_speed = 0.2;
            else if (floor(image_index) == 0)
                image_speed = 0;
        }
        else
        {
            image_index = 0;
            image_speed = 0;
        }
    }
}
else
{
    var extraCondition = true;
    
    if (room == rm_stars_entrance)
        extraCondition = !instance_exists(obj_harry_actor);
    
    if (extraCondition && point_distance((x + (sprite_width / 2)) - sprite_xoffset, (y + sprite_height) - sprite_yoffset, obj_player.x, obj_player.y + (obj_player.sprite_height / 2)) < dist)
    {
        if (sprite_index == spr_flowey_sink && floor(image_index) >= 4)
        {
            visible = false;
            image_speed = 0;
            image_index = 0;
        }
        
        if (!visible)
        {
            visible = true;
            sprite_index = spr_flowey_rise;
            image_speed = 1.5;
            image_index = 0;
            funny = room == rm_wake && global.control_menu && global.control_cancel && global.control_confirm;
            rises++;
        }
        else if (sprite_index == spr_flowey_rise)
        {
            if (floor(image_index) >= 3)
            {
                sprite_index = spr_flowey_down;
                image_index = 0;
                image_speed = 0;
                lookDirection = 1;
                
                if (rises >= 10 && !riseTriggered && (funny || global.canmove))
                {
                    riseTriggered = true;
                    ds_map_set(global.pflags, "flowey_wake_dance", true);
                    persist_save();
                    dx_scene("flowey.wake_dance");
                }
            }
        }
        else if (sprite_index != spr_flowey_sink && global.currentnpc != id)
        {
            lookDirection = 1;
            image_index = 0;
            image_speed = 0;
        }
    }
    else if (sprite_index == spr_flowey_rise)
    {
        if (floor(image_index) >= 3)
        {
            sprite_index = spr_flowey_down;
            image_index = 0;
            image_speed = 0;
        }
    }
    else if (sprite_index != spr_flowey_sink)
    {
        sprite_index = spr_flowey_sink;
        image_speed = 1.5;
        image_index = 0;
        lookDirection = 4;
    }
    else if (floor(image_index) >= 4)
    {
        visible = false;
        image_speed = 0;
        image_index = 0;
    }
}
