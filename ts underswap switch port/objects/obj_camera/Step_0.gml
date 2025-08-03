obj_gamemanager.customViewMode = true;

if (started)
{
    x += xChange;
    y += yChange;
    counter++;
    
    if (counter < time && canAdvance && global.control_cancel)
    {
        counter++;
        x += xChange;
        y += yChange;
    }
    
    if (counter >= time)
    {
        started = false;
        x = targetX;
        y = targetY;
        counter = 0;
        
        if (resumeSceneAtEnd)
            scene_resume();
        
        if (resetAtEnd)
        {
            obj_gamemanager.customViewMode = false;
            instance_destroy();
        }
        else if (destroyAtEnd)
        {
            instance_destroy();
        }
    }
}

camera_set_view_pos(view_get_camera(0), round(x), round(y));
