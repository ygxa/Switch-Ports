menu[0] = "SINGLEPLAYER";
menu[1] = "MULTIPLAYER";
menu[2] = "MATCH HISTORY";
menu[3] = "OPTIONS";
//menu[4] = "EXIT";
draw_set_halign(fa_left);
draw_set_valign(fa_top);
global.player1 = 0;
global.player2 = 0;
cursorLevitate = 0;
s_cursor = s_mnu_multiplayer;
cursorTime = 0;
leviRate = 1.5;
selected = 0;
selectLerp = 0;
lerpAmt = 0.2;
spacing = 50;
selectedCol = 16777215;
notSelectedCol = 8421504;
titleCol = 16777215;

if (!audio_is_playing(mu_boogiewoogie))
    audio_play_sound(mu_boogiewoogie, 50, true);

reset = 0;
lyaxis = 0;
yeah = 0;
upButt = global.keyboardp1up;
downButt = global.keyboardp1down;
confirmButt = global.keyboardp1key_jump;
ass_trigger = false;
movedowncont = false;
moveupcont = false;

confirm = function()
{
    if (selected == 0)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_SinglePlayerMenu, 20, 16777215);
    }
    
    if (selected == 1)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_CharacterSelect, 20, 16777215);
        
        global.gameselect = "Multi";
        global.P2Cpu = false;
        global.CPULVL = 1;
    }
    
    if (selected == 2)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_MatchHistory, 20, 0);
    }
    
    if (selected == 3)
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_OptionsHub, 20, 0);
    }
    
    if (selected == 4)
        game_end();
};
