if (selectorVisible)
{
    if (selectorDone)
    {
        selectorIndexCalc += 0.4;
        
        if (selectorIndexCalc & 1)
            selectorSprIndex = 1;
        else
            selectorSprIndex = 0;
        
        if (selectorIndexCalc >= 76)
            selectorIndexCalc = 0;
    }
    else
    {
        if (selectorDir == 3)
        {
            selectorX += selectorSpeed;
            
            if (selectorX > (x + (sprite_width * 0.5)))
            {
                event_user(10);
                exit;
            }
        }
        else
        {
            selectorX -= selectorSpeed;
            
            if (selectorX < (x - (sprite_width * 0.5)))
            {
                event_user(10);
                exit;
            }
        }
        
        if (global.control_confirm_pressed)
        {
            selectorDone = true;
            var mon = obj_battlemanager.monsters[obj_battlemanager.chosenMonster];
            damage = ((global.playerwepat + global.playerat) - mon.defense) + xirandom(2);
            var bonusStrength = abs((selectorX + 7) - x);
            var weirdStretchFactor = (sprite_width - bonusStrength) / sprite_width;
            
            if (bonusStrength <= 12)
            {
                damage = round(damage * 2.2);
                isCrit = true;
            }
            else
            {
                damage = round(damage * weirdStretchFactor * 2);
                isCrit = false;
            }
            
            if (damage > 0)
            {
                global.bev_subtype = 0;
                
                with (mon)
                    event_user(4);
                
                with (bt_attacker())
                {
                    var sc = (weirdStretchFactor * 2) - 0.5;
                    
                    if (object_index == obj_battlepunch)
                    {
                        sc *= 1.7;
                    }
                    else if (setImageSpeed)
                    {
                        image_speed = 0.5 - (weirdStretchFactor * 0.25);
                        
                        if (image_speed <= 0)
                            image_speed = 0.1;
                    }
                    
                    image_xscale = sc;
                    image_yscale = sc;
                    
                    if (other.isCrit)
                        event_user(0);
                }
            }
            else
            {
                event_user(10);
                exit;
            }
        }
    }
}

if (doFade)
{
    image_alpha -= 0.08;
    image_xscale -= 0.12;
    
    if (image_alpha <= 0)
        instance_destroy();
}
