if (!instance_exists(o_youwon))
{
    with (other)
    {
        if (object_index != O_Pizzaface)
            player_hurt(100000, 0, 0, 0);
    }
}
else
{
    other.x = o_spawn.x;
    other.y = o_spawn.y;
    
    with (o_spawn)
        spriter = 1;
}
