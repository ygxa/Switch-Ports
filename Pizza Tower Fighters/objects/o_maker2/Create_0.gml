follow = o_player_default2;
yoffset = 0;
image_alpha = 0.5;

switch (global.player2)
{
    case "NO":
        follow = o_player_noise2;
        break;
    
    case "TV":
        follow = o_player_vigilante2;
        yoffset = -10;
        break;
    
    case "FP":
        follow = o_player_fakepep2;
        yoffset = 30;
        break;
    
    case "DO":
        follow = o_player_doise2;
        break;
    
    case "DUMMY":
        follow = o_trainingdummy;
        yoffset = -10;
        image_alpha = 0;
        break;
}
