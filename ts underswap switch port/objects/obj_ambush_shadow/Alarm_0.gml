if (flashCount == 5)
{
    var bul = instance_create_xy(x + 10, y + 15, obj_ambush_lightningbul);
    
    if (gateDestroyer)
    {
        var canOpenGate = true;
        
        if (obj_player.x >= 276)
        {
            if (obj_player.y >= 105 && obj_player.y <= 190)
            {
                with (obj_crys_gate)
                    failToOpen();
                
                canOpenGate = false;
            }
        }
        
        if (canOpenGate)
        {
            with (obj_crys_gate)
            {
                event_user(0);
                image_index = 3;
            }
            
            bul.gateDestroyer = true;
            bul.depth = obj_crys_gate.depth - 10;
        }
    }
    
    if (shake)
    {
        with (obj_dodgemode_handler)
        {
            shakeValue = 2;
            alarm[0] = 1;
        }
    }
    
    alarm[1] = 1;
}
else
{
    if (image_index == 5)
        image_index = 4;
    else
        image_index = 5;
    
    sfx_play(snd_alert);
    flashCount++;
    alarm[0] = 5;
}
