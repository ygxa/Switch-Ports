switch (global.bev_subtype)
{
    case 0:
        attackTime = 0;
        attackType = xirandom(1);
        attackStage = 0;
        break;
    
    case 1:
        if (obj_battlemanager.isBoxMoving)
            obj_battlemanager.attackTimer = 99;
        else
            attackTime++;
        
        switch (attackType)
        {
            case 0:
                if ((attackTime % 25) == 1)
                {
                    with (bt_bullet(obj_butchyb, ((attackTime % 50) == 1) ? irandom_range(obj_battlemanager.boxX1 + 8, obj_battlemanager.boxX1 + 70) : irandom_range(obj_battlemanager.boxX2 - 70, obj_battlemanager.boxX2 - 30), obj_battlemanager.boxY1))
                    {
                        bodyIndex = 0;
                        event_user(2);
                    }
                }
                
                break;
            
            case 1:
                switch (attackStage)
                {
                    case 0:
                        if (attackTime == 1)
                        {
                            obj_battlemanager.attackTimer = 159;
                            xstart = x;
                            ystart = y;
                            sfx_play(snd_butchyspeed);
                        }
                        else
                        {
                            x = (xstart + irandom(2)) - 1;
                            y = (ystart + irandom(2)) - 1;
                            
                            if (attackTime >= 40)
                                attackStage = 1;
                            else if ((attackTime % 5) == 1)
                                instance_create_xy(x + irandom(126), y + 20 + irandom(10), obj_butchy_smoke);
                        }
                        
                        break;
                    
                    case 1:
                        x -= 20;
                        
                        if (attackTime >= 70)
                        {
                            y = irandom_range(obj_battlemanager.boxY1 - 20, obj_battlemanager.boxY2 - 80);
                            attackStage = 2;
                            
                            if (irandom(19) == 0)
                                sfx_play(snd_butchyhjonk);
                        }
                        else if ((attackTime % 2) == 1)
                        {
                            instance_create_xy(x + 126, y + 80, obj_butchy_smoke);
                        }
                        
                        break;
                    
                    case 2:
                        if (attackTime >= 90)
                        {
                            if (!audio_is_playing(snd_butchyhjonk))
                                sfx_play(snd_butchydrive);
                            
                            image_xscale = -2;
                            attackStage = 3;
                            headlightAlpha = 0;
                            bt_bullet(obj_butchy_hitbox, x, y);
                            sfx_play(snd_throw);
                        }
                        
                        break;
                    
                    case 3:
                        x += 18;
                        
                        if (x >= obj_battlemanager.boxX2)
                            x += floor((x - obj_battlemanager.boxX2) * 0.05);
                        
                        obj_butchy_hitbox.x = x;
                        
                        if ((attackTime % 2) == 1)
                            instance_create_xy(x - 126, y + 80, obj_butchy_smoke);
                        
                        if (headlightAlpha < 0.8)
                            headlightAlpha += 0.02;
                        
                        break;
                }
                
                break;
        }
        
        break;
    
    case 2:
        if (attackType == 1)
        {
            x = 640;
            y = ystart;
            image_xscale = 2;
            alarm[1] = 1;
            instance_destroy(obj_butchy_hitbox);
            attackStage = 0;
        }
        
        attackType = -1;
        break;
}
