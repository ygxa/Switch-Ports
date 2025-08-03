objectDebugSelected = -4;

if (objectDebug)
{
    window_set_cursor(cr_default);
    
    if (objectDebugCamera)
    {
        freecamX = 0;
        freecamY = 0;
    }
}
else
{
    objectDebugRelative = (0 << 0);
    objectDebugOverlays = true;
}
