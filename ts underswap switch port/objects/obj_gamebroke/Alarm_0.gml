if (currFade < 1)
{
    currFade += 0.05;
    alarm[0] = 1;
}
else
{
    if (currentLine >= 18)
    {
        showCheck = true;
        alarm[3] = 1;
    }
    
    alarm[1] = 60;
}
