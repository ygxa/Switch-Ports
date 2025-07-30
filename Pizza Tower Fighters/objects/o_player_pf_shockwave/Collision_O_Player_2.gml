if (player != 2 && playerhit == 0)
{
    playerhit = 5;
    
    with (other)
    {
        if (blastdamaged == 0)
        {
            blastdamaged = 1;
            projectilehit = 1;
            player_hurt(5, 7, other.facing, 5);
        }
    }
}
