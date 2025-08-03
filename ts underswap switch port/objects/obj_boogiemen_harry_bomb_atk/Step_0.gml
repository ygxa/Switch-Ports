switch (state)
{
    case 0:
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
        
        if (step == 15)
        {
            state = 1;
            step = 0;
        }
        
        break;
    
    case 1:
        if (step == 1)
            alarm[0] = 1;
        
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
            }
        }
        
        if (step == 200)
        {
            state = 2;
            step = 0;
        }
        
        break;
    
    case 2:
        with (obj_flying_bul)
            instance_destroy();
        
        with (obj_hat_content_bul)
            instance_destroy();
        
        bt_set_boxtype((1 << 0));
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
        
        if (step == 12)
        {
            state = 3;
            step = 0;
        }
        
        break;
    
    case 3:
        break;
}

step++;
