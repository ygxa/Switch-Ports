if (overrideFade < 1)
{
    overrideFade += 0.05;
    
    if (writer != -4)
        writer.alpha = overrideFade;
    
    alarm[4] = 1;
}
else
{
    overrideFade = 1;
    
    if (writer != -4)
        writer.alpha = 1;
}
