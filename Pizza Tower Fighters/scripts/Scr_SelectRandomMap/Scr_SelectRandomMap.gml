function Scr_SelectRandomMap()
{
    map_prev = map;
    var _mapchosen = choose("PSP", "FF", "DMAS", "SOTW", "GF", "GR", "TOP");
    
    switch (_mapchosen)
    {
        case "PSP":
            map = R_Pizzascape;
            pomni = s_stage_big_scape;
            sprite = s_ms_pizzascape;
            break;
        
        case "FF":
            map = R_FunFarm;
            pomni = s_stage_big_farm;
            sprite = s_ms_funfarm;
            break;
        
        case "GR":
            map = R_GrinchRace;
            pomni = s_stage_big_race;
            sprite = s_ms_grunch;
            break;
        
        case "DMAS":
            map = R_DontMakeASound;
            pomni = s_stage_big_sound;
            sprite = s_ms_dmas;
            break;
        
        case "GF":
            map = R_GnomeForest;
            pomni = s_stage_big_gnome;
            sprite = s_ms_gnome;
            break;
        
        case "SOTW":
            map = R_SecretRoom;
            pomni = s_stage_big_secret;
            sprite = s_ms_secret;
            break;
        
        case "TOP":
            map = R_Top;
            pomni = s_stage_big_top;
            sprite = s_ms_top;
            break;
    }
}
