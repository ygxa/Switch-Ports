vsp += grv;
timer--;
y += vsp;

if (damagemeter != 0)
{
    if (player == 1 && instance_exists(o_player_default))
        o_player_default.damagemeter += damagemeter;
    else if (instance_exists(o_player_default2))
        o_player_default2.damagemeter += damagemeter;
    
    damagemeter = 0;
}
