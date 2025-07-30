function monster_spawn()
{
    if (sprite_index != s_monster_fall)
        sprite_index = s_monster_fall;
    
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (place_meeting(x, y + 1, ObjWall))
        state = monster_chase;
}
