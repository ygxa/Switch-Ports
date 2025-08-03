switch (global.bev_subtype)
{
    case 0:
        if (died)
        {
            attackType = -1;
        }
        else if (vsawdead)
        {
            attackType = -2;
        }
        else if (vdotomato && !isRuth)
        {
            attackType = 9;
            vheckledid = false;
        }
        else if ((vposedid || vheckledid) && vflirt == 4 && !didPause)
        {
            attackType = 8;
            vflirtdid = false;
            vposedid = false;
            didPause = true;
        }
        else if (ds_list_size(availableAttacks) > 0)
        {
            attackType = ds_list_find_value(availableAttacks, 0);
            ds_list_delete(availableAttacks, 0);
        }
        else
        {
            attackType = xirandom(2);
        }
        
        attackTime = 0;
        attackStage = 0;
        stageTime = 0;
        cloth = -4;
        attackChoice = xirandom(2);
        
        if (isRuth && attackType == 1)
            attackStage = 0;
        
        if (attackType == 0)
        {
            bt_set_boxtype((7 << 0));
            alarm[2] = 1;
        }
        
        break;
    
    case 1:
        if (obj_battlemanager.isBoxMoving)
            obj_battlemanager.attackTimer = 99;
        else
            attackTime++;
        
        if (attackType == -2)
        {
            obj_battlemanager.attackTimer = 0;
        }
        else if (attackType == 0)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 180;
                var i = 0;
                
                repeat (4)
                {
                    bt_bullet(obj_metb_umbrella, obj_battlemanager.boxX2 + 20, -10 - (i * 30)).side = 1;
                    bt_bullet(obj_metb_umbrella, obj_battlemanager.boxX1 - 20, -10 - (i * 30));
                    i++;
                }
                
                if (isRuth)
                {
                    i = 7;
                    
                    repeat (2)
                    {
                        bt_bullet(obj_metb_umbrella, obj_battlemanager.boxX2 + 20, -10 - (i * 30)).side = 1;
                        bt_bullet(obj_metb_umbrella, obj_battlemanager.boxX1 - 20, -10 - (i * 30));
                        i++;
                    }
                }
            }
        }
        else if (attackType == 1)
        {
            stageTime++;
            
            switch (attackStage)
            {
                case 0:
                    if (stageTime == 1)
                    {
                        pose = true;
                        path_end();
                        face = spr_metfaceb_happy_right;
                        rightHand.image_angle = 0;
                        rightHand.destX = initX - 100;
                        rightHand.destY = initY;
                        rightHand.sprite_index = spr_mett_hand_openl;
                        leftHand.image_angle = 0;
                        leftHand.destX = initX - 66;
                        leftHand.destY = initY + 4;
                        leftHand.sprite_index = spr_mett_hand_pinchr;
                        leftHand.depth = rightHand.depth;
                    }
                    
                    if (stageTime == 40)
                    {
                        attackStage = 1;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 1:
                    if (stageTime == 1)
                    {
                        handSpeed = 0.5;
                        leftHand.image_angle = 0;
                        leftHand.destX = initX - 50;
                        leftHand.destY = initY;
                        leftHand.sprite_index = spr_mett_hand_pinchr_cloth;
                    }
                    
                    if (leftHand.x == leftHand.destX)
                    {
                        attackStage = 1.5;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 1.5:
                    if (stageTime == 1)
                    {
                        handSpeed = 0.5;
                        face = spr_metfaceb_happy;
                        leftHand.destX = obj_battlemanager.boxX2 - 8;
                        leftHand.destY = obj_battlemanager.boxY1 - 38;
                        leftHand.sprite_index = spr_mett_hand_pinchr_cloth_fall;
                        leftHand.forceDrawSelf = true;
                        rightHand.destX = obj_battlemanager.boxX1 + 4;
                        rightHand.destY = obj_battlemanager.boxY1 - 38;
                        rightHand.sprite_index = spr_mett_hand_pinchl;
                    }
                    
                    if (rightHand.x == rightHand.destX && leftHand.x == leftHand.destX)
                    {
                        attackStage = 2;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 2:
                    if (stageTime == 1)
                    {
                        leftHand.destX = obj_battlemanager.boxX2 + 8;
                        rightHand.destX = obj_battlemanager.boxX1 - 8;
                        leftHand.sprite_index = spr_mett_hand_pinchr;
                        leftHand.forceDrawSelf = false;
                        cloth = instance_create_xy(obj_battlemanager.boxX1, obj_battlemanager.boxY1 - 20, obj_mett_boxcloth);
                        leftHand.depth = cloth.depth - 1;
                        rightHand.depth = cloth.depth - 1;
                    }
                    
                    if (leftHand.destY < obj_battlemanager.boxY2)
                    {
                        leftHand.destY += 3.5;
                        rightHand.destY += 3.5;
                    }
                    else
                    {
                        cloth.image_index = 9;
                        attackStage = 3;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 3:
                    if (stageTime == 1)
                    {
                        rightHand.image_angle = 0;
                        rightHand.destX = initX - 90;
                        rightHand.destY = initY - 14;
                        rightHand.sprite_index = spr_mett_hand_waver;
                        leftHand.image_angle = 0;
                        leftHand.destX = initX + 80;
                        leftHand.destY = initY - 14;
                        leftHand.sprite_index = spr_mett_hand_wave;
                    }
                    
                    if (stageTime == 30)
                    {
                        face = spr_metfaceb_hurt;
                        rightHand.sprite_index = spr_mett_hand_vibecheckr;
                        leftHand.sprite_index = spr_mett_hand_vibecheck;
                        var midBoxX = (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2;
                        var midBoxY = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
                        var i = 0;
                        
                        repeat (2)
                        {
                            var star = instance_create_xy(rightHand.x + (i * 10), rightHand.y, obj_mettwink_star);
                            star.image_index = i;
                            star.direction = point_direction(star.x, star.y, midBoxX, midBoxY);
                            star = instance_create_xy(leftHand.x - (i * 10), leftHand.y, obj_mettwink_star);
                            star.image_index = i;
                            star.direction = point_direction(star.x, star.y, midBoxX, midBoxY);
                            i++;
                        }
                        
                        sfx_play(snd_sparkle);
                    }
                    
                    if (stageTime == 60)
                    {
                        rightHand.sprite_index = spr_mett_hand_waver;
                        leftHand.sprite_index = spr_mett_hand_wave;
                        attackStage = 3.1;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 3.1:
                    if (stageTime == 1)
                    {
                        face = spr_metfaceb_happy;
                        leftHand.image_angle = 0;
                        leftHand.destX = obj_battlemanager.boxX2 - 30;
                        leftHand.destY = obj_battlemanager.boxY1 - 10;
                        leftHand.sprite_index = spr_mett_hand_vibecheck;
                    }
                    
                    if (stageTime == 10)
                    {
                        leftHand.sprite_index = spr_mett_hand_grab;
                        cloth.image_index = 10;
                    }
                    
                    if (stageTime == 30)
                        sfx_play(snd_drumroll, 80, false);
                    
                    if (stageTime == 60)
                        cloth.image_index = 11;
                    
                    if (stageTime == 62)
                    {
                        leftHand.visible = false;
                        leftHand.destX = cloth.x + 228;
                        leftHand.destY = cloth.y - 130;
                        leftHand.sprite_index = spr_mett_hand_holdcloth;
                        cloth.image_index = 12;
                    }
                    
                    if (stageTime == 64)
                    {
                        with (cloth)
                            instance_destroy();
                        
                        leftHand.visible = true;
                        attackTime = 1;
                    }
                    
                    if (stageTime == 80)
                    {
                        with (instance_create_xy(leftHand.x, leftHand.y, obj_metb_notesmall))
                        {
                            sprite_index = spr_mett_clothfall;
                            gravity = 1;
                            image_xscale = 2;
                            image_yscale = 2;
                            image_blend = other.image_blend;
                        }
                        
                        leftHand.sprite_index = spr_mett_hand_wave;
                        attackStage = 4;
                        attackTime = 0;
                        stageTime = 0;
                    }
                    
                    break;
                
                case 4:
                    face = spr_metfaceb_surprise;
                    event_user(13);
                    attackStage = 5;
                    stageTime = 0;
                    break;
            }
            
            if (obj_battlemanager.isBoxMoving || attackStage != 5)
                obj_battlemanager.attackTimer = 99;
            else
                attackTime++;
            
            if ((attackStage == 3.1 && stageTime == 64) || attackStage >= 4)
            {
                switch (attackChoice)
                {
                    case 0:
                        if (attackTime == 1)
                            obj_battlemanager.attackTimer = 179;
                        
                        if ((attackTime % 45) == 1)
                        {
                            with (bt_bullet(obj_veggun))
                            {
                                image_xscale = 0.25;
                                var counter = 0;
                                
                                do
                                {
                                    if (instance_exists(obj_migospb_target))
                                    {
                                        x = obj_migospb_target.x;
                                        
                                        if (x > (obj_battlemanager.boxX2 - 62))
                                            x = obj_battlemanager.boxX2 - 62;
                                        else if (x < (obj_battlemanager.boxX1 + 30))
                                            x = obj_battlemanager.boxX1 + 30;
                                        
                                        scaleMult = 0.5;
                                    }
                                    else
                                    {
                                        x = obj_battlemanager.boxX1 + 30 + irandom(obj_battlemanager.boxX2 - obj_battlemanager.boxX1 - 62);
                                    }
                                    
                                    y = obj_battlemanager.boxY2 - 5;
                                    image_yscale = -0.25;
                                    
                                    if (++counter >= 50)
                                        break;
                                }
                                until (!place_meeting(x, y, obj_veggun));
                            }
                        }
                        
                        break;
                    
                    case 1:
                        if (attackTime == 1)
                        {
                            obj_battlemanager.attackTimer = 99;
                            
                            repeat (3)
                                bt_bullet(obj_migospb_roach, irandom(obj_battlemanager.boxX2 - obj_battlemanager.boxX1) + obj_battlemanager.boxX1, choose(obj_battlemanager.boxY1, obj_battlemanager.boxY2));
                        }
                        
                        break;
                    
                    case 2:
                        if (attackTime == 1)
                            obj_battlemanager.attackTimer = 99;
                        
                        if ((attackTime % 25) == 1)
                        {
                            with (bt_bullet(obj_butchyb, ((attackTime % 50) == 1) ? irandom_range(obj_battlemanager.boxX1 + 8, obj_battlemanager.boxX1 + 70) : irandom_range(obj_battlemanager.boxX2 - 70, obj_battlemanager.boxX2 - 30), obj_battlemanager.boxY1))
                            {
                                bodyIndex = 0;
                                event_user(2);
                            }
                        }
                        
                        break;
                    
                    case -1:
                        if (attackTime == 1)
                            music_pause_current();
                        
                        if (obj_battlemanager.attackTimer == 1)
                            music_resume_current();
                        
                        break;
                }
            }
        }
        else if (attackType == 2)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 180;
                event_user(10);
            }
            
            var rate = isRuth ? 18 : 25;
            
            if ((attackTime % rate) == 1 && attackTime >= rate)
            {
                with (leftHand)
                {
                    image_index = 1;
                    alarm[0] = 10;
                }
                
                with (rightHand)
                {
                    image_index = 1;
                    alarm[0] = 10;
                }
                
                with (bt_bullet(obj_metb_heart, leftHand.x, leftHand.y))
                {
                    depth = other.leftHand.depth - 1;
                    speed = 5;
                    direction = point_direction(x, y, obj_battleheart.x + 10, obj_battleheart.y + 10);
                    
                    with (bt_bullet_attack(obj_metb_umbrella, damageAmount, x + 16, y))
                    {
                        self.side = 1;
                        direction = other.direction + 24;
                        speed = 4;
                        actuallySing = false;
                    }
                    
                    with (bt_bullet_attack(obj_metb_umbrella, damageAmount, x - 16, y))
                    {
                        direction = other.direction - 24;
                        speed = 4;
                        actuallySing = obj_mettalot_monster.isRuth;
                    }
                }
            }
        }
        else if (attackType == 8)
        {
            if (attackTime == 1)
            {
                obj_battlemanager.attackTimer = 180;
                bt_bullet(obj_metb_dramatic, (obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2, (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2);
            }
        }
        else if (attackType == 9)
        {
            if (attackTime == 1)
                obj_battlemanager.attackTimer = 180;
            
            if ((attackTime % 20) == 1)
            {
                var bulletY = obj_battleheart.y + 32;
                var side = irandom(1);
                var bullet;
                
                if (side)
                    bullet = bt_bullet(obj_metb_projectile, obj_battlemanager.boxX1 - (20 - irandom(12)), bulletY);
                else
                    bullet = bt_bullet(obj_metb_projectile, obj_battlemanager.boxX2 + (20 + irandom(12)), bulletY);
                
                if (instance_exists(bullet))
                {
                    with (bullet)
                        move_towards_point(obj_battleheart.x, obj_battleheart.y - 24, 8);
                }
            }
        }
        
        break;
    
    case 2:
        if (attackType == 0)
        {
            leaning = false;
            bobbing = true;
            sprite_index = spr_mett_body;
            event_user(12);
        }
        else if (attackType == 1 || attackType == 2 || attackType == 8)
        {
            event_user(12);
        }
        
        attackType = -1;
        
        if (!vsawdead)
            face = spr_metfaceb_happy;
        
        vflirtdid = false;
        vheckledid = false;
        vposedid = false;
        vdotomato = false;
        vcheckdid = false;
        break;
}
