if (ind != -1 && !disabled)
{
    var dirMult = 1;
    
    if (alignment == 2)
        dirMult = -1;
    
    set_font(fnt_main);
    
    if (alignment == 1)
    {
        var len = string_length(text) * 6;
        collide = collision_rectangle(x - len, y - 12, x + len, y + 12, obj_battleheart, false, true);
    }
    else
    {
        collide = collision_rectangle(x, y - 12, x + (string_length(text) * 12 * dirMult), y + 12, obj_battleheart, false, true);
    }
    
    if (collide != -4)
    {
        with (obj_lesserdog_dir_bul)
            disabled = true;
        
        textColor = 32768;
        event_user(0);
    }
}
else if (waitForBox)
{
    if (!obj_battlemanager.isBoxMoving)
    {
        scene_resume();
        
        with (obj_lesserdog_dir_bul)
            instance_destroy();
    }
}
