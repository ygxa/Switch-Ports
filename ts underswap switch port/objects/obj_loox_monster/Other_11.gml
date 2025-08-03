switch (global.bev_subtype)
{
    case 0:
        bulletSide = 0;
        attackTime = 0;
        
        if (attackType == -1)
            attackType = xirandom(3);
        
        attackStage = 0;
        isVegetoid = instance_exists(obj_vegetoid_monster) && obj_battlemanager.monsters[!monsterIndex].object_index == obj_vegetoid_monster && obj_battlemanager.monsters[!monsterIndex].isActive;
        
        if (isVegetoid && obj_vegetoid_monster.attackType == 4)
        {
            attackType = -1;
            needToCenter = true;
            break;
        }
        
        needToCenter = x != 256;
        isOtherLoox = instance_number(obj_loox_monster) == 2 && obj_battlemanager.monsters[!monsterIndex].isActive;
        
        if (isOtherLoox)
            otherLoox = obj_battlemanager.monsters[!monsterIndex];
        
        if (!isVegetoid)
            attackType = xirandom(2);
        else
            obj_battlemanager.attackTimer = 160;
        
        if (vdocombostare)
        {
            vdocombostare = false;
            attackType = 5;
            otherLoox.attackType = 5;
            obj_battlemanager.attackTimer = 160;
        }
        else if (isOtherLoox)
        {
            if (monsterIndex == 0)
                attackType = 2;
            else
                attackType = 1;
        }
        else if (!needToCenter && attackType <= 1)
        {
            attackType = xchoose(4, 6);
        }
        else if (global.battle_id == 12 && xirandom(2) == 0)
        {
            attackType = 7;
        }
        
        break;
    
    case 1:
        if (obj_battlemanager.isBoxMoving)
            obj_battlemanager.attackTimer = (attackType == 3) ? 160 : 99;
        
        if (attackType != 3)
            attackTime++;
        
        if (attackType != -1 && (attackType <= 1 || attackType == 7))
        {
            var dist = point_distance(x, y, 256, 128);
            
            if (dist <= 2)
            {
                speed = 0;
                x = 256;
                y = 128;
                
                if (attackType == 7)
                {
                    attackType = 6;
                    attackTime = 0;
                    obj_battlemanager.attackTimer = 120;
                }
                else
                {
                    attackType = 4;
                }
            }
            else
            {
                direction = point_direction(x, y, 256, 128);
                speed = dist * 0.25;
            }
        }
        else if (attackType == 2)
        {
            if (instance_exists(obj_looxb2))
            {
                attackType = -1;
                break;
            }
            
            if (attackTime == 1)
            {
                var bullet = bt_bullet(obj_looxb2);
                
                if ((instance_number(obj_monster_parent) != 1 && obj_battlemanager.monsters[!monsterIndex].isActive) || (obj_battlemanager.monsters[2] != -4 && obj_battlemanager.monsters[2].object_index == obj_migosp_monster && obj_battlemanager.monsters[2].attackType <= 1))
                {
                    if (overrideSmallRing)
                    {
                        overrideSmallRing = false;
                    }
                    else
                    {
                        bullet.image_xscale = 1.5;
                        bullet.image_yscale = 1.5;
                    }
                }
            }
        }
        else if (attackType == 3)
        {
            switch (attackStage)
            {
                case 0:
                    sprite_index = spr_looxbite;
                    image_index = 0;
                    image_speed = 0.75;
                    attackStage = 1;
                    break;
                
                case 1:
                    if (floor(image_index) == 2)
                    {
                        image_speed = 0;
                        attackStage = 2;
                    }
                    
                    break;
                
                case 2:
                    var targX = obj_vegetoid_monster.x + 46;
                    var dist = point_distance(x, y, targX, 128);
                    
                    if (dist <= 2)
                    {
                        speed = 0;
                        x = targX;
                        y = 128;
                        attackStage = 3;
                        image_speed = 0.75;
                    }
                    else
                    {
                        direction = point_direction(x, y, targX, 128);
                        speed = dist * 0.35;
                    }
                    
                    break;
                
                case 3:
                    if (floor(image_index) == 4)
                    {
                        image_speed = 0;
                        attackStage = 4;
                        sfx_play(snd_click);
                        sfx_play(snd_vegetoidhurt);
                        obj_vegetoid_monster.sprite_index = spr_vegetoidbite;
                    }
                    
                    break;
                
                case 4:
                    attackTime++;
                    
                    if (attackTime >= 10)
                    {
                        y = ystart;
                        image_index = 5;
                        attackStage = 5;
                    }
                    else
                    {
                        y = ystart + irandom_range(-2, 2);
                    }
                    
                    break;
                
                case 5:
                    var dist = point_distance(x, y, 256, 128);
                    
                    if (dist <= 2)
                    {
                        speed = 0;
                        x = 256;
                        y = 128;
                        attackStage = 6;
                        image_speed = 0.75;
                    }
                    else
                    {
                        direction = point_direction(x, y, 256, 128);
                        speed = dist * 0.5;
                    }
                    
                    break;
                
                case 6:
                    var i = floor(image_index);
                    attackTime++;
                    
                    if (i == 6 || i == 8)
                    {
                        if ((attackTime % 3) == 0)
                        {
                            sfx_play(snd_click, 6, false);
                            var bullet = bt_bullet(obj_looxbv, x + ((i == 6) ? 76 : 50), y + 60);
                            
                            if (instance_exists(obj_migospb_target))
                            {
                                with (bullet)
                                    direction = point_direction(x, y, obj_migospb_target.x, obj_migospb_target.y);
                            }
                            
                            if ((attackTime % 9) == 0 && instance_exists(obj_vegetoid_monster) && obj_vegetoid_monster.attackType == 2)
                            {
                                bullet.damageAmount *= -1;
                                bullet.image_blend = c_lime;
                            }
                        }
                    }
                    else if (i == 9)
                    {
                        image_speed = 0;
                        attackStage = 7;
                        doReturnAnim = true;
                    }
                    
                    break;
            }
        }
        else if (attackType == 4)
        {
            if ((attackTime % ((instance_exists(obj_vegroot) || instance_exists(obj_veggun)) ? 32 : 12)) == 0)
            {
                var bullet = bt_bullet(obj_looxb, x + 60, y + 44);
                
                if ((bulletSide++ % 2) == 0)
                {
                    with (bullet)
                    {
                        dir = 3;
                        direction = internalDirection - 180;
                        targetDirection = random_range(30, 80);
                        x += 16;
                        image_angle = direction + 90;
                    }
                }
                else
                {
                    with (bullet)
                    {
                        dir = 2;
                        direction = internalDirection;
                        targetDirection = random_range(290, 340);
                        x -= 16;
                        image_angle = direction + 90;
                    }
                }
                
                sprite_index = (attackTime >= 80) ? spr_looxstare2 : spr_looxstare1;
            }
        }
        else if (attackType == 5)
        {
            switch (attackStage)
            {
                case 0:
                    sprite_index = spr_loox_turn;
                    
                    if (attackTime == 20)
                        attackStage = 1;
                    
                    break;
                
                case 1:
                    if (x > (room_width / 2))
                        sprite_index = spr_looxlookleft;
                    else
                        sprite_index = spr_looxlookright;
                    
                    image_index = 0;
                    
                    if (attackTime == 50)
                        attackStage = 2;
                    
                    break;
                
                case 2:
                    if ((attackTime % 10) == 0)
                    {
                        var bullet = bt_bullet(obj_looxb, x + 60, y + 44);
                        
                        if ((attackTime % 20) == 0)
                        {
                            with (bullet)
                            {
                                dir = 3;
                                direction = internalDirection - 180;
                                targetDirection = random_range(60, 120);
                                x += 16;
                                image_angle = direction + 90;
                            }
                        }
                        else
                        {
                            with (bullet)
                            {
                                dir = 2;
                                direction = internalDirection;
                                targetDirection = random_range(240, 320);
                                x -= 16;
                                image_angle = direction + 90;
                            }
                        }
                    }
                    
                    image_index = (attackTime >= 120) ? 2 : 1;
                    break;
            }
        }
        else if (attackType == 6)
        {
            if (attackTime == 1)
                bt_bullet_attack(obj_loox_tripbullet, 6, x, y).image_blend = image_blend;
        }
        
        break;
    
    case 2:
        if (attackType == 3)
            obj_vegetoid_monster.sprite_index = spr_vegetoid;
        else if (attackType == 4)
            sprite_index = spr_loox;
        
        if ((needToCenter && x != xstart) || attackType == 5)
            doReturnAnim = true;
        
        attackType = -1;
        break;
}
