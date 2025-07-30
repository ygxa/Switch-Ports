if (player != 2)
{
    with (other)
    {
        projectilehit = 1;
        
        if (state != (2 << 0))
            player_hurt(15, 8, other.vsp, 6);
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_fakepep))
            o_player_fakepep.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
    
    instance_destroy();
}
