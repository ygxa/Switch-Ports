if (player != 1 && other.state != (13 << 0))
{
    if (other.state != (16 << 0))
        instance_destroy();
    
    with (other)
    {
        projectilehit = 1;
        player_hurt(7, -6, other.facing, 3);
    }
}

damagemeter = 0;
