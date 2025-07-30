switch (state)
{
    case (0 << 0):
        player_credits_npc_idle();
        break;
    
    case (1 << 0):
        player_hurt();
        break;
    
    case (2 << 0):
        CavemanState_Hitstun();
        break;
}
