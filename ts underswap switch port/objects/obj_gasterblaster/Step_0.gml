if (hover)
{
    hoverSiner += 0.1;
    y = ystart + (sin(hoverSiner) * 2);
}

if (fakeFireVisuals != 0)
{
    if (fakeFireVisuals == 1)
    {
        if (image_index == 4)
            image_index = 5;
        else if (image_index < 4)
            image_index++;
        else
            image_index = 4;
    }
    else if (floor(image_index) > 0)
    {
        image_index -= 0.5;
    }
    else
    {
        image_index = 0;
    }
}

if (state == 2 || state == 4)
    exit;

if (state == 0)
{
    if (rotateAfter)
    {
        x = lerp(xstart, destX[0], animcurve_channel_evaluate(animcurve_get_channel(destX[1], 0), approachTimer / 10));
        y = lerp(ystart, destY[0], animcurve_channel_evaluate(animcurve_get_channel(destY[1], 0), approachTimer / 10));
        
        if (approachTimer == 10)
        {
            x = destX[0];
            y = destY[0];
            state = 2;
            alarm[4] = 2;
            approachTimer = 0;
        }
        else
        {
            approachTimer++;
        }
    }
    else
    {
        x = lerp(xstart, destX[0], animcurve_channel_evaluate(animcurve_get_channel(destX[1], 0), approachTimer / 10));
        y = lerp(ystart, destY[0], animcurve_channel_evaluate(animcurve_get_channel(destY[1], 0), approachTimer / 10));
        image_angle = lerp(0, destAngle[0], animcurve_channel_evaluate(animcurve_get_channel(destAngle[1], 0), approachTimer / 10));
        
        if (approachTimer == 10)
        {
            x = destX[0];
            y = destY[0];
            image_angle = destAngle[0];
            state = 4;
            alarm[4] = delay;
        }
        else
        {
            approachTimer++;
        }
    }
}

if (state == 3)
{
    image_angle = lerp(0, destAngle[0], animcurve_channel_evaluate(animcurve_get_channel(destAngle[1], 0), approachTimer / 10));
    
    if (approachTimer == 0)
    {
        image_angle = destAngle[0];
        state = 4;
        alarm[4] = delay;
        approachTimer = 0;
    }
    else
    {
        approachTimer++;
    }
}

if (state == 5)
{
    state = 6;
    alarm[4] = 4;
}

if (state == 6)
    image_index++;

if (state == 7)
{
    x += xBlastSpeed;
    
    if (image_index == 4)
        image_index = 5;
    else if (image_index == 5)
        image_index = 4;
    
    direction = destAngle[0] + 90;
    
    if (bulletTimer == 0)
    {
        sfx_play_ext(snd_rainbowbeam_1, 0.8, 1.2, 81, false);
        sfx_play_ext(snd_a_gigatalk, 0.6, 1.2, 80, false);
    }
    
    if (bulletTimer == 0 && image_xscale >= 2)
        view_shake(8, 1);
    
    bulletTimer += 1;
    
    if (bulletTimer < 5)
    {
        speed++;
        blastThicc += floor((35 * image_xscale) / 4);
    }
    else
    {
        speed += 4;
    }
    
    if (bulletTimer > (5 + terminal))
    {
        blastThicc *= 0.8;
        fade -= 0.1;
        
        if (blastThicc <= 2)
        {
            instance_destroy();
            exit;
        }
    }
    
    if (x < -sprite_width)
        speed = 0;
    else if (x > (room_width + sprite_width))
        speed = 0;
    
    if (y < -sprite_height)
        speed = 0;
    else if (y > (room_height + sprite_height))
        speed = 0;
    
    bbsiner++;
    bb = (sin(bbsiner / 1.5) * blastThicc) / 4;
    var beamDir = image_angle - 90;
    var scaleFactor = image_xscale / 2;
    var xx = lengthdir_x(70, beamDir) * scaleFactor;
    var yy = lengthdir_y(70, beamDir) * scaleFactor;
    var xxx = lengthdir_x(800, beamDir);
    var yyy = lengthdir_y(800, beamDir);
    var nx_factor = lengthdir_x(1, image_angle);
    var ny_factor = lengthdir_y(1, image_angle);
    
    if (collisionsOn && fade >= 0.8 && !handledDamageThisFrame)
    {
        var thicc = blastThicc * 0.125;
        var xthicc = nx_factor * thicc;
        var ythicc = ny_factor * thicc;
        
        for (var cl = 0; cl < 4; cl++)
        {
            if (global.debug)
                array_push(obj_debugger.debugLineDraws, [(x + xx) - (xthicc * cl), (y + yy) - (ythicc * cl), (x + xxx) - (xthicc * cl), (y + yyy) - (ythicc * cl)]);
            
            if (collision_line((x + xx) - (xthicc * cl), (y + yy) - (ythicc * cl), (x + xxx) - (xthicc * cl), (y + yyy) - (ythicc * cl), obj_battleheart, false, true))
            {
                event_user(0);
                
                with (obj_gasterblaster)
                    handledDamageThisFrame = true;
                
                break;
            }
        }
        
        for (var cl = 0; cl < 4; cl++)
        {
            if (global.debug)
                array_push(obj_debugger.debugLineDraws, [x + xx + (xthicc * cl), y + yy + (ythicc * cl), x + xxx + (xthicc * cl), y + yyy + (ythicc * cl)]);
            
            if (collision_line(x + xx + (xthicc * cl), y + yy + (ythicc * cl), x + xxx + (xthicc * cl), y + yyy + (ythicc * cl), obj_battleheart, false, true))
            {
                event_user(0);
                
                with (obj_gasterblaster)
                    handledDamageThisFrame = true;
                
                break;
            }
        }
    }
    
    if (!collisionsOn)
        collisionsOn = true;
}
