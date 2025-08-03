if (!disabled)
{
    var dirMult = 1;
    
    if (alignment == 2)
        dirMult = -1;
    
    set_font(fnt_main);
    collide = collision_rectangle(x, y, x + (string_length(text) * 12 * dirMult), y + 24, obj_battleheart, false, true);
    
    if (collide != -4)
    {
        with (obj_beenard_name_bul)
            disabled = true;
        
        textColor = 32768;
        event_user(0);
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
