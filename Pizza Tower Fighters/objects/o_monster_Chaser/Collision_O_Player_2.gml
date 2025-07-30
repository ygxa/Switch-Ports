if (global.hazards == 1)
{
    with (other)
    {
        if (blastdamaged == 0)
        {
            blastdamaged = 1;
            player_hurt(50, 14, other.facing, 10);
        }
    }
}
