if (O_Pause.PAUSE != true)
{
    audio_stop_sound(mu_dmas);
    audio_stop_sound(mu_secretstage);
    audio_stop_sound(mu_grinchrace);
    audio_stop_sound(mu_gnomeforest);
    audio_stop_sound(mu_pizzascape);
    audio_stop_sound(mu_pizzascapeOLD);
    audio_stop_sound(mu_funfarm);
    audio_stop_sound(mu_top);
    o_manager.playerlives1lastgame = Player1live;
    o_manager.playerlives2lastgame = Player2live;
    
    if (Player1live == 0 || Player1live < Player2live)
    {
        o_manager.winnerlast = global.player2;
        o_manager.playerwinnerlast = 2;
    }
    
    if (Player2live == 0 || Player1live > Player2live)
    {
        o_manager.winnerlast = global.player1;
        o_manager.playerwinnerlast = 1;
    }
    
    if ((Player2live == 0 && Player1live == 0) || Player1live == Player2live)
    {
        o_manager.playerwinnerlast = 1;
        o_manager.winnerlast = "NOONE";
    }
}
else
{
    audio_stop_all();
}

if (global.gameselect == "Arcade")
{
    if (global.player2 != "PF")
        global.CURRENTSCORE += timerscore;
    
    switch (Player1live)
    {
        case 1:
            global.CURRENTSCORE += 15;
            break;
        
        case 2:
            global.CURRENTSCORE += 20;
            break;
        
        case 3:
            global.CURRENTSCORE += 50;
            break;
    }
    
    global.TOTALSCORE += global.CURRENTSCORE;
    global.CURRENTSCORE = 0;
}
