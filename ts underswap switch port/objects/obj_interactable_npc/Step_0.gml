event_inherited();

if (disableBaseNPCStep)
    exit;

event_user(15);

if (global.currentnpc == id)
{
    if (alwaysAnimateImageSpeed != -1)
        image_speed = alwaysAnimateImageSpeed;
    else if (instance_exists(obj_overworldui.writer) && !obj_overworldui.writer.isDone)
        image_speed = 0.2;
    else if (floor(image_index) == 0)
        image_speed = 0;
}
else if (!overrideNonTalk)
{
    if (defaultDirection != 4)
        lookDirection = defaultDirection;
    
    if (alwaysAnimateImageSpeed != -1)
        image_speed = alwaysAnimateImageSpeed;
    else
        image_index = 0;
}

if (stepFunction != undefined)
    stepFunction();
