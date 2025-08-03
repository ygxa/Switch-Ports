if (ds_map_find_value(global.flags, "st7c_crash") || evac(2))
{
    instance_destroy();
    exit;
}

actor_shake_init(true);
