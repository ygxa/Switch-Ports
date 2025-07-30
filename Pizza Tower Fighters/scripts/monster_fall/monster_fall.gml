function monster_fall()
{
    if (sprite_index != s_monster_pep2)
        sprite_index = s_monster_pep2;
    
    hsp = 0;
    vsp += grv;
    player_col();
    
    if (place_meeting(x, y + 1, ObjWall))
    {
        state = monster_animatronic;
        audio_stop_sound(su_alarm);
    }
}
