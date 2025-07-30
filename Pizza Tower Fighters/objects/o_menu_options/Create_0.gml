menu[0] = "AUDIO";
menu[1] = "VIDEO";
menu[2] = "CONTROLS";
menu[3] = "DEVELOPER";
menu[3 + global.developer] = "BACK";
leaveButt = 88;
cursorLevitate = 0;
s_cursor = s_mnu_multiplayer;
cursorTime = 0;
leviRate = 1.5;
selected = 0;
selectLerp = 0;
lerpAmt = 0.2;
backingout = false;
spacing = 50;
selectedCol = 16777215;
notSelectedCol = 8421504;
titleCol = 16777215;
upButt = global.keyboardp1up;
downButt = global.keyboardp1down;
confirmButt = global.keyboardp1key_jump;

confirm = function()
{
    if (selected == 0)
    {
        audio_play_sound(su_select, 50, false);
        instance_create_depth(x, y, depth, O_Options_Audio);
        instance_destroy();
    }
    
    if (selected == 1)
    {
        audio_play_sound(su_select, 50, false);
        instance_create_depth(x, y, depth, O_Options_Video);
        instance_destroy();
    }
    
    if (selected == 2)
    {
        audio_play_sound(su_select, 50, false);
        instance_create_depth(x, y - 50, depth, obj_optionkeyselect);
        instance_destroy();
    }
    
    if (selected == 3 && global.developer)
    {
        audio_play_sound(su_select, 50, false);
        instance_create_depth(x, y, depth, O_Options_Developer);
        instance_destroy();
    }
    
    if (selected == (3 + global.developer))
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_Menu, 20, 0);
        
        backingout = true;
    }
};
