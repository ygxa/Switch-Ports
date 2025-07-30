if (player != 1 && other.state != (13 << 0))
{
    instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(20, 6, -facing, 6);
    }
}

damagemeter = 0;
