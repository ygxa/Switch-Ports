switch (msgIdx)
{
    case 0:
        msg = "Uh, are you still here?\n\nPress \"R\" whenever you are ready to\nplay the game...";
        msgIdx = 1;
        alarm[5] = 1800;
        break;
    
    case 1:
        msg = "Right. So either you went AFK after naming your\ncharacter, or you are deliberately not\nfollowing directions.\n\nPress \"R\" in 20 seconds, starting now,\nor I will delete your save file.";
        msgIdx = 2;
        alarm[5] = 600;
        break;
    
    case 2:
        msg = "...";
        msgIdx = 3;
        alarm[5] = 60;
        break;
    
    case 3:
        msg = "Okay, that was a bluff.\n\nYou probably don't have a save file anyways...\n\nCause you were naming your character...";
        msgIdx = 4;
        alarm[5] = 300;
        break;
    
    case 4:
        msg = "But can you please press \"R\" now?";
        msgIdx = 5;
        alarm[5] = 300;
        break;
    
    case 5:
        msg = "You really suck, you know that, right?";
        msgIdx = 6;
        alarm[5] = 300;
        break;
    
    case 6:
        msg = "Fine, I'll just reset the game myself.\n\nGotta freaking do everything myself.";
        msgIdx = 7;
        alarm[5] = 300;
        break;
    
    case 7:
        msg = "Resetting the game in 3...";
        msgIdx = 8;
        alarm[5] = 30;
        break;
    
    case 8:
        msg = "Resetting the game in 2...";
        msgIdx = 9;
        alarm[5] = 30;
        break;
    
    case 9:
        msg = "Resetting the game in 1 and a half...";
        msgIdx = 10;
        alarm[5] = 30;
        break;
    
    case 10:
        msg = "Resetting the game in 1 and a quarter...";
        msgIdx = 11;
        alarm[5] = 30;
        break;
    
    case 11:
        msg = "Resetting the game in 1 and an eighth...";
        msgIdx = 12;
        alarm[5] = 90;
        break;
    
    case 12:
        msg = "You know what?";
        msgIdx = 13;
        alarm[5] = 150;
        break;
    
    case 13:
        msg = "Reset your own game.";
        msgIdx = 14;
        alarm[5] = 90;
        break;
    
    case 14:
        msg = "I don't get paid enough for this.";
        msgIdx = 15;
        alarm[5] = 1800;
        break;
    
    case 15:
        msg = "Oh my God, now I feel terrible.\n\nI know why you haven't reset now.";
        msgIdx = 16;
        alarm[5] = 600;
        break;
    
    case 16:
        msg = "You must be dead!\n\nLemme just reset the game for you then.\n\nThat way, when they find you, they'll never\nknow that you named yourself \"ERROR.\"";
        msgIdx = 17;
        alarm[5] = 600;
        break;
    
    case 17:
        game_restart_safe();
        break;
}
