if (!instance_exists(o_youwon))
{
    with (other)
    {
        if (object_index != O_Pizzaface)
            player_hurt_no_hitstun(1000000);
    }
}
else
{
    other.x = o_spawn.x;
    other.y = o_spawn.y;
    
    with (o_spawn)
        spriter = 1;
}
