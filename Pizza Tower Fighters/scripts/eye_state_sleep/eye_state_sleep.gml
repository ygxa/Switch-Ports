function eye_state_sleep()
{
    timer--;
    image_alpha = 0;
    
    if (timer == 0 && global.hazards != 0)
    {
        switch (currentlayout)
        {
            case 1:
                x = choose(100, 400, 800);
                y = choose(300, 200);
                break;
            
            case 2:
                x = 1404;
                y = 151;
                break;
            
            case 3:
                x = 1340;
                y = 242;
                break;
            
            case 4:
                x = 1200;
                y = 636;
                break;
        }
        
        state = (1 << 0);
    }
}
