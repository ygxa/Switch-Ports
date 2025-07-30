function monster_animatronic()
{
    if (sprite_index != s_monster_pep)
    {
        sprite_index = s_monster_pep;
        mask_index = s_monster_pep;
        hsp = 3 * facing;
    }
    
    vsp += grv;
    player_col();
    
    if (hsp != 0)
        image_xscale = sign(hsp);
}
