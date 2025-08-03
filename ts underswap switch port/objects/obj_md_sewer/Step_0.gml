siner += 0.16666666666666666;

if (siner >= (2 * pi))
    siner -= (2 * pi);

if (room == rm_ruins3 && hspeed != 0)
{
    if (x >= 80)
    {
        hspeed = 0;
        x = 80;
        scene_resume();
    }
}

if (active)
{
    with (obj_dodgemode_handler)
        cutscene = true;
    
    if (targetX != -1)
    {
        x = number_approach_smooth2(x, targetX, moveStep);
        y = number_approach_smooth2(y, targetY, moveStep);
        moveStep += (firstTime ? 0.01 : 0.025);
        
        if (moveStep >= 1 || (abs(targetX - x) <= 4 && abs(targetY - y) <= 4))
        {
            targetX = -1;
            
            if (firstTime)
            {
                firstTime = false;
                alarm[0] = 10;
                alarm[1] = 40;
            }
        }
    }
    
    if (targetX == -1 && bridgeX == -1)
    {
        var zone;
        
        with (obj_player)
            zone = instance_place(x, y, obj_ruins_mdzone);
        
        if (zone != -4)
        {
            var i = irandom(array_length(zone.flyX) - 1);
            targetX = (zone.flyX[i] + irandom(30)) - 15;
            targetY = (zone.flyY[i] + irandom(30)) - 15;
            moveStep = 0;
        }
    }
}
