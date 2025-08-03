actor_init();
stage = 0;
targetStage = 0;
accel = 1;
dodging = false;
cutscene = false;
boosterIndex = -1;
ding = -1;
yeet = false;
speedup = 120;
star7moving = false;
star7timer = 0;
star7success = false;
star7teleport = 0;
star7hack = false;
drawAbove = true;
star7countdown = 10;
moveTimer = 0;

if (room == rm_star23_chase2)
{
    if (ds_map_find_value(global.flags, "plot") >= 56)
    {
        instance_destroy();
        exit;
    }
    
    if (global.debug && keyboard_check(vk_f3))
        obj_debugger.gameSpeed = 9999;
    
    instance_create(obj_madhouse);
    obj_dodgemode_handler.cutscene = true;
    global.canmove = false;
    dodging = true;
    image_speed = 0;
    
    with (obj_player)
    {
        x = other.x + 8;
        y = other.y - 8;
        dummyOverride = true;
        lookDirection = 4;
        lookDirectionLag = 4;
        sprite_index = spr_dogboard_chara_up;
        image_index = 0;
        image_speed = 1;
        specialArmor = -1;
        
        switch (items_get_armor())
        {
            case 6:
                specialArmor = spr_dogboard_chara_up_cowboyhat;
                break;
            
            case 25:
                specialArmor = spr_dogboard_chara_up_tornapron;
                break;
        }
        
        other.actualViewY = y - 120;
    }
    
    with (obj_gamemanager)
    {
        forceView = true;
        forceViewSpeed = 7;
        forceViewX = 0;
        forceViewY = room_height - 240;
    }
    
    camera_set_view_pos(view_camera[0], 0, room_height - 240);
    doPose(spr_dogboard_fly_up, 0, 1, false);
}
else
{
    doPose(spr_dogboard_spin, 0, 1, false);
}
