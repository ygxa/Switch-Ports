switch (room)
{
    case R_CharacterSelect:
        switch (global.gameselect)
        {
            case "Multi":
                if (global.player1 != 0 && global.player2 != 0 && !instance_exists(O_Fade))
                {
                    if (o_p1_selected.key_accept || o_p2_selected.key_accept)
                    {
                        audio_play_sound(su_movetomap, 50, false);
                        fadeToRoom(R_MapSelect, 30, 0);
                    }
                }
                
                break;
            
            case "CPU":
                if (global.player1 != 0 && global.player2 != 0 && !instance_exists(O_Fade))
                {
                    if (o_p1_selected.key_accept)
                    {
                        audio_play_sound(su_movetomap, 50, false);
                        fadeToRoom(R_MapSelect, 30, 0);
                        global.P2Cpu = true;
                    }
                    
                    break;
                }
        }
        
        break;
    
    case R_CharacterSelect_Sing:
        switch (global.gameselect)
        {
            case "Train":
                if (global.player1 != 0 && !instance_exists(O_Fade))
                {
                    if (o_p1_selected.key_accept)
                    {
                        audio_play_sound(su_movetomap, 50, false);
                        fadeToRoom(R_Training, 30, 0);
                        audio_stop_sound(mu_boogiewoogie);
                        global.player2 = "DUMMY";
                    }
                    
                    break;
                }
            
            case "Arcade":
                if (global.player1 != 0 && !instance_exists(O_Fade))
                {
                    if (o_p1_selected.key_accept)
                    {
                        audio_play_sound(su_movetomap, 50, false);
                        fadeToRoom(R_ArcadeMode, 30, 0);
                        audio_stop_sound(mu_boogiewoogie);
                        ScrArcadeShuffle();
                    }
                    
                    break;
                }
        }
        
        break;
}
