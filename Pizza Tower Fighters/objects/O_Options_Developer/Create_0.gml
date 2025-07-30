funclist = ds_list_create();
ds_list_add(funclist, function()
{
    if (!obj_console.opened)
    {
        if (global.Devconsole == 0)
        {
            global.Devconsole = true;
            menu[0] = "DEVELOPER CONSOLE: [spr_checkmark,1]";
            audio_play_sound(su_select, 50, false);
        }
        else
        {
            global.Devconsole = false;
            menu[0] = "DEVELOPER CONSOLE: [spr_checkmark,0]";
            audio_play_sound(su_select, 50, false);
        }
    }
    else
    {
        ScrSlidingTextCreate("YOU HAVE CONSOLE OPEN BUD");
        return 0;
    }
});
ds_list_add(funclist, function()
{
    if (global.Recorddemrec == 0)
    {
        global.Recorddemrec = true;
        menu[1] = "RECORD ALL MATCHES: [spr_checkmark,1]";
        audio_play_sound(su_select, 50, false);
    }
    else
    {
        global.Recorddemrec = false;
        menu[1] = "RECORD ALL MATCHES: [spr_checkmark,0]";
        audio_play_sound(su_select, 50, false);
    }
});
ds_list_add(funclist, function()
{
    if (global.hotsaving == 0)
    {
        global.hotsaving = true;
        menu[2] = "SAVE DEMO ON THE FLY: [spr_checkmark,1]";
        audio_play_sound(su_select, 50, false);
    }
    else
    {
        global.hotsaving = false;
        menu[2] = "SAVE DEMO ON THE FLY: [spr_checkmark,0]";
        audio_play_sound(su_select, 50, false);
    }
});
ds_list_add(funclist, function()
{
    if (global.frogger == 0)
    {
        global.frogger = true;
        menu[3] = "FROGGER: [spr_checkmark,1]";
        audio_play_sound(su_select, 50, false);
    }
    else
    {
        global.frogger = false;
        menu[3] = "FROGGER: [spr_checkmark,0]";
        audio_play_sound(su_select, 50, false);
    }
});
ds_list_add(funclist, function()
{
    if (global.remix == 0)
    {
        global.remix = true;
        menu[4] = "MUSIC REMIXES: [spr_checkmark,1]";
        audio_play_sound(su_select, 50, false);
    }
    else
    {
        global.remix = false;
        menu[4] = "MUSIC REMIXES: [spr_checkmark,0]";
        audio_play_sound(su_select, 50, false);
    }
});
ds_list_add(funclist, function()
{
    with (obj_console)
        exec_command(["demrec_menu"]);
});
ds_list_add(funclist, function()
{
    audio_play_sound(su_select, 50, false);
    instance_create_depth(x, y, depth, o_menu_options);
    instance_destroy();
});

if (global.Devconsole != 0)
    menu[0] = "DEVELOPER CONSOLE: [spr_checkmark,1]";
else
    menu[0] = "DEVELOPER CONSOLE: [spr_checkmark,0]";

if (global.Recorddemrec != 0)
    menu[1] = "RECORD ALL MATCHES: [spr_checkmark,1]";
else
    menu[1] = "RECORD ALL MATCHES: [spr_checkmark,0]";

if (global.hotsaving != 0)
    menu[2] = "SAVE DEMO ON THE FLY: [spr_checkmark,1]";
else
    menu[2] = "SAVE DEMO ON THE FLY: [spr_checkmark,0]";

if (global.frogger != 0)
    menu[3] = "FROGGER: [spr_checkmark,1]";
else
    menu[3] = "FROGGER: [spr_checkmark,0]";

if (global.remix != 0)
    menu[4] = "MUSIC REMIXES: [spr_checkmark,1]";
else
    menu[4] = "MUSIC REMIXES: [spr_checkmark,0]";

menu[5] = "DEMREC MENU";
menu[6] = "ESCAPE";
leaveButt = 88;
cursorLevitate = 0;
s_cursor = s_mnu_pizzaboy;
cursorTime = 0;
leviRate = 1.5;
selected = 0;
selectLerp = 0;
lerpAmt = 0.2;
spacing = 50;
selectedCol = 16777215;
notSelectedCol = 8421504;
titleCol = 16777215;
upButt = global.keyboardp1up;
downButt = global.keyboardp1down;
confirmButt = global.keyboardp1key_jump;
leftButt = global.keyboardp1left;
rightButt = global.keyboardp1right;
