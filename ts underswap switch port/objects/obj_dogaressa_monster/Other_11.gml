switch (global.bev_subtype)
{
    case 0:
        if (bt_monster_sum() != 1)
        {
            attackType = obj_dogamy_monster.attackType;
            attackVariant = obj_dogamy_monster.attackVariant;
        }
        else
        {
            attackType = 2;
            attackVariant = 2;
        }
        
        stage = 0;
        returnX = x;
        returnY = y;
        returnDepth = depth;
        siner = 0;
        
        switch (attackType)
        {
            case 0:
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((11 << 0));
                move_start(30);
                break;
            
            case 1:
                currIndex = 0;
                move_start(30);
                break;
            
            case 2:
                move_start(30);
                obj_battlemanager.attackTime = 180;
                bt_set_boxtype((attackVariant == 2) ? (13 << 0) : (11 << 0));
                
                with (obj_battlemanager)
                    boxTransform = true;
                
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
                            image_index = 1;
                        
                        if (move_approach_smooth2(394, 200))
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
                        
                        break;
                }
                
                break;
            
            case 1:
                switch (stage)
                {
                    case 0:
                        if (move_get_progress() >= 0.5)
                        {
                            sprite_index = spr_dogaressa_splash;
                            image_index = 0.5;
                            image_speed = 1;
                        }
                        
                        if (move_approach_smooth2(434, 200))
                            stage++;
                        
                        break;
                    
                    case 1:
                        if (obj_battlemanager.attackTimer == 30)
                        {
                            move_start(30);
                            sprite_index = spr_dogaressa;
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
                            
                            with (bt_bullet(obj_dogisplash, x + 20, y + 110))
                            {
                                direction = random_range(120, 170);
                                speed = 12;
                                image_xscale *= -1;
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
                            image_index = 2;
                        
                        var height;
                        
                        switch (attackVariant)
                        {
                            case 0:
                                height = 160;
                                break;
                            
                            case 1:
                                height = 230;
                                break;
                            
                            default:
                                height = 200;
                                break;
                        }
                        
                        var _x = 314;
                        
                        if (attackVariant == 2)
                            _x -= 20;
                        
                        if (move_approach_smooth2(_x, height))
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
                            transformable = false;
                            image_index = 0;
                        }
                        else if (obj_battlemanager.attackTimer < 30)
                        {
                            move_approach_smooth2(returnX, returnY);
                        }
                        else
                        {
                            if (image_index != 3)
                            {
                                siner += ((attackVariant == 2) ? 0.12 : 0.08);
                                y = ystart + (sin(siner) * ((attackVariant == 2) ? 40 : 20));
                            }
                            
                            var rate1, rate2;
                            
                            if (attackVariant == 2)
                            {
                                rate1 = 18;
                                rate2 = 16;
                            }
                            else
                            {
                                rate1 = 40;
                                rate2 = 30;
                            }
                            
                            if ((obj_battlemanager.attackFrame % rate1) == 10)
                            {
                                sfx_play(snd_grab);
                                image_index = 3;
                                transformable = true;
                                
                                with (obj_battlemanager)
                                {
                                    boxSmooth = true;
                                    boxDestY1 += ((other.attackVariant == 2) ? 18 : 10);
                                }
                                
                                with (instance_create(obj_boxshaker))
                                    shakeValue = 3;
                                
                                with (bt_bullet(obj_areahitbox, x + 20, y + 114))
                                {
                                    timer = rate2 - 10;
                                    buffer = 2;
                                    image_xscale = 56;
                                    image_yscale = 24;
                                }
                                
                                with (bt_bullet(obj_areahitbox, x + 6, y + 128))
                                {
                                    timer = rate2 - 10;
                                    buffer = 2;
                                    image_xscale = 16;
                                    image_yscale = 10;
                                }
                            }
                            else if ((obj_battlemanager.attackFrame % rate1) == rate2)
                            {
                                image_index = 2;
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
