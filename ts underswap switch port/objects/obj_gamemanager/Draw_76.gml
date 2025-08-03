if (global.gamebroke == -1)
{
    switch (ds_map_find_value(global.pflags_global, "box_border"))
    {
        case 1:
            global.uiborder = spr_menuparts_ut;
            break;
        
        default:
            global.uiborder = spr_menuparts;
            break;
    }
}

if (global.border != 0)
    texture_start_load("borders");

if (global.windowtype == 3)
{
    var dw = display_get_width();
    var dh = display_get_height();
    
    if (global.border == 0 && os_type != os_gxgames)
    {
        if (dw >= dh)
        {
            screenYScale = dh / 480;
            screenXScale = screenYScale;
            screenXOffset = floor((dw - floor(640 * screenXScale)) * 0.5);
            screenYOffset = 0;
        }
        else
        {
            screenXScale = dw / 640;
            screenYScale = screenXScale;
            screenYOffset = floor((dh - floor(480 * screenYScale)) * 0.5);
            screenXOffset = 0;
        }
        
        borderYScale = 1;
        borderXScale = 1;
        borderXOffset = 0;
        borderYOffset = 0;
    }
    else
    {
        borderXScale = dw / 960;
        borderYScale = borderXScale;
        borderXOffset = 0;
        borderYOffset = floor((dh - (borderYScale * 540)) * 0.5);
        screenXOffset = floor(160 * borderXScale);
        screenYOffset = floor(borderYOffset + (30 * borderYScale));
        screenXScale = (dw - (2 * screenXOffset)) / 640;
        screenYScale = screenXScale;
        var theoreticalScale = dh / 540;
        var theoreticalBorderXOff = floor((dw - (theoreticalScale * 960)) * 0.5);
        var theoreticalScreenXOff = floor(theoreticalBorderXOff + (160 * theoreticalScale));
        
        if ((global.fit_border_vertical || screenYOffset < (borderYScale * 4)) && theoreticalScreenXOff >= (theoreticalScale * 4))
        {
            borderYScale = theoreticalScale;
            borderXScale = theoreticalScale;
            borderXOffset = theoreticalBorderXOff;
            borderYOffset = 0;
            screenXOffset = theoreticalScreenXOff;
            screenYOffset = floor(30 * theoreticalScale);
            screenYScale = (dh - (2 * screenYOffset)) / 480;
            screenXScale = screenYScale;
        }
    }
}
else
{
    var ww = window_get_width();
    var wh = window_get_height();
    
    if (global.border == 0)
    {
        screenXScale = ww / 640;
        screenYScale = wh / 480;
        screenXOffset = 0;
        screenYOffset = 0;
        borderYScale = 1;
        borderXScale = 1;
        borderXOffset = 0;
        borderYOffset = 0;
    }
    else
    {
        borderXScale = ww / 960;
        borderYScale = wh / 540;
        borderXOffset = 0;
        borderYOffset = 0;
        screenXOffset = floor(160 * borderXScale);
        screenYOffset = floor(30 * borderYScale);
        screenXScale = (ww - (2 * screenXOffset)) / 640;
        screenYScale = (wh - (2 * screenYOffset)) / 480;
    }
}

display_set_gui_size(640, 480);
display_set_gui_maximise(screenXScale, screenYScale, screenXOffset, screenYOffset);
