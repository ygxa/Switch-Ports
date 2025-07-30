menu[0] = "CPU BATTLE";
menu[1] = "TRAINING";
menu[2] = "CREDITS";
menu[3] = "TUTORIAL";
menu[4] = "ARCADE MODE";
menu[5] = "BACK";
leaveButt = 88;
cursorLevitate = 0;
s_cursor = s_mnu_pizzaboy;
cursorTime = 0;
leviRate = 1.5;
selectLerpX = 0;
selected = 0;
selectLerp = 0;
lerpAmt = 0.2;
spacing = 50;
selectedCol = 16777215;
notSelectedCol = 8421504;
titleCol = 16777215;

if (!audio_is_playing(mu_boogiewoogie))
    audio_play_sound(mu_boogiewoogie, 50, true);

upButt = global.keyboardp1up;
downButt = global.keyboardp1down;
confirmButt = global.keyboardp1key_jump;
global.player1 = 0;
global.player2 = 0;

confirm = function()
{
    if (selected == 0)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_CharacterSelect, 20, 16777215);
        
        global.gameselect = "CPU";
    }
    
    if (selected == 1)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_CharacterSelect_Sing, 20, 16777215);
        
        global.gameselect = "Train";
    }
    
    if (selected == 2)
    {
        audio_stop_sound(mu_boogiewoogie);
        audio_play_sound(su_movetomap, 50, false);
        global.player1 = "PS";
        global.palp1 = 1;
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Credits, 20, 0);
    }
    
    if (selected == 3)
    {
        audio_stop_sound(mu_boogiewoogie);
        audio_play_sound(su_movetomap, 50, false);
        global.player1 = "PS";
        global.palp1 = 1;
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Tutorial, 20, 0);
    }
    
    if (selected == 4)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_CharacterSelect_Sing, 20, 16777215);
        
        global.gameselect = "Arcade";
        global.ArcadeDiffictulty = 0;
        global.P2Cpu = true;
        global.CPULVL = 2;
    }
    
    if (selected == 5)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Menu, 20, 0);
    }
};
