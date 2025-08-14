function scr_onscreen_tolerance(argument0, argument1)
{
    obj = argument0;
    spacer = argument1;
    
    if ((obj.x + obj.sprite_width + spacer) < camerax() || (obj.x - spacer) > (camerax() + 640) || (obj.y + obj.sprite_height + spacer) < cameray() || (obj.y - spacer) > (cameray() + 480))
        return false;
    else
        return true;
}

function camerax()
{
    return __view_get(e__VW.XView, 0);
}

function cameray()
{
    return __view_get(e__VW.YView, 0);
}

function camerawidth()
{
    return __view_get(e__VW.WView, 0);
}
