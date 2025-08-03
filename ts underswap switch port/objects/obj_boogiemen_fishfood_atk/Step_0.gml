switch (state)
{
    case 0:
        if (larryActive)
        {
            with (obj_larry_monster)
            {
                hspeed = 30;
                depth = -1;
            }
            
            obj_battlemanager.hpBarOffset = number_approach_smooth(obj_battlemanager.hpBarOffset, 180, 0.5, 0.5);
            var textDest = floor(global.playermaxhp * -1.65) - 42;
            obj_battlemanager.statsHPTextXOffset = number_approach_smooth(obj_battlemanager.statsHPTextXOffset, textDest, 0.5, 0.5);
            obj_battlemanager.statsHPTextYOffset = number_approach_smooth(obj_battlemanager.statsHPTextYOffset, -20, 0.5, 0.5);
        }
        
        if (harryActive)
        {
            if (step == 0)
                harHand = bt_bullet(obj_harry_shakerhand_bul, 370, 218, obj_harry_monster);
            
            harDestX = 230;
            harDestY = 138;
            
            with (obj_boogiemen_manager)
                move_to_pos(obj_harry_monster, other.harDestX, other.harDestY);
            
            with (obj_harry_monster)
            {
                forceDrawSelf = true;
                sprite_index = spr_harry_feed;
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
                with (obj_larry_monster)
                {
                    forceDrawSelf = true;
                    y = 402;
                    sprite_index = spr_larry_eat;
                }
                
                larBob = true;
            }
            
            with (obj_larry_monster)
                x = number_approach_smooth(x, obj_battleheart.x - 20 - (sprite_width / 2), 0.5, 0.5);
        }
        
        if (harryActive)
        {
            if (step == 1)
            {
                with (harHand)
                    event_user(2);
            }
            
            with (obj_harry_monster)
            {
                if (point_distance(obj_battleheart.x - sprite_width, obj_harry_monster.y, obj_harry_monster.x, obj_harry_monster.y) > 2)
                {
                    if (sprite_index == spr_harry_feed)
                        move_towards_point(obj_battleheart.x - sprite_width, obj_harry_monster.y, 2);
                    else
                        obj_harry_monster.speed = 0;
                }
                else
                {
                    obj_harry_monster.speed = 0;
                }
            }
        }
        
        if (step == 210)
        {
            state = 2;
            step = 0;
            
            with (obj_speechbubble)
                instance_destroy();
        }
        
        break;
    
    case 2:
        if (larryActive)
        {
            larDestX = obj_larry_monster.xstart;
            larDestY = obj_larry_monster.ystart;
            
            with (obj_larry_monster)
                hspeed = 30;
            
            obj_battlemanager.hpBarOffset = number_approach_smooth(obj_battlemanager.hpBarOffset, 0, 0.5, 0.5);
            obj_battlemanager.statsHPTextXOffset = number_approach_smooth(obj_battlemanager.statsHPTextXOffset, 0, 0.5, 0.5);
            obj_battlemanager.statsHPTextYOffset = number_approach_smooth(obj_battlemanager.statsHPTextYOffset, 0, 0.5, 0.5);
        }
        
        if (harryActive)
        {
            obj_harry_monster.speed = 0;
            harDestX = obj_harry_monster.xstart;
            harDestY = obj_harry_monster.ystart;
            
            with (obj_harry_shakerhand_bul)
                instance_destroy();
            
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
            larBob = false;
            
            with (obj_larry_monster)
            {
                x = number_approach_smooth(x, xstart, 0.5, 0.5);
                y = ystart;
                hspeed = 0;
                forceDrawSelf = false;
                sprite_index = spr_larry_hurt;
                image_speed = 0;
                image_index = 0;
            }
        }
        
        break;
}

step++;

if (larBob)
    obj_larry_monster.y = (2 * sin(step / 4)) + obj_larry_monster.y;
