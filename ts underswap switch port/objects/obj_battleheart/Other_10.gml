switch (obj_battlemanager.mainState)
{
    case (1 << 0):
    case (10 << 0):
        y = 445;
        
        switch (obj_battlemanager.selectionX)
        {
            case 0:
                x = 43;
                break;
            
            case 1:
                x = 198;
                break;
            
            case 2:
                x = 353;
                break;
            
            case 3:
                x = 503;
                break;
        }
        
        break;
    
    case (2 << 0):
        switch (obj_battlemanager.selectedButton)
        {
            case (0 << 0):
            case (3 << 0):
            case (2 << 0):
                if (obj_battlemanager.subState == 0)
                {
                    x = 64;
                    y = 278 + (obj_battlemanager.selectionY * 32);
                }
                
                break;
            
            case (1 << 0):
                if (obj_battlemanager.subState == 0)
                {
                    x = 64;
                    y = 278 + (obj_battlemanager.selectionY * 32);
                }
                else
                {
                    x = 64 + (obj_battlemanager.selectionX * 256);
                    
                    if (obj_battlemanager.selectionX == 1 && obj_battlemanager.selectionY == 0)
                        x += global.lang_data[global.lang_bound].offsets.act_topright;
                    
                    y = 278 + (obj_battlemanager.selectionY * 32);
                }
                
                break;
        }
        
        break;
}
