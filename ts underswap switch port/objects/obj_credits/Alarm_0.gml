if (moveTitle < 1)
{
    moveTitle += 0.2;
    
    if (moveTitle >= 0.5 && !showBg)
    {
        showBg = true;
        
        if (global.credits_from_menu)
            var mus = music_lcplay("credits", false);
    }
    
    alarm[0] = 1;
}
else
{
    creditsY = 80 + lastOffsetY;
    drawCreditsText = true;
    alarm[1] = 1;
}
