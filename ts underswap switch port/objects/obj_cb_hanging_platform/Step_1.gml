var preAttach = attach;
event_inherited();

if (inactiveFrames > 0)
{
    inactiveFrames--;
    exit;
}

if (!approachOffset && currentlyColliding && attach)
{
    approachOffset = true;
    approachProgress = 0;
    ystart = y;
    approachTargY = y + offsetY;
    
    if (!reallySlow)
    {
        with (obj_battleheart_blue)
            delayJump = true;
    }
}

var dy = undefined;

if (approachOffset)
{
    approachProgress += approachOffsetSpd;
    
    if (approachProgress >= 1)
        approachProgress = 1;
    
    var origY = y;
    y = floor(lerp(ystart, approachTargY, animcurve_channel_evaluate(animcurve_get_channel(acv_fasttoslow, 0), approachProgress)));
    dy = y - origY;
    
    if (currentlyColliding || attach)
    {
        with (obj_battleheart_blue)
        {
            y += dy;
            
            if (!other.reallySlow)
            {
                if (other.approachProgress >= 0.7)
                    delayJump = false;
            }
        }
    }
}

if (preAttach && !attach)
{
    with (obj_battleheart_blue)
    {
        if (!other.reallySlow)
        {
            delayJump = false;
            
            if (dy != undefined)
                upwardsYeet = -dy;
        }
    }
}
