if (playerid.visible == false)
{
    with (obj_player1)
    {
        if (isgustavo)
            state = 193;
        else
            state = 2;
        
        instance_create(x, y, obj_genericpoofeffect);
        cutscene = 0;
    }
    
    if (global.coop == true)
    {
        with (obj_player2)
        {
            state = 2;
            cutscene = 0;
        }
    }
    
    obj_player1.visible = true;
    obj_player2.visible = true;
}
