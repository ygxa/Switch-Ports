var preAttach = attach;
event_inherited();

if (!approachOffset && currentlyColliding && attach)
{
    approachOffset = true;
    approachProgress = 0;
    approachTempX = 0;
}

if (approachOffset)
{
    approachProgress += approachOffsetSpd;
    
    if (approachProgress >= 1)
        approachProgress = 1;
    
    var origX = approachTempX;
    approachTempX = floor(offsetX * animcurve_channel_evaluate(animcurve_get_channel(acv_fasttoslow, 0), approachProgress));
    var dx = approachTempX - origX;
    x += dx;
    
    if (attach)
    {
        with (obj_battleheart_blue)
            x += dx;
    }
}
