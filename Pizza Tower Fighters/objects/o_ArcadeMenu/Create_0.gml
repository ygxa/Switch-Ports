menu[0] = "BEGIN";
menu[1] = "RESHUFFLE ";
menu[2] = "PUSSY OUT!!!!1!";
draw_set_halign(fa_left);
draw_set_valign(fa_top);
global.player2 = 0;
global.stocks = 3;
global.ArcadeDiffictulty = 0;
cursorLevitate = 0;
s_cursor = s_mnu_multiplayer;
cursorTime = 0;
leviRate = 1.5;
selected = 0;
selectLerp = 0;
lerpAmt = 0.2;
spacing = 50;
selectedCol = 16777215;
notSelectedCol = 4210752;
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
