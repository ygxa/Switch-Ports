if (player != 2 && other.state != (13 << 0))
{
    instance_destroy();
    instance_create_layer(x, y, layer, o_player_noise_explosion);
    
    with (other)
    {
        if (blastdamaged == 0)
        {
            blastdamaged = 1;
            player_hurt(20, 14, facing, 3);
        }
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_doise))
            o_player_doise.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
}
