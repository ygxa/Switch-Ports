if (x > 900)
{
    instance_destroy();
    exit;
}

if (sprite_index == spr_dogboard_fly && hspeed < 5)
    hspeed += 0.2;

actor_shake_logic();
