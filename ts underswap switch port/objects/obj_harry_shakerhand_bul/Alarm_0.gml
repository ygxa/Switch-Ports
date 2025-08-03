if (obj_harry_monster.sprite_index != spr_harry_feed)
    exit;

image_angle = 0;
obj_harry_monster.image_index = 1;

repeat (8)
{
    with (bt_bullet(obj_fishfood_bul, x + 18, y + 40, obj_harry_monster))
    {
        gravity = 0.5;
        hspeed = xrandom_range(-2, 2);
        vspeed = xrandom_range(0.01, 1);
        
        if (obj_boogiemen_manager.shouldMakeHeal)
        {
            if (xrandom(1) < 0.2)
            {
                image_blend = c_lime;
                damageAmount *= -1;
            }
        }
        
        if (obj_boogiemen_manager.attackType == 11)
            vspeed *= 0.8;
    }
}

alarm[1] = delay;
