switch (global.bev_subtype)
{
    case 1:
        face = spr_metfaceb_happy;
        sfx_play(snd_fade);
        attackFade = 0.5;
        var wf = floor(sprite_width * 0.25);
        var a = (wf + x + offsetUiX) - sprite_xoffset - 8;
        var b = (wf + y) - sprite_yoffset - 8;
        var c = sprite_width * 0.5;
        var d = sprite_height * 0.5;
        spared = true;
        image_speed = 0;
        x = initX;
        y = initY;
        path_end();
        
        repeat (14)
            instance_create_xy(irandom(c) + a, irandom(d) + b, obj_dustcloud);
        
        ds_map_set(global.flags, "plot", 28);
        journal_set_health(13, (1 << 0));
        break;
    
    case 2:
        if (hurtSound != -1)
        {
            sfx_play(hurtSound);
            face = spr_metfaceb_hurt;
            leftHand.sprite_index = spr_mett_hand_clench;
            waving = false;
            alarm[0] = 30;
        }
        
        var o = instance_create_xy(((x + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), y + 28, obj_battledamage);
        o.damageNum = obj_battletarget.damage;
        o.monsterHp = hp;
        o.monsterHpMax = maxHp;
        vdidfightnorm = true;
        
        with (o)
            event_user(0);
        
        mercyThresholdHit = (((hp - global.playerat - global.playerwepat) + defense) - mercyResistance) < 0;
        
        if (!fullMercyResist)
            isSpareable |= mercyThresholdHit;
        
        break;
    
    case 3:
        var o = instance_create_xy(((x + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), y - sprite_yoffset - 38, obj_battledamage);
        o.isMiss = true;
        vdidfightmiss = true;
        break;
}
