if (dirty)
{
    showicon = true;
    alarm[0] = 10;
    dirty = false;
    
    if (dontdoshit)
    {
        dontdoshit = 0;
        exit;
    }
    
    if (afterarcade)
    {
        ini_open("arcade.ini");
        ini_write_real("Characters", "doise", global.doiseun);
        
        switch (global.player1)
        {
            case "PS":
                if (global.TOTALSCORE > global.pephs)
                {
                    ini_write_real("highscores", "pep", global.TOTALSCORE);
                    global.pephs = global.TOTALSCORE;
                }
                
                break;
            
            case "NO":
                if (global.TOTALSCORE > global.noisehs)
                {
                    ini_write_real("highscores", "noise", global.TOTALSCORE);
                    global.noisehs = global.TOTALSCORE;
                }
                
                break;
            
            case "DO":
                if (global.TOTALSCORE > global.doisehs)
                {
                    ini_write_real("highscores", "doise", global.TOTALSCORE);
                    global.doisehs = global.TOTALSCORE;
                }
                
                break;
            
            case "TV":
                if (global.TOTALSCORE > global.vigihs)
                {
                    ini_write_real("highscores", "vigi", global.TOTALSCORE);
                    global.vigihs = global.TOTALSCORE;
                }
                
                break;
            
            case "FP":
                if (global.TOTALSCORE > global.fakepephs)
                {
                    ini_write_real("highscores", "fakepep", global.TOTALSCORE);
                    global.fakepephs = global.TOTALSCORE;
                }
                
                break;
        }
        
        ini_close();
    }
    else if (!savematch)
    {
        ini_open("Options.ini");
        ini_write_real("Audio", "master volume", global.default_group_gain);
        ini_write_real("Audio", "music volume", global.music_group_gain);
        ini_write_real("Audio", "sfx volume", global.sfx_group_gain);
        ini_write_real("Video", "AA", global.AntiA);
        ini_write_real("Video", "vsync", global.VSyncon);
        ini_write_real("Video", "fullscreen", global.fullscreen);
        ini_write_real("Video", "gui", global.GUIon);
        ini_write_real("Video", "minimalgui", global.mGUI);
        ini_write_string("Video", "shaker", global.shaker);
        ini_write_real("Game", "timeron", global.timeron);
        ini_write_string("Game", "timer", global.timer);
        ini_write_real("Game", "stocks", global.stocks);
        ini_write_real("Game", "hazards", global.hazards);
        ini_write_string("Developer", "demrec", global.Recorddemrec);
        ini_write_string("Developer", "console", global.Devconsole);
        ini_write_string("Developer", "frogger", global.frogger);
        ini_write_string("Developer", "remix", global.remix);
        ini_write_real("P1Control", "keyJump", global.keyboardp1key_jump);
        ini_write_real("P1Control", "keyTaunt", global.keyboardp1key_taunt);
        ini_write_real("P1Control", "keyAttack", global.keyboardp1key_tilt);
        ini_write_real("P1Control", "keySpecial", global.keyboardp1key_special);
        ini_write_real("P1Control", "keyLeft", global.keyboardp1left);
        ini_write_real("P1Control", "keyUp", global.keyboardp1up);
        ini_write_real("P1Control", "keyDown", global.keyboardp1down);
        ini_write_real("P1Control", "keyRight", global.keyboardp1right);
        ini_write_real("P2Control", "keyJump", global.keyboardp2key_jump);
        ini_write_real("P2Control", "keyTaunt", global.keyboardp2key_taunt);
        ini_write_real("P2Control", "keyAttack", global.keyboardp2key_tilt);
        ini_write_real("P2Control", "keySpecial", global.keyboardp2key_special);
        ini_write_real("P2Control", "keyLeft", global.keyboardp2left);
        ini_write_real("P2Control", "keyUp", global.keyboardp2up);
        ini_write_real("P2Control", "keyDown", global.keyboardp2down);
        ini_write_real("P2Control", "keyRight", global.keyboardp2right);
        ini_close();
        show_debug_message("saved options");
    }
    else
    {
        ini_open("Matches.ini");
        var match = ini_read_real("generalinfo", "curmatch", 0) + 1;
        ini_write_string(string(match), "p1char", global.player1);
        ini_write_string(string(match), "p2char", global.player2);
        ini_write_real(string(match), "p1lives", ObjGame.Player1live);
        ini_write_real(string(match), "p2lives", ObjGame.Player2live);
        ini_write_real(string(match), "p1pal", global.palp1);
        ini_write_real(string(match), "p2pal", global.palp2);
        ini_write_real(string(match), "day", current_day);
        ini_write_real(string(match), "month", current_month);
        ini_write_real(string(match), "year", current_year);
        ini_write_string(string(match), "charwon", o_manager.winnerlast);
        ini_write_string(string(match), "gamemode", global.gameselect);
        ini_write_real("Demrec", "hotsaving", global.hotsaving);
        ini_write_real("generalinfo", "curmatch", match);
        ini_close();
        show_debug_message("saved match");
    }
    
    dontdoshit = 0;
}

saveiconalpha = approach(saveiconalpha, showicon, 0.01);
icon_index += 0.35;
