if (player != 1)
{
    with (other)
    {
        if (!blastdamaged)
        {
            player_hurt(5, -7, 0, 2);
            blastdamaged = true;
            projectilehit = 1;
        }
    }
}
