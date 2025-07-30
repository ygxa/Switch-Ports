if (state != 57 && x == xstart && y == ystart)
{
    with (other)
    {
        if (state != 63)
        {
            tauntstoredmovespeed = movespeed;
            tauntstoredvsp = vsp;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
        }
        
        state = 108;
        
        if (boxxed == 0)
            sprite_index = spr_player_catched;
        else
            sprite_index = spr_boxxedpep_air;
        
        other.playerid = id;
        other.state = 57;
    }
}
