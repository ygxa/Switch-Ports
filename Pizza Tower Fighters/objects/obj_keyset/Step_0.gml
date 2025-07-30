upbuffer--;

switch (player_set)
{
    case 1:
        if (keyboard_check_pressed(vk_anykey) && upbuffer < 0)
        {
            switch (state)
            {
                case (0 << 0):
                    global.keyboardp1up = keyboard_key;
                    break;
                
                case (1 << 0):
                    global.keyboardp1down = keyboard_key;
                    break;
                
                case (2 << 0):
                    global.keyboardp1left = keyboard_key;
                    break;
                
                case (3 << 0):
                    global.keyboardp1right = keyboard_key;
                    break;
                
                case (4 << 0):
                    global.keyboardp1key_jump = keyboard_key;
                    break;
                
                case (5 << 0):
                    global.keyboardp1key_tilt = keyboard_key;
                    break;
                
                case (6 << 0):
                    global.keyboardp1key_special = keyboard_key;
                    break;
                
                case (7 << 0):
                    global.keyboardp1key_taunt = keyboard_key;
                    break;
            }
            
            scr_updateoptionskeys();
            scr_saveinput();
            instance_destroy();
        }
        
        break;
    
    case 2:
        if (keyboard_check_pressed(vk_anykey) && upbuffer < 0)
        {
            switch (state)
            {
                case (0 << 0):
                    global.keyboardp2up = keyboard_key;
                    break;
                
                case (1 << 0):
                    global.keyboardp2down = keyboard_key;
                    break;
                
                case (2 << 0):
                    global.keyboardp2left = keyboard_key;
                    break;
                
                case (3 << 0):
                    global.keyboardp2right = keyboard_key;
                    break;
                
                case (4 << 0):
                    global.keyboardp2key_jump = keyboard_key;
                    break;
                
                case (5 << 0):
                    global.keyboardp2key_tilt = keyboard_key;
                    break;
                
                case (6 << 0):
                    global.keyboardp2key_special = keyboard_key;
                    break;
                
                case (7 << 0):
                    global.keyboardp2key_taunt = keyboard_key;
                    break;
            }
            
            scr_updateoptionskeys();
            scr_saveinput();
            instance_destroy();
        }
        
        break;
}
