function scr_savelevelDetails()
{
    if (global.collect >= global.srank)
        global.rank = "s";
    else if (global.collect > global.arank)
        global.rank = "a";
    else if (global.collect > global.brank)
        global.rank = "b";
    else if (global.collect > global.crank)
        global.rank = "c";
    else
        global.rank = "d";
    
    switch (global.rank)
    {
        case "e":
        case "s":
            scr_musicnoloop(21);
            break;
        
        case "a":
            scr_musicnoloop(109);
            break;
        
        case "b":
            scr_musicnoloop(1);
            break;
        
        case "c":
            scr_musicnoloop(125);
            break;
        
        case "d":
            scr_musicnoloop(0);
            break;
    }
    
    ini_open("saveData.ini");
    
    if (ini_read_string("Secret", string(global.levelname), 0) < global.secretfound)
        ini_write_string("Secret", string(global.levelname), global.secretfound);
    
    if (ini_read_string("Highscore", string(global.levelname), 0) < global.collect)
        ini_write_string("Highscore", string(global.levelname), global.collect);
    
    if (ini_read_string("Confecti", string(global.levelname) + "1", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "1", global.mallowfollow);
    
    if (ini_read_string("Confecti", string(global.levelname) + "2", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "2", global.chocofollow);
    
    if (ini_read_string("Confecti", string(global.levelname) + "3", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "3", global.crackfollow);
    
    if (ini_read_string("Confecti", string(global.levelname) + "4", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "4", global.wormfollow);
    
    if (ini_read_string("Confecti", string(global.levelname) + "5", 0) == 0)
        ini_write_string("Confecti", string(global.levelname) + "5", global.candyfollow);
    
    if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", string(global.levelname), "none")))
        ini_write_string("Ranks", string(global.levelname), global.rank);
    
    ini_close();
}
