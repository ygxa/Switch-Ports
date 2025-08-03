var LEAVE = "I KNOW YOU'RE HERE FOR A REASON. PLEASE, LEAVE. YOU DON'T NEED TO BE HERE.";
LEAVE = "But actually, I don't really mind. Enjoy this error handler code I guess.";
audio_kill_all();
var scExists;

if (file_exists("data/mus/spepcheck.ogg"))
{
    scExists = true;
    music_play(music_load("spepcheck", true), true);
}
else
{
    scExists = false;
}

var contactPre = "\n\nPlease contact this game's developers\nwith this message if you believe\nthis is an error.";
var contact = contactPre + "\n\nHold X for 4 seconds to erase your";
var r = (global.ostype != 1) ? "\n\nPress R to restart the game, after\nyou have made sufficient\nchanges." : "\n\nPlease restart the game, after\nyou have made sufficient\nchanges.";
var sf = "\nsave file. This will erase ALL\ncurrent progress except for\npersistent data." + r;
var sf2 = "\nlocal psave file. This will erase\npersistent data stored for\nthis save slot." + r;
var pf = "\npersistent save file. This will erase\npersistent data stored across\nevery save slot." + r;

switch (global.gamebroke)
{
    case 0:
    case 1:
    case 7:
        window_set_caption("SPEPCHECK");
        mode = 0;
        currentLine = 0;
        currFade = 0;
        submode = 0;
        spepX = 284;
        checked = false;
        showCheck = false;
        lines = array_create(19);
        lines[0] = "You cheated not only the game, but yourself.";
        lines[1] = undefined;
        lines[2] = "You didn't grow.";
        lines[3] = "You didn't improve.";
        lines[4] = "You took a shortcut and gained nothing.";
        lines[5] = undefined;
        lines[6] = "You experienced a hollow victory.";
        lines[7] = "Nothing was risked and nothing was gained.";
        lines[8] = undefined;
        lines[9] = "It's sad that you don't know the difference.";
        lines[10] = undefined;
        lines[11] = "However, do not fret.";
        lines[12] = "Your meager mischief can be reverted.";
        lines[13] = undefined;
        lines[14] = "You must swear to do this never again,";
        lines[15] = "by checking the box below.";
        lines[16] = undefined;
        lines[17] = "Refusal of this will result in an untimely death.";
        lines[18] = "You have 2 seconds.";
        linesY = array_create(7);
        linesY[0] = "Thank you for your cooperation.";
        linesY[1] = "Your SOUL has been sold...";
        linesY[2] = undefined;
        linesY[3] = "Haha, only kidding.";
        linesY[4] = "Go fix your save file.";
        linesY[5] = undefined;
        linesY[6] = "Go ahead.";
        linesN = array_create(9);
        linesN[0] = "Alright, so be it.";
        linesN[1] = "This shall be your demise.";
        linesN[2] = undefined;
        linesN[3] = "Your save files have been erased!";
        linesN[4] = "Haha, I'm only messing with you.";
        linesN[5] = "Did you really think I would HELP you?";
        linesN[6] = undefined;
        linesN[7] = "Well, until you figure this out,";
        linesN[8] = "it seems like you're stuck here.";
        alarm[0] = 1;
        break;
    
    case 2:
        mode = 1;
        hold = 0;
        msg = "Invalid header - corrupt save file." + contact + sf;
        break;
    
    case 3:
        mode = 1;
        hold = 0;
        msg = "Invalid version identifier - corrupt save file." + contact + sf;
        break;
    
    case 4:
        mode = 1;
        hold = 0;
        msg = "Invalid usage of reserved block - corrupt save file." + contact + sf;
        break;
    
    case 5:
        mode = 2;
        hold = 0;
        msg = "Invalid header - corrupt psave file." + contact + pf;
        break;
    
    case 5.5:
        mode = 1.5;
        hold = 0;
        msg = "Invalid header - corrupt local psave file." + contact + sf2;
        break;
    
    case 6:
        mode = 2;
        hold = 0;
        msg = "Invalid version - corrupt psave file." + contact + pf;
        break;
    
    case 6.5:
        mode = 1.5;
        hold = 0;
        msg = "Invalid version - corrupt local psave file." + contact + sf2;
        break;
    
    case 8:
        mode = 1;
        msg = "This game is missing important data files\nand/or directories.\n\nPlease contact the game's developers\nwith this message if you believe\nthis is an error.\n\nTroubleshooting:\n- Make sure you *extracted* the game into a\n  folder on its own, not with other files.\n- Redownload the game, and make sure you copy\n  all the files that are necessary";
        
        if (os_type != os_macosx)
            msg += ", especially\n  the folder named \"data\".";
        else
            msg += ".";
        
        if (scExists)
            msg += "\n- Note: The music file now playing was found.";
        else
            msg += "\n- Note: Music file test not found.";
        
        if (variable_global_exists("integrity_fail") && global.integrity_fail != "")
            msg += ("\n(failed on " + global.integrity_fail + ")");
        
        break;
    
    case 9:
        msgIdx = 0;
        mode = 1;
        hold = 0;
        var gaming;
        
        if (global.ostype == 1)
            gaming = "Restart the game, ";
        else
            gaming = "Press \"R\" to restart the game, ";
        
        msg = "Welcome to the Error Handling Screen!\n\n\nYou decided to test the limits of our\nnaming system.\n\nCongratulations.\n\nYou played yourself.\n\n" + gaming + "after NOT reporting\nthis issue that was entirely your fault.";
        alarm[5] = 1800;
        break;
    
    case 10:
        mode = 1;
        hold = 0;
        msg = "The save data that was just downloaded\nwas corrupt. There is no save data to\nfall back on, so please restart the game." + contactPre;
        break;
    
    case 11:
        mode = 1;
        msg = "The game crashed last time! Here's the internal\ninfo for that. Please send this to the\ndevelopers. ";
        
        if (global.ostype == 1)
            msg += "Restart to play normally.";
        else
            msg += "Press R to restart normally.";
        
        msg2 = "";
        var s = array_length(global.crash_data);
        
        for (var i = 0; i < s; i++)
            msg2 += (global.crash_data[i] + "\n");
        
        break;
    
    case 7.1:
        mode = 1;
        hold = 0;
        msg = "Unexpected data - corrupt save file." + contact + sf;
        break;
    
    case 7.15:
        mode = 1.5;
        hold = 0;
        msg = "Unexpected data - corrupt local psave file." + contact + sf2;
        break;
    
    case 7.2:
        mode = 2;
        hold = 0;
        msg = "Unexpected data - corrupt psave file." + contact + pf;
        break;
    
    default:
        mode = 1;
        hold = 0;
        msg = "Dummy error";
        break;
}
