if (player != 2 && other.state != (13 << 0))
{
    instance_destroy();
    
    with (instance_create_layer(x, y, layer, o_player_noise_explosion))
        player = other.player;
    
    with (other)
    {
        if (blastdamaged == 0)
        {
            blastdamaged = 1;
            projectilehit = 1;
            player_hurt(15, 14, facing, 3);
        }
    }
    
    if (damagemeter != 0)
    {
        if (instance_exists(o_player_noise))
            o_player_noise.damagemeter += damagemeter;
        
        damagemeter = 0;
    }
}
