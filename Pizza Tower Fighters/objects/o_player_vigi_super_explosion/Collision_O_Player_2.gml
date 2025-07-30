if (playa == 1 && hurt_timer == 0)
{
    hurt_timer = 4;
    ScreenShake(9, 10);
    
    with (other)
        player_hurt(5, 6, -facing, 7);
}
