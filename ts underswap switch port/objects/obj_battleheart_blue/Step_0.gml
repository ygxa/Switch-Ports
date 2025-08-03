slowCheck();

if (canMove)
{
    moveSpeed = (global.control_cancel && !disableSlow) ? (baseMoveSpeed * 0.5) : baseMoveSpeed;
    var right, left;
    
    if (cbRotateControls)
    {
        left = global.control_up;
        right = global.control_down;
    }
    else
    {
        left = global.control_left;
        right = global.control_right;
    }
    
    var down, up;
    
    if (fallVertMode)
    {
        down = false;
        up = false;
        jumpState = 2;
        soulGrav = 0;
    }
    else
    {
        down = global.control_down;
        up = global.control_up;
    }
    
    var targetX, targetY;
    
    switch (soulDir)
    {
        case 1:
        case 0:
            var jumpKey, gravMult;
            
            if (soulDir == 0)
            {
                gravMult = -1;
                jumpKey = down;
            }
            else
            {
                gravMult = 1;
                jumpKey = up;
            }
            
            targetX = x + (moveSpeed * ((right ? 1 : 0) - (left ? 1 : 0)));
            listenForDash();
            listenForJump(jumpKey);
            targetY = y + (soulGrav * gravMult);
            break;
        
        case 2:
        case 3:
            var jumpKey, gravMult;
            
            if (soulDir == 2)
            {
                gravMult = -1;
                jumpKey = right;
            }
            else
            {
                gravMult = 1;
                jumpKey = left;
            }
            
            targetY = y + (moveSpeed * ((down ? 1 : 0) - (up ? 1 : 0)));
            listenForDash();
            listenForJump(jumpKey);
            targetX = x + (soulGrav * gravMult);
            break;
    }
    
    targetX += dashXSpd;
    
    if (dashYSpd == 0)
    {
        if (fallVertMode)
            targetY = number_approach_linear(targetY, obj_battlemanager.boxY1 + fallVertPos, 2);
    }
    else
    {
        targetY += dashYSpd;
    }
    
    if (upwardsYeet != 0 && jumpState == 2)
    {
        var originalSign = sign(upwardsYeet);
        var multiplier = (originalSign == 1) ? 0.6 : 1.2;
        
        if (upwardsYeet < -8)
            upwardsYeet = -8;
        
        targetY -= upwardsYeet;
        
        if (abs(upwardsYeet) > 6)
            upwardsYeet -= (originalSign * multiplier * ((upwardsYeet - 6) / 6));
        
        upwardsYeet -= (originalSign * multiplier);
        
        if (originalSign != sign(upwardsYeet))
            upwardsYeet = 0;
    }
    else
    {
        upwardsYeet = 0;
    }
    
    var originalX = x;
    var originalY = y;
    var colLeft = obj_battlemanager.boxX1 + 5;
    var colRight = obj_battlemanager.boxX2 - 5 - sprite_width;
    var colTop = obj_battlemanager.boxY1 + 5;
    var colBottom = obj_battlemanager.boxY2 - 5 - sprite_height;
    
    if (targetX > colLeft && targetX < colRight)
    {
        x = targetX;
    }
    else
    {
        x = clamp(targetX, colLeft, colRight);
        
        if (cbBorderDamage && slamming)
        {
            if (global.playerhp > 1)
            {
                if (!sfx_played_this_frame(snd_hurt))
                {
                    audio_stop_sound(snd_hurt);
                    sfx_play(snd_hurt, 6);
                }
                
                global.playerhp--;
            }
        }
        
        if ((soulDir == 2 && targetX < colLeft) || (soulDir == 3 && targetX > colRight))
        {
            dashXSpd = 0;
            
            if (slamming && jumpState != 1)
            {
                slamming = false;
                
                if (!sfx_played_this_frame(snd_bang))
                {
                    audio_stop_sound(snd_bang);
                    sfx_play(snd_bang);
                }
                
                view_shake(3, 2);
            }
            
            jumpState = 1;
            soulGrav = 0;
        }
        else if ((soulDir == 2 && targetX > colRight) || (soulDir == 3 && targetX < colLeft))
        {
            if (soulGrav < -1)
                soulGrav = -1;
        }
    }
    
    if (targetY > colTop && targetY < colBottom)
    {
        y = targetY;
    }
    else
    {
        y = clamp(targetY, colTop, colBottom);
        
        if (cbBorderDamage && slamming)
        {
            if (global.playerhp > 1)
            {
                if (!sfx_played_this_frame(snd_hurt))
                {
                    audio_stop_sound(snd_hurt);
                    sfx_play(snd_hurt, 6);
                }
                
                global.playerhp--;
            }
        }
        
        if ((soulDir == 1 && targetY > colBottom) || (soulDir == 0 && targetY < colTop))
        {
            dashYSpd = 0;
            
            if (slamming && jumpState != 1)
            {
                slamming = false;
                sfx_play(snd_bang);
                view_shake(3, 2);
            }
            
            jumpState = 1;
            soulGrav = 0;
        }
        else if ((soulDir == 1 && targetY < colTop) || (soulDir == 1 && targetY > colBottom))
        {
            if (soulGrav < -1)
                soulGrav = -1;
        }
    }
    
    var dist = point_distance(originalX, originalY, x, y);
    var angle = point_direction(originalX, originalY, x, y);
    var unitX = lengthdir_x(1, angle);
    var unitY = lengthdir_y(1, angle);
    var checkX = originalX;
    var checkY = originalY;
    var foundCollision = false;
    
    repeat (max(1, floor(dist)))
    {
        with (obj_cb_platform)
        {
            if (rectangle_in_rectangle((x - len) + 2, y + 2, (x + len) - 2, y - 4, checkX, checkY, checkX + 16, checkY + 16))
            {
                currentlyColliding = true;
                foundCollision = true;
                
                with (other)
                {
                    if (soulGrav >= 0 && dashYSpd >= 0 && checkY <= (other.y - 11))
                    {
                        other.attach = true;
                        y = other.y - 16;
                        jumpState = 1;
                        soulGrav = 0;
                    }
                    
                    if (other.attach)
                    {
                        x += other.hspeed;
                        y += other.vspeed;
                    }
                }
            }
            else
            {
                currentlyColliding = false;
            }
        }
        
        if (foundCollision)
            break;
        
        checkX += unitX;
        checkY += unitY;
    }
    
    x = clamp(x, colLeft, colRight);
    y = clamp(y, colTop, colBottom);
    var processedX = x;
    var processedY = y;
    var angleOff;
    
    switch (soulDir)
    {
        case 1:
            angleOff = 0;
            processedX = floor(processedX);
            break;
        
        case 0:
            angleOff = 180;
            processedX = floor(processedX);
            break;
        
        case 2:
            angleOff = 270;
            processedY = floor(processedY);
            break;
        
        case 3:
            angleOff = 90;
            processedY = floor(processedY);
            break;
    }
    
    if (slamming)
    {
        with (instance_create_depth(x + 8, y + 8, depth + 1, obj_afterimage))
        {
            image_alpha = 1;
            sprite_index = spr_bluesoul_centered_afterimage;
            image_angle = angleOff;
            cutoff = other.cutoff;
            fadeSpeed = 0.15;
            scaleSpeed = 0.1;
            transformable = true;
        }
    }
    else if (dashing && dashFrameCounter < dashFrames)
    {
        with (instance_create_depth(x + 8, y + 8, depth + 1, obj_afterimage_fader))
        {
            image_alpha = other.dashAlpha;
            sprite_index = spr_bluesoul_centered_afterimage;
            image_angle = other.dashAngle + angleOff;
            cutoff = other.cutoff;
            transformable = true;
        }
    }
}
else
{
    delayJump = false;
    upwardsYeet = 0;
    dashXSpd = 0;
    dashYSpd = 0;
    dashAlpha = 0;
    dashAngle = 0;
    dashing = false;
    dashCooldown = 8;
    dashFrameCounter = 0;
    slamming = false;
    soulDir = 1;
}

event_inherited();
