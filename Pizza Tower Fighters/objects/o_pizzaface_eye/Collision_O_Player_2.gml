if (player != 2 && other.state != (13 << 0))
{
    if (other.state != (16 << 0))
        instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(10, -8, other.facing, 3);
    }
}

damagemeter = 0;
