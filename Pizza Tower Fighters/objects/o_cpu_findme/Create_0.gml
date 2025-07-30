follow = o_player_default;
cpuboy = 0;

switch (global.player2)
{
    case "PS":
        cpuboy = o_player_default2;
        break;
    
    case "NO":
        cpuboy = o_player_noise2;
        break;
    
    case "TV":
        cpuboy = o_player_vigilante2;
        break;
    
    case "FP":
        cpuboy = o_player_fakepep2;
        break;
    
    case "DO":
        cpuboy = o_player_doise2;
        break;
}
