switch (global.bev_subtype)
{
    case 0:
        var dogaressaHere = bt_monster_sum() != 1;
        
        if (vshoot >= 2 || (dogaressaHere && obj_dogaressa_monster.vshoot >= 2) || vfetch >= 2 || (dogaressaHere && obj_dogaressa_monster.vfetch >= 2))
        {
            obj_battlemanager.attackTime = 2;
            attackType = -1;
        }
        else if (vsplashing && dogaressaHere)
        {
            obj_battlemanager.attackTime = 2;
            attackType = -1;
        }
        else if (dogaressaHere)
        {
            var lastAttackType = attackType;
            
            repeat (50)
            {
                attackType = xchoose(0, 2, 3);
                
                if (lastAttackType != attackType)
                    break;
            }
        }
        else
        {
            attackType = 0;
        }
        
        attackVariant = 0;
        counter = 0;
        stage = 0;
        returnX = x;
        returnY = y;
        siner = 0;
        colorSlide = 0;
        returnDepth = depth;
        
        switch (attackType)
        {
            case 0:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((11 << 0));
                
                if (!dogaressaHere)
                    attackVariant = 1;
                
                move_start(30);
                break;
            
            case 1:
                currIndex = 0;
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((12 << 0));
                move_start(30);
                break;
            
            case 2:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((11 << 0));
                
                with (obj_battlemanager)
                    boxTransform = true;
                
                attackVariant = irandom(1);
                move_start(30);
                break;
            
            case 3:
                obj_battlemanager.attackTime = 165;
                bt_set_boxtype((4 << 0));
                
                with (bt_bullet(obj_dogi_jump, ((obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2) - 80))
                {
                    side = -1;
                    image_xscale *= -1;
                }
                
                bt_bullet(obj_dogi_jump, ((obj_battlemanager.boxX1 + obj_battlemanager.boxX2) / 2) + 80);
                break;
        }
        
        break;
    
    case 1:
        switch (attackType)
        {
            case 0:
                switch (stage)
                {
                    case 0:
                        if (move_get_progress() >= 0.5)
                            image_index = 1 + attackVariant;
                        
                        if (move_approach_smooth2(4, 200))
                            stage++;
                        
                        break;
                    
                    case 1:
                        if (obj_battlemanager.attackTimer == 30)
                        {
                            move_start(30);
                            image_index = 0;
                        }
                        else if (obj_battlemanager.attackTimer < 30)
                        {
                            move_approach_smooth2(returnX, returnY);
                        }
                        else if ((obj_battlemanager.attackFrame % 8) == 0)
                        {
                            counter++;
                            
                            if (counter >= 5)
                            {
                                if (counter >= 8)
                                    counter = 0;
                            }
                            else
                            {
                                bt_bullet((attackVariant == 0) ? obj_doginote : obj_doginote_sad, x + 144, y + 56).image_index = currIndex;
                                currIndex = (currIndex + 1) % 3;
                            }
                        }
                        
                        break;
                }
                
                break;
            
            case 1:
                switch (stage)
                {
                    case 0:
                        if (move_get_progress() >= 0.5)
                        {
                            sprite_index = spr_dogamy_splash;
                            image_index = 0.9;
                            image_speed = 1;
                        }
                        
                        if (move_approach_smooth2(40, 200))
                            stage++;
                        
                        break;
                    
                    case 1:
                        if (obj_battlemanager.attackTimer == 30)
                        {
                            move_start(30);
                            sprite_index = spr_dogamy;
                            image_index = 0;
                            image_speed = 0;
                        }
                        else if (obj_battlemanager.attackTimer < 30)
                        {
                            move_approach_smooth2(returnX, returnY);
                        }
                        else if (floor(image_index) == 1 && currIndex != 1)
                        {
                            sfx_play(snd_splash);
                            
                            with (bt_bullet(obj_dogisplash, x + 100, y + 110))
                            {
                                direction = random_range(10, 60);
                                speed = 12;
                            }
                        }
                        
                        currIndex = floor(image_index);
                        break;
                }
                
                break;
            
            case 2:
                colorSlide = number_approach_smooth(colorSlide, 1, 0.1);
                
                switch (stage)
                {
                    case 0:
                        if (move_get_progress() >= 0.5)
                            image_index = 3;
                        
                        if (move_approach_smooth2(90, (attackVariant == 0) ? 230 : 160))
                        {
                            stage++;
                            depth = -100;
                            ystart = y;
                        }
                        
                        break;
                    
                    case 1:
                        if (obj_battlemanager.attackTimer == 30)
                        {
                            move_start(30);
                            image_index = 0;
                            transformable = false;
                        }
                        else if (obj_battlemanager.attackTimer < 30)
                        {
                            move_approach_smooth2(returnX, returnY);
                        }
                        else
                        {
                            if (image_index != 4)
                            {
                                siner += 0.1;
                                y = ystart + (sin(siner) * 20);
                            }
                            
                            if ((obj_battlemanager.attackFrame % 40) == 0)
                            {
                                sfx_play(snd_grab);
                                image_index = 4;
                                transformable = true;
                                
                                with (obj_battlemanager)
                                {
                                    boxSmooth = true;
                                    boxDestY1 += 10;
                                }
                                
                                with (instance_create(obj_boxshaker))
                                    shakeValue = 3;
                                
                                with (bt_bullet(obj_areahitbox, x + 148, y + 112))
                                {
                                    timer = 18;
                                    buffer = 2;
                                    image_xscale = 72;
                                    image_yscale = 20;
                                }
                                
                                with (bt_bullet(obj_areahitbox, x + 212, y + 120))
                                {
                                    timer = 18;
                                    buffer = 2;
                                    image_xscale = 22;
                                    image_yscale = 12;
                                }
                            }
                            else if ((obj_battlemanager.attackFrame % 40) == 20)
                            {
                                image_index = 3;
                                transformable = false;
                            }
                        }
                        
                        break;
                }
                
                break;
        }
        
        break;
    
    case 2:
        x = returnX;
        y = returnY;
        depth = returnDepth;
        transformable = false;
        
        with (obj_battlemanager)
        {
            boxSmooth = false;
            boxTransform = false;
            boxAngle = 0;
            boxTranslateX = 0;
            boxTranslateY = 0;
        }
        
        break;
}
