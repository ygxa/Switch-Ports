if (global.ostype == 1)
{
    if (debugMenu == (0 << 0))
    {
        if (mobileOrder < 4)
        {
            if (global.control_menu_pressed)
                mobileOrder++;
            else if (global.control_confirm_pressed || global.control_cancel_pressed || global.control_left || global.control_right || global.control_up || global.control_down)
                mobileOrder = 0;
        }
        else if (mobileOrder == 4)
        {
            if (global.control_cancel_pressed)
                mobileOrder++;
            else if (global.control_confirm_pressed || global.control_menu_pressed || global.control_left || global.control_right || global.control_up || global.control_down)
                mobileOrder = 0;
        }
        else if (mobileOrder == 5)
        {
            if (global.control_confirm_pressed)
                mobileOrder++;
            else if (global.control_cancel_pressed || global.control_menu_pressed || global.control_left || global.control_right || global.control_up || global.control_down)
                mobileOrder = 0;
        }
        
        if (mobileOrder == 6)
        {
            mobileOrder = 0;
            debugMenu = (1 << 0);
            debugMove = global.canmove;
            global.canmove = false;
            debugMenuSel = 0;
            debugBuffer = 2;
            label = false;
            exit;
        }
    }
}
