if (global.bev_subtype == 0)
{
    ds_map_set(global.flags, "ff", 2);
    global.journal_kills[3]++;
    global.areapopulations[global.currentarea]--;
}
else if (global.bev_subtype == 2)
{
    alarm[0] = 10;
}

switch (global.bev_subtype)
{
    case 2:
        var o;
        
        if (obj_battletarget.damage < maxHp)
        {
            sprite_index = hurtSprite;
            shakeValue = shakeAmount;
            alarm[10] = 1;
            
            if (hurtSound != -1)
                sfx_play(hurtSound);
            
            o = instance_create_xy(((x + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), y - sprite_yoffset - 38, obj_battledamage);
            o.damageNum = obj_battletarget.damage;
            o.monsterHp = hp;
            o.monsterHpMax = maxHp;
        }
        else
        {
            o = instance_create_xy(obj_ff_asg.x + (obj_ff_asg.sprite_width * 0.65), obj_ff_asg.y + (obj_ff_asg.sprite_height * 1.5), obj_battledamage);
            o.damageNum = round(obj_battletarget.damage / 5);
            o.monsterHp = 440;
            o.monsterHpMax = 440;
            o.width = 200;
            
            with (obj_ff_asg)
            {
                shakeValue = 10;
                shakeSpeed = 2;
                alarm[10] = 1;
            }
            
            ds_map_set(global.flags, "ff_asg_dmg", o.damageNum);
            ds_map_set(global.flags, "ff", 2);
        }
        
        with (o)
            event_user(0);
        
        mercyThresholdHit = (((hp - global.playerat - global.playerwepat) + defense) - mercyResistance) < 0;
        
        if (!fullMercyResist)
            isSpareable |= mercyThresholdHit;
        
        break;
    
    case 3:
        var o = instance_create_xy(((x + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), y - sprite_yoffset - 38, obj_battledamage);
        o.isMiss = true;
        break;
}
