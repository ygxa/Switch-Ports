menu[0] = "TIMER: OFF";

switch (global.stocks)
{
    case 4:
        menu[1] = "STOCKS: 4";
        break;
    
    case 3:
        menu[1] = "STOCKS: 3";
        break;
    
    case 2:
        menu[1] = "STOCKS: 2";
        break;
    
    case 1:
        menu[1] = "STOCKS: 1";
        break;
}

if (global.hazards == 1)
    menu[2] = "HAZARDS:[spr_checkmark,1]";
else
    menu[2] = "HAZARDS:[spr_checkmark,0]";

menu[3] = "BACK";
timeropt[0] = "OFF";
timeropt[1] = "2:00";
timeropt[2] = "5:00";
moving = [false, false, false];
leaveButt = 88;
cursorLevitate = 0;
s_cursor = s_mnu_pizzaboy;
cursorTime = 0;
leviRate = 1.5;
selected = 0;

if (global.timeron == false)
{
    timerselected = 0;
}
else if (global.timer == "2:00")
{
    timerselected = 1;
    menu[0] = "TIMER: 2:00";
}
else
{
    timerselected = 2;
    menu[0] = "TIMER: 5:00";
}

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
