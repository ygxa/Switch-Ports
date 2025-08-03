if (screenFade > 0)
{
    screenFade -= 0.1;
    alarm[1] = 1;
}
else
{
    with (background)
    {
        enterBg = true;
        moveBg = true;
    }
    
    screenFade = 0;
}
