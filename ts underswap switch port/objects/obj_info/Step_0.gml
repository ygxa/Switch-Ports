if (global.control_cancel && alarm[0] > 5)
    alarm[0] -= 2;

if (global.control_cancel_pressed && alarm[0] > 10)
    alarm[0] -= 8;

switch (state)
{
    case 0:
        if (alpha < 1)
        {
            alpha += 0.05;
        }
        else
        {
            state = 1;
            alpha = 0;
            alarm[0] = 60;
        }
        
        break;
    
    case 1:
        if (go)
        {
            if (alpha < 1)
            {
                alpha += 0.05;
            }
            else
            {
                state = 2;
                alpha = 0;
                go = false;
                alarm[0] = 100;
            }
        }
        
        break;
    
    case 2:
        if (go)
        {
            if (alpha < 1)
            {
                alpha += 0.05;
            }
            else
            {
                state = 3;
                alpha = 0;
                go = false;
                alarm[0] = 100;
            }
        }
        
        break;
    
    case 3:
        if (go)
        {
            if (alpha < 1)
            {
                alpha += 0.05;
            }
            else
            {
                state = 4;
                alpha = 0;
                go = false;
                alarm[0] = 50;
            }
        }
        
        break;
    
    case 4:
        if (go)
        {
            if (alpha < 1)
            {
                alpha += 0.05;
            }
            else
            {
                state = 5;
                alpha = 0;
                go = false;
                alarm[0] = 50;
            }
        }
        
        break;
    
    case 5:
        if (go)
        {
            if (alpha < 1)
            {
                alpha += 0.05;
            }
            else
            {
                state = 6;
                alpha = 1;
            }
        }
        
        break;
    
    case 6:
        timer++;
        
        if (timer >= 300 || global.control_confirm_pressed || global.control_cancel_pressed)
            state = 7;
        
        break;
    
    case 7:
        if (alpha > 0)
        {
            alpha -= 0.025;
        }
        else
        {
            state = 8;
            alarm[1] = 15;
        }
        
        break;
}
