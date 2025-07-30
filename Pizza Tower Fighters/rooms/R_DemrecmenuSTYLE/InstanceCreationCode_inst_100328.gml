name = ">";

stepfunc = function()
{
    if (selected)
    {
        global.buttonrgb1 += 1;
        
        if (global.buttonrgb1 > 255)
            global.buttonrgb1 = 0;
    }
};
