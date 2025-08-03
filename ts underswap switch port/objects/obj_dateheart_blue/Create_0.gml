event_inherited();
soulDir = 1;
jumpState = 2;
soulGrav = 0;
type = 1;
canDash = true;
dashing = false;
dashSpeed = 4;
dashFrameCounter = 0;
dashFrames = 10;
dashCooldown = 8;
dashMaxCooldown = 4;
dashXSpd = 0;
dashYSpd = 0;
fallVertMode = false;
fallVertPos = 40;
delayJump = false;
upwardsYeet = 0;
dashX = x;
dashY = y;
dashAngle = 0;
dashAlpha = 0;
cutoff = false;

function listenForJump(argument0)
{
    switch (jumpState)
    {
        case 1:
            if (delayJump)
                break;
            
            if (argument0 && soulGrav == 0)
            {
                jumpState = 2;
                soulGrav = -6;
            }
            
            break;
        
        case 2:
            if (!argument0 && soulGrav <= -1)
                soulGrav = -1;
            
            if (soulGrav > 0.5 && soulGrav < 8)
                soulGrav += 0.6;
            
            if (soulGrav > -1 && soulGrav <= 0.5)
                soulGrav += 0.2;
            
            if (soulGrav > -4 && soulGrav <= -1)
                soulGrav += 0.5;
            
            if (soulGrav <= -4)
                soulGrav += 0.2;
            
            break;
    }
    
    if (dashing && dashFrameCounter < dashFrames)
    {
        if ((soulDir == 1 && dashYSpd <= 0) || (soulDir == 0 && dashYSpd >= 0) || (soulDir == 3 && dashXSpd <= 0) || (soulDir == 2 && dashXSpd >= 0))
            soulGrav = 0;
    }
}

function listenForDash()
{
    var left = global.control_left;
    var right = global.control_right;
    var down, up;
    
    if (fallVertMode)
    {
        down = false;
        up = false;
    }
    else
    {
        down = global.control_down;
        up = global.control_up;
    }
    
    var z = global.control_confirm_pressed;
    var dashFriction = dashSpeed / dashFrames;
    dashCooldown++;
    
    if (dashing)
    {
        if (dashXSpd > 0)
            dashXSpd -= dashFriction;
        else if (dashXSpd < 0)
            dashXSpd += dashFriction;
        
        if (dashYSpd > 0)
            dashYSpd -= dashFriction;
        else if (dashYSpd < 0)
            dashYSpd += dashFriction;
        
        dashFrameCounter++;
        
        if (dashAngle < 360)
            dashAngle += (360 / dashFrames);
        
        if (jumpState == 1)
        {
            dashXSpd = 0;
            dashYSpd = 0;
            dashAlpha = 0;
            dashAngle = 0;
            dashing = false;
            dashCooldown = 0;
        }
    }
    else if (canDash && dashCooldown >= dashMaxCooldown && jumpState == 2 && z)
    {
        dashAlpha = 1;
        dashAngle = 0;
        sfx_play(snd_mushroom, 80, false);
        view_shake(1, 2);
        soulGrav = 0;
        dashing = true;
        dashFrameCounter = 0;
        
        if (left && !right)
        {
            if (soulDir == 2)
            {
                soulGrav = 1;
                dashXSpd = -1.5 * dashSpeed;
            }
            else if (soulDir == 3)
            {
                dashXSpd = -1.5 * dashSpeed;
            }
            else
            {
                dashXSpd = -1 * dashSpeed;
            }
        }
        else if (right && !left)
        {
            if (soulDir == 3)
            {
                soulGrav = 1;
                dashXSpd = 1.5 * dashSpeed;
            }
            else if (soulDir == 2)
            {
                dashXSpd = 1.5 * dashSpeed;
            }
            else
            {
                dashXSpd = dashSpeed;
            }
        }
        else
        {
            dashXSpd = 0;
        }
        
        if (down && !up)
        {
            if (soulDir == 1)
            {
                soulGrav = 1;
                dashYSpd = 1.5 * dashSpeed;
            }
            else if (soulDir == 0)
            {
                dashYSpd = 1.5 * dashSpeed;
            }
            else
            {
                dashYSpd = dashSpeed;
            }
        }
        else if (up && !down)
        {
            if (soulDir == 0)
            {
                soulGrav = 1;
                dashYSpd = -1.5 * dashSpeed;
            }
            else if (soulDir == 1)
            {
                dashYSpd = -1.5 * dashSpeed;
            }
            else
            {
                dashYSpd = -1 * dashSpeed;
            }
        }
        else
        {
            dashYSpd = 0;
        }
    }
    
    if (dashAlpha > 0)
    {
        dashX = x + dashXSpd;
        dashY = y + dashYSpd;
        dashAlpha -= 0.01;
    }
}
