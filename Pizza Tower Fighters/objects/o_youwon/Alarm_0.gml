if (global.gameselect == "Arcade")
{
    if (ObjGame.Player1live != 0)
        fadeToRoom(R_ArcadeTransition, 90, 16777215, 0);
    else
        fadeToRoom(R_GameOverArcade, 60, 0, 0);
}
else
{
    fadeToRoom(R_Win, 10, 16777215, 1);
    O_FadeDoors.showplayers = false;
}
