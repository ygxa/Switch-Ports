if (player != 1)
{
    instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(5, -2, other.timer, 2);
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_vigilante2))
            o_player_vigilante2.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
}
