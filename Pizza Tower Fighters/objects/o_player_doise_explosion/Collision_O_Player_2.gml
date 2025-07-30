with (other)
{
    if (blastdamaged == 0 && state != (24 << 0))
    {
        blastdamaged = 1;
        player_hurt(10, 13, facing, 3);
    }
}
