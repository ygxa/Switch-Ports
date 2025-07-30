function ScrArcadeShuffleMapSelect()
{
    switch (global.player2)
    {
        case "PS":
            fadeToRoom(R_SecretRoom, 20, 0, 1);
            break;
        
        case "NO":
            fadeToRoom(R_GnomeForest, 20, 0, 1);
            break;
        
        case "TV":
            fadeToRoom(R_FunFarm, 20, 0, 1);
            break;
        
        case "FP":
            fadeToRoom(R_DontMakeASound, 20, 0, 1);
            break;
        
        case "DO":
            fadeToRoom(R_GrinchRace, 20, 0, 1);
            break;
    }
}
