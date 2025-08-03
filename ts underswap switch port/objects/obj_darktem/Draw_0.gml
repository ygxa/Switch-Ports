if (obj_overworldui.currentCharacter == myID && ((sprite_index != spr_temdark_b_walk && sprite_index != spr_temdark_b_talk) || shakeAnyway))
{
    var _x = x;
    var _y = y;
    
    if (myID != "temd5" || irandom(1) == 0)
    {
        x += irandom(1);
        y += irandom(1);
    }
    
    draw_self();
    x = _x;
    y = _y;
}
else
{
    draw_self();
}
