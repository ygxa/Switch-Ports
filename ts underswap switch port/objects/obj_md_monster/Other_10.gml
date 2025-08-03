switch (global.bev_subtype)
{
    case 2:
        sfx_play(hurtSound);
        event_user(10);
        
        if (stage == 0)
        {
            var o = instance_create_xy(((x + offsetUiX) - sprite_xoffset) + floor(sprite_width * 0.5), y - sprite_yoffset - 38, obj_battledamage);
            o.damageNum = obj_battletarget.damage;
            o.monsterHp = hp;
            o.monsterHpMax = maxHp;
            
            with (o)
                event_user(0);
            
            o.progressBattle = false;
            mercyThresholdHit = hp <= 20;
            isSpareable |= mercyThresholdHit;
            shakeValue = shakeAmount;
            alarm[10] = 1;
        }
        
        sceneState = 1;
        break;
    
    case 3:
        obj_battletarget.dontGoToAttack = true;
        var o = instance_create_xy((x - sprite_xoffset) + floor(sprite_width * 0.5) + 10, y - sprite_yoffset - 38, obj_battledamage);
        o.isMiss = true;
        sceneState = 3;
        break;
    
    default:
        event_inherited();
        break;
}
