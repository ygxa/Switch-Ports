switch (state)
{
    case (0 << 0):
        player_dummy_idle();
        break;
    
    case (1 << 0):
        player_hurt();
        break;
    
    case (2 << 0):
        CavemanState_Hitstun();
        break;
}

if (comboshake > 0)
    comboshake -= 0.1;

if (state != (2 << 0) && hitstun == 0)
{
    combo = 0;
    damagedealttotal = 0;
    damagedealt = 0;
}

if (combo == 0 && state == (2 << 0))
{
    combo_show = combo;
    damagedealtshow = damagedealt;
    damagedealttotalshow = damagedealttotal;
}
