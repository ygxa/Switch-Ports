DrawSetText(0, F_Win, 50, 50);
draw_text(150, 231, "PLAYER 1 LIVES: \n" + string(o_manager.playerlives1lastgame));

if (global.P2Cpu == false)
    draw_text(150, 271, "PLAYER 2 LIVES: \n" + string(o_manager.playerlives2lastgame));
else
    draw_text(150, 271, "CPU LIVES: \n" + string(o_manager.playerlives2lastgame));

if (o_manager.winnerlast == "PS")
    draw_text(150, 330, "WINNER: \nPEPPINO");
else if (o_manager.winnerlast == "NO")
    draw_text(150, 330, "WINNER: \nTHE NOISE");
else if (o_manager.winnerlast == "DO")
    draw_text(150, 330, "WINNER: \nTHE DOISE");
else if (o_manager.winnerlast == "TV")
    draw_text(150, 330, "WINNER: \nTHE VIGILANTE");
else if (o_manager.winnerlast == "FP")
    draw_text(150, 330, "WINNER: \nFAKE PEPPINO");

if (o_manager.winnerlast == "NOONE")
    draw_text(150, 330, "DRAW!");
