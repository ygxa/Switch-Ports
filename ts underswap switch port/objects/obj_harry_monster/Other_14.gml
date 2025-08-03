if (global.bev_subtype == 1)
{
    if (isRuth)
    {
        with (obj_battledamage)
            progressBattle = false;
        
        with (obj_battletarget)
            doFade = true;
        
        bt_set_boxtype((0 << 0));
        
        with (obj_battlemanager)
        {
            mainState = (5 << 0);
            subState = 0;
            drawableText = "";
            
            with (writer)
                instance_destroy();
            
            writer = -4;
            dx_scene("battles.boogie.heal_harry");
        }
    }
    else
    {
        isActive = false;
        forceDrawSelf = true;
        alarm[9] = 15;
        vwasdowned = true;
    }
}
else
{
    event_inherited();
}
