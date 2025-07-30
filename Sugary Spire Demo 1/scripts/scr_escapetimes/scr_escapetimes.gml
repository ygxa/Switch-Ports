function scr_escapetimes(argument0 = room)
{
    var seconds = 0;
    var minutes = 0;
    
    switch (argument0)
    {
        case 43:
            minutes = 4;
            seconds = 0;
            break;
        
        case 27:
            minutes = 2;
            seconds = 30;
            break;
        
        case 58:
            minutes = 5;
            seconds = 0;
            break;
        
        case 97:
            minutes = 4;
            seconds = 50;
            break;
        
        case 108:
            minutes = 1;
            seconds = 30;
            break;
        
        default:
            minutes = 0;
            seconds = 10;
            break;
    }
    
    var time_array;
    time_array[0] = minutes;
    time_array[1] = seconds;
    return time_array;
}
