switch (state)
{
    case (0 << 0):
        player_slime_idle();
        break;
    
    case (1 << 0):
        player_hurt();
        break;
    
    case (2 << 0):
        CavemanState_Hitstun();
        break;
    
    case (3 << 0):
        player_slime_sideE();
        break;
    
    case (4 << 0):
        player_slime_follow();
        break;
}

if (comboshake > 0)
    comboshake -= 0.1;

if (combotimer > 0)
    combotimer--;

if (combotimer == 0)
    combo = 0;
