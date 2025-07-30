function ScrArcadeShuffle()
{
    switch (global.player1)
    {
        case "PS":
            global.ArcadeArray = array_shuffle(["NO", "FP", "TV", "DO"]);
            break;
        
        case "NO":
            global.ArcadeArray = array_shuffle(["PS", "FP", "TV", "DO"]);
            break;
        
        case "TV":
            global.ArcadeArray = array_shuffle(["NO", "FP", "PS", "DO"]);
            break;
        
        case "FP":
            global.ArcadeArray = array_shuffle(["NO", "PS", "TV", "DO"]);
            break;
        
        case "DO":
            global.ArcadeArray = array_shuffle(["NO", "FP", "TV", "PS"]);
            break;
    }
}
