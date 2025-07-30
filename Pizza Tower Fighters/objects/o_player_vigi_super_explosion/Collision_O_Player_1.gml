if (playa == 2 && hurt_timer == 0)
{
    hurt_timer = 4;
    ScreenShake(9, 10);
    
    with (other)
        player_hurt(5, 3, -facing, 3);
}
