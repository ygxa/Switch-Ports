switch (global.bev_subtype)
{
    case 0:
        m = obj_moldrick_monster.isActive;
        a = obj_aaxel_monster.isActive;
        n = obj_norman_monster.isActive;
        
        if (!(m || a || n))
        {
            with (obj_battlemanager)
            {
                checkForWin();
                obj_battleheart.canMove = false;
                mainState = (0 << 0);
            }
        }
        else
        {
            attackTime = 0;
            attackDelay = 1;
            attackDelay2 = 1;
            attackStage = 0;
            var isActiveArr = [m && obj_moldrick_monster.angry, a, n];
            var skip = 0;
            var target;
            
            do
                target = irandom(2);
            until (skip++ > 40 || isActiveArr[target]);
            
            if (skip >= 40)
                target = -1;
            
            switch (target)
            {
                case 0:
                    attackType = xchoose(3, 11);
                    break;
                
                case 1:
                    if (obj_aaxel_monster.isSpareable)
                    {
                        attackType = 10;
                    }
                    else
                    {
                        attackType = 4 + xirandom(3);
                        
                        if ((!n && attackType == 4) || (!m && attackType == 7))
                            attackType = 5;
                    }
                    
                    break;
                
                case 2:
                    attackType = xirandom(2);
                    break;
                
                default:
                    attackType = -1;
                    break;
            }
            
            if (attackType == 4)
                obj_battlemanager.attackTimer = 140;
            else if (attackType == 5)
                obj_battlemanager.attackTimer = 180;
            else
                obj_battlemanager.attackTimer = 100;
        }
        
        break;
    
    case 1:
        if (!obj_battlemanager.isBoxMoving)
            attackTime++;
        else if (attackType == 4)
            obj_battlemanager.attackTimer = 139;
        else if (attackType == 5)
            obj_battlemanager.attackTimer = 179;
        else
            obj_battlemanager.attackTimer = 99;
        
        switch (attackType)
        {
            case -1:
                obj_battlemanager.attackTimer = 0;
                break;
            
            case 0:
            case 1:
                whimsunFlyUp();
                
                if (attackType == 0)
                    froggitAttack();
                else if (attackTime == 1)
                    bt_bullet(obj_looxb2, 0, 0, obj_norman_monster);
                
                break;
            
            case 2:
                if (attackTime == 1)
                {
                    var _x = obj_battleheart.x - 6;
                    var _y = obj_battleheart.y + 34;
                    
                    for (var angle = 0; angle < 360; angle += 36)
                    {
                        bt_bullet(obj_whimsunb_flycircle, _x, _y, obj_norman_monster).image_angle = angle;
                        _x += lengthdir_x(20, angle);
                        _y += lengthdir_y(20, angle);
                    }
                }
                
                froggitAttack();
                break;
            
            case 3:
                if (attackTime == 1)
                    obj_battlemanager.attackTimer = 210;
                
                if ((attackTime % 30) == 1)
                {
                    with (obj_moldrick_monster)
                        bt_bullet(obj_moldrickb, (x + 50 + irandom(20)) - 10, ((y - 60) + irandom(10)) - 5);
                }
                
                break;
            
            case 4:
                switch (attackStage)
                {
                    case 0:
                        if (attackTime != 0)
                        {
                            with (obj_norman_monster)
                                x = number_approach_smooth(x, xstart - 190, 0.5, 0.5);
                            
                            with (obj_aaxel_monster)
                            {
                                var targ = obj_norman_monster.xstart - 42;
                                x = number_approach_smooth(x, targ, 0.25, 0.5);
                                sprite_index = spr_aaxel_normanpat;
                                depth = 1;
                                
                                if (x == targ)
                                {
                                    image_speed = 1;
                                    other.attackStage = 1;
                                }
                            }
                        }
                        
                        break;
                    
                    case 1:
                        with (obj_aaxel_monster)
                        {
                            var targ = obj_norman_monster.xstart - 86;
                            
                            if (x != targ)
                                instance_create_xy(x, y, obj_aaxel_afterimage);
                            
                            x = number_approach_smooth(x, targ, 0.8, 0.5);
                        }
                        
                        if (floor(obj_aaxel_monster.image_index) >= 3)
                        {
                            with (obj_aaxel_monster)
                            {
                                image_speed = 0;
                                image_index = 3;
                            }
                            
                            sfx_play(snd_buzzplode);
                            view_shake(2, 2);
                            
                            with (obj_norman_monster)
                            {
                                hitShakeX = x;
                                shakeValue = 8;
                                alarm[9] = 1;
                                
                                for (var i = 0; i < 3; i++)
                                {
                                    for (var j = 0; j < 2; j++)
                                    {
                                        with (bt_bullet(obj_frogb_fly3, x + 36 + (j * 34) + irandom(2), y + 30 + (i * 10) + irandom(8)))
                                        {
                                            vspeed *= 2;
                                            depth = -999;
                                        }
                                    }
                                }
                            }
                            
                            sfx_play(snd_buzzplode);
                            sfx_play(snd_bang);
                            view_flash();
                            attackStage = 2;
                            attackDelay = attackTime + 16;
                        }
                        
                        break;
                    
                    case 2:
                        if (attackTime >= attackDelay)
                            attackStage = 3;
                        
                        break;
                    
                    case 3:
                        whimsunFlyUp();
                        
                        with (obj_aaxel_monster)
                        {
                            sprite_index = spr_aaxel_neutral;
                            x = number_approach_smooth(x, xstart, 0.25, 0.5);
                        }
                        
                        with (obj_norman_monster)
                            x = number_approach_smooth(x, xstart, 0.25, 0.5);
                        
                        break;
                }
                
                break;
            
            case 5:
                switch (attackStage)
                {
                    case 0:
                        with (obj_aaxel_monster)
                        {
                            sprite_index = spr_aaxel_throwglasses;
                            image_speed = 1;
                            
                            if (floor(image_index) >= 4)
                            {
                                image_speed = 0;
                                image_index = 4;
                                bt_bullet_attack(obj_aaxelglasses, 5.25, x + 30, y + 30);
                                other.attackStage = 1;
                                other.attackDelay = other.attackTime + 30;
                            }
                        }
                        
                        break;
                    
                    case 1:
                        if (attackTime >= attackDelay)
                        {
                            with (obj_aaxel_monster)
                            {
                                sprite_index = spr_aaxel_neutral;
                                image_speed = 0;
                            }
                        }
                        
                        if ((attackTime % 18) == 1)
                            bt_bullet(obj_aaxelb, 0, 0, obj_aaxel_monster);
                        
                        break;
                }
                
                break;
            
            case 6:
                if (attackTime == 1)
                {
                    with (obj_aaxel_monster)
                    {
                        visible = false;
                        bt_bullet(obj_aaxel_puncher, x, y);
                    }
                }
                
                break;
            
            case 7:
                if (attackTime == 1)
                {
                    repeat (3)
                    {
                        var centerX = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
                        var centerY = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
                        var left = irandom(1);
                        
                        if (left)
                            bt_bullet(obj_moldrickb_squish, random_range(obj_battlemanager.boxX1 + 20, centerX - 20), random_range(obj_battlemanager.boxY1 + 20, centerY - 20), obj_moldrick_monster).depth = -999;
                        else
                            bt_bullet(obj_moldrickb_squish, random_range(centerX + 20, obj_battlemanager.boxX2 - 20), random_range(centerY + 20, obj_battlemanager.boxY2 - 20), obj_moldrick_monster).depth = -999;
                    }
                }
                else if (attackTime == 30)
                {
                    with (obj_aaxel_monster)
                    {
                        visible = false;
                        bt_bullet(obj_aaxel_puncher, x, y);
                    }
                }
                
                break;
            
            case 10:
                if ((attackTime % 15) == 1)
                    bt_bullet(obj_aaxelb, 0, 0, obj_aaxel_monster);
                
                break;
            
            case 11:
                if (attackTime == 1)
                {
                    var center = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
                    bt_bullet(obj_moldrickb_merge, center - 40, obj_battlemanager.boxY1 - 16, obj_moldrick_monster);
                    bt_bullet(obj_moldrickb_merge, center + 40, obj_battlemanager.boxY1 - 16, obj_moldrick_monster).side = 3;
                    
                    with (obj_moldrickb_merge)
                        self.center = center;
                }
                
                break;
        }
        
        break;
    
    case 2:
        break;
}
