if (bounced != 0)
{
    vsp += grv;
    
    if (!place_meeting(x, y, ObjWall) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), ObjWall))
    {
        while (!place_meeting(x, y + 1, ObjWall))
            y += 1;
    }
    
    if (place_meeting(x, y + vsp, ObjWall))
    {
        while (!place_meeting(x, y + sign(vsp), ObjWall))
            y += sign(vsp);
        
        if (!place_meeting(x, y, ObjWall))
        {
            vsp = -bounced;
            bounced -= 1;
        }
        else
        {
            vsp = bounced;
        }
        
        audio_play_sound(su_land, 50, false);
    }
    
    y += vsp;
}
else
{
    timerrr--;
    
    if (timerrr == 0)
        fadeToRoom(R_CharacterSelect_Sing, 50, 0);
}
