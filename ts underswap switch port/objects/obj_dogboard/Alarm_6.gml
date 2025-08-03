doPose(spr_dogboard_go, 0, 1, false);
stage = 5;

if (room == rm_star7B)
{
    star7moving = false;
    obj_star_cbrace.dodging = true;
    doPose(spr_dogboard_fly, 0, 1, false);
    
    with (inst_get("tricycle"))
    {
        sprite_index = spr_cb_tricycle_moving;
        image_index = 0;
        image_speed = 1;
    }
}

with (obj_player)
{
    dummyOverride = true;
    lookDirection = 4;
    lookDirectionLag = 4;
    
    switch (ds_map_find_value(global.flags, "gf"))
    {
        case -1:
        default:
            sprite_index = spr_dogboard_chara_right;
            break;
        
        case 0:
            sprite_index = spr_dogboard_chara_right_g;
            break;
        
        case 1:
            sprite_index = spr_dogboard_chara_right_f;
            break;
    }
    
    image_index = 0;
    image_speed = 1;
    specialArmor = -1;
    
    switch (items_get_armor())
    {
        case 6:
            specialArmor = spr_dogboard_chara_right_cowboyhat;
            break;
        
        case 25:
            specialArmor = spr_dogboard_chara_right_tornapron;
            break;
        
        case 26:
            specialArmor = spr_dogboard_chara_right_patchedapron;
            break;
    }
}
