function scr_levelstart(argument0)
{
    switch (argument0)
    {
        case "entryway":
            global.srank = 12300;
            break;
        
        case "steamy":
            global.srank = 23000;
            break;
        
        case "molasses":
            global.srank = 23500;
            break;
        
        case "mines":
            global.srank = 26500;
            break;
        
        default:
            global.srank = 99999;
            break;
    }
    
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}
