if (!disabled)
{
    var dirMult = 1;
    
    if (alignment == 2)
        dirMult = -1;
    
    set_font(fnt_main);
    collide = collision_rectangle(x, y, x + (string_length(text) * 12 * dirMult), y + 24, obj_dateheart, false, true);
    
    if (collide != -4)
    {
        textColor = 65535;
        
        if (global.control_confirm_pressed)
            event_user(0);
    }
    else if (!selected)
    {
        textColor = 16777215;
    }
}

if (sbMade)
{
    if (!instance_exists(obj_speechbubble))
    {
        with (obj_battlemanager)
            endAttackMode();
    }
}
