if (damageAmount < 0)
{
    if (instance_exists(obj_vegetoid_monster))
    {
        with (obj_vegetoid_monster)
            isSpareable = true;
    }
}

event_inherited();
