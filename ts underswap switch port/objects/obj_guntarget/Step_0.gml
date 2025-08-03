if (go)
{
    if (selectorVisible)
    {
        if (global.control_confirm_pressed)
        {
            if (currSelector != -4)
            {
                with (currSelector)
                {
                    selectorDone = true;
                    event_user(0);
                }
                
                selectorIndex++;
                
                if (selectorIndex < 2)
                    alarm[0] = 5;
                
                currSelector = -4;
            }
        }
        
        if (selectorIndex > 1 && !damaging)
        {
            damaging = true;
            var mon = obj_battlemanager.monsters[obj_battlemanager.chosenMonster];
            bonusStrength = 0;
            isCrit = true;
            
            if (instance_exists(obj_gunselector))
            {
                with (obj_gunselector)
                {
                    other.damage += damage;
                    other.bonusStrength += bonusStrength;
                    
                    if (!isCrit || instance_number(obj_gunselector) == 1)
                        other.isCrit = false;
                }
            }
            else
            {
                damage = 0;
                bonusStrength = 0;
            }
            
            damage = round(damage / 2);
            bonusStrength = bonusStrength / 2;
            var weirdStretchFactor = (sprite_width - bonusStrength) / sprite_width;
            
            if (damage > 0)
            {
                global.bev_subtype = 0;
                
                with (mon)
                    event_user(4);
                
                var sc = (weirdStretchFactor * 2) - 0.5;
                
                with (bt_attacker())
                {
                    image_xscale = sc;
                    image_yscale = sc;
                    
                    if (setImageSpeed)
                    {
                        image_speed = 0.5 - (weirdStretchFactor * 0.25);
                        
                        if (image_speed <= 0)
                            image_speed = 0.1;
                    }
                    
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
    
    if (fadeIn && !doFade)
    {
        if (image_xscale > 1)
            image_xscale -= 0.06;
        
        image_alpha += 0.08;
        
        if (image_alpha >= 1)
        {
            image_alpha = 1;
            fadeIn = false;
        }
    }
    
    if (doFade)
    {
        image_alpha -= 0.08;
        image_xscale -= 0.06;
        
        if (image_alpha <= 0)
            instance_destroy();
        
        if (instance_exists(obj_gunselector))
        {
            with (obj_gunselector)
                instance_destroy();
        }
    }
}
else
{
    go = !instance_exists(obj_weapon_new);
}
