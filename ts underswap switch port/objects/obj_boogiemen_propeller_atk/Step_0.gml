switch (state)
{
    case 0:
        if (larryActive)
        {
            larDestX = 221;
            larDestY = 379;
            
            with (obj_boogiemen_manager)
                move_to_pos(obj_larry_monster, other.larDestX, other.larDestY);
            
            with (obj_larry_monster)
            {
                forceDrawSelf = true;
                sprite_index = spr_larry_propeller;
                image_speed = 1;
                depth = -1;
            }
            
            obj_battlemanager.hpBarOffset = number_approach_smooth(obj_battlemanager.hpBarOffset, barOffset, 0.5, 0.5);
            var textDest = floor(global.playermaxhp * -1.65) - 46;
            obj_battlemanager.statsHPTextXOffset = number_approach_smooth(obj_battlemanager.statsHPTextXOffset, textDest, 0.5, 0.5);
            obj_battlemanager.statsHPTextYOffset = number_approach_smooth(obj_battlemanager.statsHPTextYOffset, -24, 0.5, 0.5);
        }
        
        if (harryActive)
        {
            harDestX = 231;
            harDestY = 56;
            
            with (obj_boogiemen_manager)
                move_to_pos(obj_harry_monster, other.harDestX, other.harDestY);
            
            with (obj_harry_monster)
            {
                forceDrawSelf = true;
                sprite_index = spr_harry_swipe;
                image_speed = 0;
                image_index = 0;
                depth = -1;
            }
        }
        
        if (step == 15)
        {
            state = 1;
            step = 0;
        }
        
        break;
    
    case 1:
        if (larryActive)
        {
            if (step == 1)
            {
                with (bt_bullet(obj_areahitbox, obj_battlemanager.boxX1, obj_battlemanager.boxY2 - 40))
                {
                    timer = 200;
                    damageAmount = obj_larry_monster.attack;
                    destroy = false;
                    image_xscale = obj_battlemanager.boxX2 - obj_battlemanager.boxX1;
                    image_yscale = 40;
                }
            }
            
            with (obj_larry_monster)
                shake(other.larDestX, other.larDestY, 2);
            
            obj_battleheart.y -= pushIntensity;
            
            if (obj_battleheart.y < (obj_battlemanager.boxY1 + 5))
                obj_battleheart.y = obj_battlemanager.boxY1 + 5;
            
            if ((step % 5) == 0)
            {
                if (pushIntensity < 3)
                    pushIntensity += 0.2;
                
                instance_create_xy(random_range(obj_battlemanager.boxX1, obj_battlemanager.boxX2), obj_larry_monster.y - 30, obj_pushline);
            }
            
            var bulletRate = 55;
            
            with (obj_larry_monster)
                bulletRate -= floor(atkSpeed * 10);
            
            if ((step % bulletRate) == 0 && wantHats)
            {
                with (bt_bullet(obj_flying_bul, 660, irandom_range(obj_battlemanager.boxY1 + 20, obj_battlemanager.boxY2 - 40)))
                {
                    direction = 180;
                    sprite_index = spr_flying_hat;
                    damageAmount = obj_larry_monster.attack;
                    
                    if (other.makeHeal)
                    {
                        if (random(1) < 0.1)
                        {
                            damageAmount *= -1;
                            image_blend = c_lime;
                        }
                    }
                }
            }
        }
        
        if (harryActive)
        {
            if (step == 1)
            {
                warnSwipe = true;
                alarm[0] = 30;
            }
            
            var bulletRate = 55;
            
            with (obj_harry_monster)
                bulletRate -= floor(atkSpeed * 10);
            
            if ((step % bulletRate) == 0)
            {
                with (bt_bullet(obj_flying_bul, -20, irandom_range(obj_battlemanager.boxY1 + 20, obj_battlemanager.boxY2 - 40)))
                {
                    direction = 0;
                    sprite_index = (irandom(500) == 499) ? spr_everyman_bul_fly : spr_flying_duck;
                    damageAmount = obj_harry_monster.attack;
                    
                    if (other.makeHeal)
                    {
                        if (random(1) < 0.1)
                        {
                            damageAmount *= -1;
                            image_blend = c_lime;
                        }
                    }
                }
            }
        }
        
        if (step == 210)
        {
            state = 2;
            step = 0;
        }
        
        break;
    
    case 2:
        with (obj_pushline)
            instance_destroy();
        
        with (obj_flying_bul)
            instance_destroy();
        
        with (obj_person_bul)
            instance_destroy();
        
        with (obj_person_spinbul)
            instance_destroy();
        
        with (obj_banana_bul)
            instance_destroy();
        
        with (obj_boogiemen_banana_atk)
            instance_destroy();
        
        with (obj_fishfood_bul)
            instance_destroy();
        
        bt_set_boxtype((1 << 0));
        
        if (larryActive)
        {
            larDestX = obj_larry_monster.xstart;
            larDestY = obj_larry_monster.ystart;
            
            with (obj_boogiemen_manager)
                move_to_pos(obj_larry_monster, other.larDestX, other.larDestY);
            
            obj_battlemanager.hpBarOffset = number_approach_smooth(obj_battlemanager.hpBarOffset, 0, 0.5, 0.5);
            obj_battlemanager.statsHPTextXOffset = number_approach_smooth(obj_battlemanager.statsHPTextXOffset, 0, 0.5, 0.5);
            obj_battlemanager.statsHPTextYOffset = number_approach_smooth(obj_battlemanager.statsHPTextYOffset, 0, 0.5, 0.5);
        }
        
        if (harryActive)
        {
            alarm[0] = 0;
            harDestX = obj_harry_monster.xstart;
            harDestY = obj_harry_monster.ystart;
            
            with (obj_boogiemen_manager)
                move_to_pos(obj_harry_monster, other.harDestX, other.harDestY);
            
            with (obj_harry_monster)
            {
                forceDrawSelf = false;
                sprite_index = spr_harry_hurt;
                image_speed = 0;
                image_index = 0;
            }
        }
        
        if (step == 12)
        {
            state = 3;
            step = 0;
        }
        
        break;
    
    case 3:
        if (larryActive)
        {
            with (obj_larry_monster)
            {
                forceDrawSelf = false;
                sprite_index = spr_larry_hurt;
                image_speed = 0;
                image_index = 0;
            }
        }
        
        break;
}

step++;
