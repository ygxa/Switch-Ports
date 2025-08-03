if (dingCounter > 0)
    dingCounter -= (1/3);

if (room == rm_stark_hallway_right && dingCounter >= 20 && global.canmove)
{
    dingCounter = -1;
    dx_scene("stark.right_ruckus");
}

var inzone;

with (obj_player)
    inzone = (!instance_exists(obj_fader) || other.ignoreFaders) && (other.cutscene || (global.canmove && place_meeting(x, y, obj_dodgemode_zone)));

if (inzone)
{
    if (alpha < 1)
    {
        if (alpha == 0)
        {
            if (allowDingSfx)
                sfx_play(snd_ding);
            
            if (dingCounter != -1)
                dingCounter += 1;
        }
        
        alpha += 0.1;
        fadeDirection = 0;
    }
    
    with (obj_player)
    {
        disableMenu = true;
        dodgingAlpha = other.alpha;
        dodgingDir = other.fadeDirection;
        
        if (other.invincibilityTimer > 0)
        {
            other.invincibilityTimer--;
            dodgingHeartFrame += 0.3;
            
            if (dodgingHeartFrame >= 2)
                dodgingHeartFrame -= 2;
        }
        else
        {
            other.invincibilityTimer = 0;
            dodgingHeartFrame = 0;
            var list = ds_list_create();
            var count = collision_rectangle_list((x + 4) - 8, (y + 14) - 14, (x + 12) - 8, (y + 22) - 14, obj_bullet_parent, true, true, list, true);
            
            for (var i = 0; i < count; i++)
            {
                var bullet = ds_list_find_value(list, i);
                var btype = (0 << 0);
                
                if (variable_instance_exists(bullet, "bulletType"))
                    btype = bullet.bulletType;
                
                switch (btype)
                {
                    case (1 << 0):
                        if (x != xprevious || y != yprevious)
                        {
                            with (bullet)
                                event_user(0);
                        }
                        
                        break;
                    
                    case (2 << 0):
                        if (x == xprevious && y == yprevious)
                        {
                            with (bullet)
                                event_user(0);
                        }
                        
                        break;
                    
                    default:
                        with (bullet)
                            event_user(0);
                        
                        break;
                }
            }
            
            ds_list_destroy(list);
        }
    }
    
    if (global.playerhp <= 0)
    {
        if (kill)
        {
            with (obj_player)
            {
                global.xstore = (x - camera_get_view_x(view_camera[0]) - 4) * 2;
                global.ystore = (y - camera_get_view_y(view_camera[0])) * 2;
            }
            
            global.battle_id = -1;
            global.canmove = false;
            global.currentroom = room;
            global.undo_room_persistence = true;
            room_persistent = true;
            room_goto(rm_gameover);
            exit;
        }
        else
        {
            global.playerhp = 1;
        }
    }
}
else
{
    if (alpha > 0)
    {
        alpha -= 0.1;
        fadeDirection = 1;
    }
    
    invincibilityTimer = 0;
    
    with (obj_player)
    {
        if (room == rm_ruins3 || room == rm_ruins4)
            disableMenu = instance_exists(obj_md_sewer);
        else if (!ds_map_find_value(global.flags, "sts_ambush"))
            disableMenu = false;
        
        dodgingAlpha = other.alpha;
        dodgingDir = other.fadeDirection;
        dodgingHeartFrame = 0;
    }
}

if (room == rm_ruins3)
{
    var showTopLayers;
    
    with (obj_player)
        showTopLayers = place_meeting(x, y, obj_misczone);
    
    layer_set_visible(topLayers[0], showTopLayers);
    layer_set_visible(topLayers[1], showTopLayers);
}
