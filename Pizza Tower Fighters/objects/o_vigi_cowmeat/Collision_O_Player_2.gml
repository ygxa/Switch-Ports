if (player != 2)
{
    instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(5, -2, other.timer, 2);
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_vigilante))
            o_player_vigilante.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
}
