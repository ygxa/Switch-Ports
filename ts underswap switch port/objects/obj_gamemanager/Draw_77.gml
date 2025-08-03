if (global.border == 0)
{
    if (global.debug)
    {
        if (obj_debugger.fullRoomView)
        {
            screenXOffset = 0;
            screenYOffset = 0;
            screenXScale = 1;
            screenYScale = 1;
        }
    }
    
    if (!hideScreen)
        defaultDrawScreen();
}
else
{
    if (texturegroup_get_status("borders") == 3)
    {
        if (borderFade == 0 && borderOverrideFade == 1)
            gpu_set_blendenable(false);
        
        if (currentBorderSprite != -1)
            drawBorder(currentBorderSprite, 1 - borderFade);
        
        if (borderFade != 0 && targetBorderSprite != -1)
            drawBorder(targetBorderSprite, borderFade);
        
        if (borderFade == 0 && borderOverrideFade == 1)
            gpu_set_blendenable(true);
    }
    
    if (!hideScreen)
        defaultDrawScreen();
}
