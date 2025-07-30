if (player != 1)
{
    with (other)
    {
        projectilehit = 1;
        player_hurt(10, 5, -facing, 5);
    }
    
    instance_destroy();
}
