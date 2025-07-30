name = "<";

stepfunc = function()
{
    if (selected)
    {
        global.buttonrgb2 -= 1;
        
        if (global.buttonrgb2 < 0)
            global.buttonrgb2 = 255;
    }
};
