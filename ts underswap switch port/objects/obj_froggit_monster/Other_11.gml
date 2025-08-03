switch (global.bev_subtype)
{
    case 0:
        attackTime = 0;
        frogs = instance_number(obj_froggit_monster);
        noWhimsun = !instance_exists(obj_whimsun_monster) || !obj_whimsun_monster.isActive;
        loox = instance_exists(obj_loox_monster);
        attackIntense = frogs == 1 || (frogs == 2 && !obj_battlemanager.monsters[!monsterIndex].isActive);
        
        if (loox)
        {
            attackType = 0;
            
            if (obj_loox_monster.isActive && obj_loox_monster.attackType == 7)
                attackType = 6;
        }
        else
        {
            var lastAttackType = attackType;
            
            repeat (2)
            {
                while (attackType == -1 || attackType == 1 || (attackType <= 1 && !noWhimsun) || (attackType >= 4 && frogs != 1) || attackType == lastAttackType || (attackType == 3 && lastAttackType == 2))
                    attackType = xirandom(5);
                
                if (attackType == 4)
                {
                    xstart = x;
                    ystart = y;
                }
                else if (attackType == 2)
                {
                    if (frogs == 1)
                    {
                        attackType = 3;
                    }
                    else
                    {
                        xstart = x;
                        ystart = y;
                    }
                }
                else if (attackType == 3 && frogs != 1)
                {
                    attackType = 2;
                    xstart = x;
                    ystart = y;
                }
                
                if (attackType != 2)
                    break;
            }
        }
        
        break;
    
    case 1:
        if (frogs == 2 && !attackIntense && obj_battlemanager.monsters[!monsterIndex].attackType >= 2)
            attackType = -1;
        else if (loox && obj_loox_monster.isActive && obj_loox_monster.attackType == 4)
            attackType = -1;
        
        if (!obj_battlemanager.isBoxMoving || attackType == 4)
        {
            if (attackType != 2 && attackType != -1)
                attackTime++;
        }
        else
        {
            obj_battlemanager.attackTimer = 99;
        }
        
        switch (attackType)
        {
            case 0:
                var cond;
                
                if (loox && obj_loox_monster.isActive)
                    cond = (attackTime % 35) == 1;
                else
                    cond = (attackIntense && (attackTime % 20) == 1) || (!attackIntense && (attackTime % 25) == 1);
                
                if (cond)
                    bt_bullet(obj_frogb_fly, irandom(obj_battlemanager.boxX2 - obj_battlemanager.boxX1) + obj_battlemanager.boxX1, obj_battlemanager.boxY1);
                
                break;
            
            case 1:
                if (attackTime == 1 && (attackIntense || monsterIndex == 0))
                    bt_bullet(obj_frogb_leapfrog, obj_battlemanager.boxX2 - 46, obj_battlemanager.boxY2 - 46);
                
                break;
            
            case 2:
                var dist = point_distance(x, y, 268, 134);
                
                if (dist <= 2)
                {
                    speed = 0;
                    x = 268;
                    y = 134;
                    attackType = 3;
                }
                else
                {
                    direction = point_direction(x, y, 268, 134);
                    speed = dist * 0.25;
                }
                
                break;
            
            case 3:
                if (attackTime == 1)
                {
                    sprite_index = spr_frogtongueanim;
                    image_speed = 0.5;
                }
                else if (image_speed == 0.5)
                {
                    if ((image_index + image_speed) >= 3)
                    {
                        image_index = 3;
                        image_speed = 0;
                        obj_battlemanager.attackTimer = 150;
                    }
                }
                
                if ((attackTime % 12) == 1)
                {
                    bt_bullet(obj_frogb_fly2, obj_battlemanager.boxX1, obj_battlemanager.boxY2 - 10 - irandom(25));
                    
                    if (noWhimsun && attackTime >= 40)
                    {
                        if ((attackTime % 24) == 1)
                            bt_bullet(obj_frogb_fly4, (obj_battlemanager.boxX1 + 20) - irandom(15), obj_battlemanager.boxY1).hspeed = -0.25;
                        else
                            bt_bullet(obj_frogb_fly4, (obj_battlemanager.boxX2 - 20) + irandom(15), obj_battlemanager.boxY1).hspeed = 0.25;
                    }
                }
                
                if (tongueAnim == 0 && image_speed == 0 && (attackTime % 40) == 4)
                {
                    var last = -1;
                    var maxInst = instance_number(obj_frogb_fly2) - 1;
                    
                    if (maxInst <= 1)
                        exit;
                    
                    var i = 0;
                    tongueTargetObj = -4;
                    
                    while (tongueTargetObj == -4 || (tongueTargetObj.x + 80) >= obj_battlemanager.boxX2)
                    {
                        var _new = irandom(maxInst);
                        
                        while (_new == last)
                            _new = irandom(maxInst);
                        
                        last = _new;
                        tongueTargetObj = instance_find(obj_frogb_fly2, _new);
                        i++;
                        
                        if (i >= maxInst)
                            exit;
                    }
                    
                    alarm[1] = 5;
                    var inst = instance_create(obj_frogb_warning);
                    inst.follow = tongueTargetObj;
                    tongueTargetObj.sprite_index = spr_frogb_fly_glow;
                }
                else if (tongueAnim == 1)
                {
                    if (!instance_exists(tongueTargetObj))
                    {
                        tongueTargetObj = -4;
                        tongueAnim = 2;
                        tongueStretchMax = tongue.image_yscale;
                    }
                    else
                    {
                        var stretchMax = point_distance(tongue.x, tongue.y, tongueTargetObj.x, tongueTargetObj.y) / 110;
                        tongue.image_yscale = number_approach_smooth(tongue.image_yscale, stretchMax + 0.1, 0.075, 0.11249999999999999);
                        tongue.image_angle = point_direction(tongue.x, tongue.y, tongueTargetObj.x, tongueTargetObj.y) + 90;
                        
                        if (tongue.image_yscale >= stretchMax)
                        {
                            tongueAnim = 2;
                            instance_destroy(tongueTargetObj);
                            tongueTargetObj = -4;
                            tongueStretchMax = tongue.image_yscale;
                        }
                    }
                }
                else if (tongueAnim == 2)
                {
                    tongue.image_yscale -= 0.15 / (4 - clamp((tongueStretchMax - tongue.image_yscale) * 120, 1, 3));
                    
                    if (tongue.image_yscale <= 0.025)
                    {
                        tongueAnim = 0;
                        instance_destroy(tongue);
                        tongue = -4;
                    }
                }
                
                break;
            
            case 4:
                if (attackTime == 1)
                {
                    visible = false;
                    bt_set_boxtype((4 << 0));
                    
                    with (bt_bullet(obj_froggit_jumper, x, y))
                    {
                        if (global.flavor_sprites)
                            image_blend = other.flavorColor;
                    }
                }
                
                break;
            
            case 5:
                if (attackTime == 1)
                {
                    sprite_index = spr_frogpuff;
                    image_speed = 0.18;
                }
                else if (image_speed == 0.18)
                {
                    if ((image_index + image_speed) >= 8)
                    {
                        image_index = 4;
                        obj_battlemanager.attackTimer = 80;
                        
                        for (var i = 0; i < 3; i++)
                        {
                            for (var j = 0; j < 2; j++)
                                bt_bullet(obj_frogb_fly3, x + 20 + (j * 34) + irandom(2), y + 30 + (i * 10) + irandom(8));
                        }
                        
                        image_speed = -1;
                        sfx_play_pitch(snd_buzzplode, 1);
                        view_shake(2, 2);
                        view_flash();
                    }
                }
                else if (image_speed == -1)
                {
                    if (image_index < 1)
                    {
                        image_index = 0;
                        image_speed = 0;
                        sprite_index = spr_froglook;
                    }
                }
                
                break;
            
            case 6:
                if (instance_exists(obj_loox_tripbullet))
                {
                    if ((attackTime % 3) == 1)
                    {
                        with (obj_loox_tripbullet)
                            bt_bullet_attack(obj_frogb_flyloox, 2, x + (sprite_width / 2), y + (sprite_height / 2) + irandom_range(-10, 10));
                    }
                }
                
                break;
        }
        
        break;
    
    case 2:
        if (attackType == 3)
        {
            image_speed = -0.5;
            doReturnAnim = true;
            
            with (obj_froggit_monster)
                attackType = 2;
            
            if (tongue != -4)
            {
                if (instance_exists(tongue))
                    instance_destroy(tongue);
                
                tongue = -4;
                tongueAnim = 0;
            }
        }
        else if (attackType == 4)
        {
            visible = true;
        }
        
        break;
}
