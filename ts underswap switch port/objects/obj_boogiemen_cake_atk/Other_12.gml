with (bt_bullet(obj_explosion_bul, x, y, obj_larry_monster))
{
    image_xscale = 0.5;
    image_yscale = 0.5;
}

sfx_play(snd_bang, 80, false);
view_shake(2, 2);
bulDir = 15;

repeat (8)
{
    bulDir += 45;
    bulSpeed = 4;
    
    repeat (3)
    {
        with (bt_bullet(obj_cake_projectile_bul, x, y, obj_larry_monster))
        {
            direction = other.bulDir;
            speed = other.bulSpeed;
            damageAmount = obj_larry_monster.attack;
        }
        
        bulSpeed += 2;
    }
}

instance_destroy();
