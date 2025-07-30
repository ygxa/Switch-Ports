follow = o_player_default;
yoffset = 0;

switch (global.player1)
{
    case "NO":
        follow = o_player_noise;
        break;
    
    case "TV":
        follow = o_player_vigilante;
        yoffset = -10;
        break;
    
    case "FP":
        follow = o_player_fakepep;
        yoffset = 30;
        break;
    
    case "DO":
        follow = o_player_doise;
        break;
}

image_alpha = 0.5;
