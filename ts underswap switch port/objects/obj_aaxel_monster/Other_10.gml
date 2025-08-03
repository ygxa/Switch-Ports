event_inherited();

if (global.bev_subtype == 2)
{
    with (obj_battledamage)
        minHpDisplay = 4;
    
    alarm[0] = 10;
    
    if (mercyThresholdHit || hp <= 0 || obj_battledamage.monsterHpTarget <= 10)
    {
        ds_map_set_post(global.flags, "mk_grs", ds_map_find_value(global.flags, "mk_grs") + 1);
        ds_map_set(global.flags, "rhc_axj", !image_index);
        ds_map_set(global.flags, "gr_aaxel", 1);
        
        if (goldReward >= 5)
            goldReward -= 5;
        
        cmd_aaxelFlee();
        obj_greasers_manager.forceFlavor = "battles.greasers.aaxel.flavor_run";
    }
    
    shakeValue = shakeAmount;
    alarm[10] = 1;
}
else if (global.bev_subtype == 1)
{
    bobbing = false;
    y = yOrigin;
}
