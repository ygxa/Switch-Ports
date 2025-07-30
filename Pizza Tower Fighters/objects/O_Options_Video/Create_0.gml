if (global.GUIon != 0)
    menu[0] = "GUI: [spr_checkmark,1]";
else
    menu[0] = "GUI: [spr_checkmark,0]";

if (global.VSyncon != 0)
    menu[1] = "VSYNC: [spr_checkmark,1]";
else
    menu[1] = "VSYNC: [spr_checkmark,0]";

if (global.AntiA == 0)
    menu[3] = "ANTI ALIASING: [spr_checkmark,0]";
else
    menu[3] = "ANTI ALIASING: [spr_checkmark,1]";

if (global.mGUI == false)
    menu[4] = "MINIMAL GUI: [spr_checkmark,0]";
else
    menu[4] = "MINIMAL GUI: [spr_checkmark,1]";

menu[5] = "SHAKE INTENSITY: " + string(global.shaker) + "X";
menu[6] = "ESCAPE";
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
leftButt = global.keyboardp1left;
rightButt = global.keyboardp1right;
confirmButt = global.keyboardp1key_jump;
leaveButt = global.keyboardp1key_tilt;
