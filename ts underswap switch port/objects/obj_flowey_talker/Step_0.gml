if (rising)
{
    if (floor(image_index) >= (image_number - 1))
    {
        image_speed = 0;
        image_index = image_number - 1;
        rising = false;
    }
}

if (sinking)
{
    if (floor(image_index) >= (image_number - 1))
    {
        image_speed = 0;
        image_index = image_number - 1;
        sinking = false;
    }
}

if (writer != -4 && instance_exists(writer))
{
    if (!writer.isDone)
    {
        portraitIndex += 0.25;
        
        if (floor(portraitIndex) >= 2)
            portraitIndex -= 2;
        
        writer.doSkip(nextLine);
        nextLine = false;
    }
    else
    {
        if (floor(portraitIndex) > 0)
            portraitIndex += 0.25;
        
        if (floor(portraitIndex) >= 2)
            portraitIndex = 0;
        
        nextLine = true;
        
        if (global.control_confirm_pressed || global.insta_stop_next_line || (global.ctoskip && global.control_menu))
        {
            global.insta_stop_next_line = false;
            scene_resume();
        }
    }
}
else
{
    if (floor(portraitIndex) > 0)
        portraitIndex += 0.25;
    
    if (floor(portraitIndex) >= 2)
        portraitIndex = 0;
}

if (restartGame)
    game_restart_safe();
