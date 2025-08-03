rising = false;
sinking = false;
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
restartGame = false;
portraitIndex = 0;
writer = -4;
textSound = snd_floweyblip;
textSpeed = 1;
canSkip = true;
nextLine = true;
obj_gamemanager.bindTextHandler(function(argument0)
{
    argument0 = format_text_basic(argument0);
    
    if (writer == -4 || !instance_exists(writer))
    {
        writer = instance_create(obj_writer);
        writer.draw = false;
        writer.skippable = canSkip;
    }
    
    writer.resume();
    writer.message = argument0;
    writer.sound = textSound;
    writer.textSpeed = textSpeed;
    
    if (portraitIndex == 0)
        portraitIndex = 1;
    
    return true;
});
