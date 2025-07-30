name = ">";

stepfunc = function()
{
    if (selected)
    {
        global.buttonrgb3 += 1;
        
        if (global.buttonrgb3 > 255)
            global.buttonrgb3 = 0;
    }
};
