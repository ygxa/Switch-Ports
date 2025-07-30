if (player != 1)
{
    with (other)
    {
        if (blastdamaged == 0)
        {
            blastdamaged = 1;
            player_hurt(20, 14, facing, 3);
        }
    }
}
