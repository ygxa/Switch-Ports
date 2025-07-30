controller_initialize(global.P1controllerport);
cursorLevitate = dsin(cursorTime);
cursorTime += leviRate;
var vert = (keyboard_check_pressed(downButt) || stickDownPressed || dpadDownPress) - (keyboard_check_pressed(upButt) || stickUpPressed || dpadUpPress);

if (!instance_exists(O_Fade))
{
    if (vert != 0)
        audio_play_sound(su_menuscroll, 50, false);
}

selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt);
selected = clamp(selected, 0, array_length(menu) - 1);
var leave = keyboard_check_pressed(leaveButt);

if (!instance_exists(O_Fade))
{
    if (menu[selected] == "TIMER: OFF" || menu[selected] == "TIMER: 2:00" || menu[selected] == "TIMER: 5:00")
    {
        if (keyboard_check_pressed(leftButt) || stickLeftPressed || dpadLeftPress)
        {
            audio_play_sound(su_menuscroll, 50, false);
            
            if (timerselected > 0)
                timerselected--;
            
            if (timerselected == 0)
            {
                global.timeron = false;
                menu[0] = "TIMER: OFF";
            }
            
            if (timerselected == 1)
            {
                global.timer = "2:00";
                menu[0] = "TIMER: 2:00";
            }
        }
        
        if (keyboard_check_pressed(rightButt) || stickRightPressed || dpadRightPress)
        {
            audio_play_sound(su_menuscroll, 50, false);
            
            if (timerselected < 2)
                timerselected++;
            
            if (timerselected == 1)
            {
                global.timer = "2:00";
                global.timeron = true;
                menu[0] = "TIMER: 2:00";
            }
            
            if (timerselected == 2)
            {
                global.timer = "5:00";
                menu[0] = "TIMER: 5:00";
            }
        }
    }
    
    if (menu[selected] == "STOCKS: 1" || menu[selected] == "STOCKS: 2" || menu[selected] == "STOCKS: 3" || menu[selected] == "STOCKS: 4")
    {
        if (keyboard_check_pressed(leftButt) || stickLeftPressed || dpadLeftPress)
        {
            audio_play_sound(su_menuscroll, 50, false);
            
            if (global.stocks > 1)
                global.stocks--;
            
            switch (global.stocks)
            {
                case 1:
                    menu[1] = "STOCKS: 1";
                    break;
                
                case 2:
                    menu[1] = "STOCKS: 2";
                    break;
                
                case 3:
                    menu[1] = "STOCKS: 3";
                    break;
            }
        }
        
        if (keyboard_check_pressed(rightButt) || stickRightPressed || dpadRightPress)
        {
            audio_play_sound(su_menuscroll, 50, false);
            
            if (global.stocks < 4)
                global.stocks++;
            
            switch (global.stocks)
            {
                case 2:
                    menu[1] = "STOCKS: 2";
                    break;
                
                case 3:
                    menu[1] = "STOCKS: 3";
                    break;
                
                case 4:
                    menu[1] = "STOCKS: 4";
                    break;
            }
        }
    }
    
    if (selected == 2 && (keyboard_check_pressed(confirmButt) || buttonAPress))
    {
        if (menu[2] == "HAZARDS:[spr_checkmark,0]")
        {
            global.hazards = 1;
            menu[2] = "HAZARDS:[spr_checkmark,1]";
            audio_play_sound(su_select, 50, false);
        }
        else
        {
            global.hazards = 0;
            menu[2] = "HAZARDS:[spr_checkmark,0]";
            audio_play_sound(su_select, 50, false);
        }
    }
    
    if ((menu[selected] == "BACK" && (keyboard_check_pressed(confirmButt) || buttonAPress)) || (leave && !instance_exists(O_Fade)))
    {
        audio_play_sound(su_select, 50, false);
        
        if (!instance_exists(O_Fade))
            fadeToRoom(R_CharacterSelect, 20, 0);
        
        backingout = true;
    }
}
