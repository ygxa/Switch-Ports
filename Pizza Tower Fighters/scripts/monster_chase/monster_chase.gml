function monster_chase()
{
    if (sprite_index != s_monster_chase)
    {
        sprite_index = s_monster_chase;
        hsp = 5 * facing;
    }
    
    vsp += grv;
    player_col();
    
    if (hsp != 0)
        image_xscale = sign(hsp);
}
