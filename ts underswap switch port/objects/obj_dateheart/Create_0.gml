canMove = true;
baseMoveSpeed = 4;
moveSpeed = 4;
image_speed = 0;
disableSlow = false;
wasMoving = false;
boundsX = [0, 620];
boundsY = [0, 304];
invincibilityTimer = 0;
invincibilityBuff = 0;

slowCheck = function()
{
    if (canMove)
    {
        if (!wasMoving)
        {
            wasMoving = true;
            disableSlow = global.control_cancel;
        }
        else if (global.control_cancel_released)
        {
            disableSlow = false;
        }
    }
    else
    {
        wasMoving = false;
        disableSlow = false;
    }
};

hitCycle = 0;

damage = function(argument0)
{
    if (instance_exists(obj_hitthetarget))
    {
        if (invincibilityTimer == 0)
        {
            var hit = true;
            
            if (global.difficulty <= 0)
            {
                if (hitCycle != 0)
                    hit = false;
                
                hitCycle = (hitCycle + 1) % 3;
            }
            else if (global.difficulty <= 0.1)
            {
                if (hitCycle != 0)
                    hit = false;
                
                hitCycle = (hitCycle + 1) % 2;
            }
            
            invincibilityTimer = 30 + invincibilityBuff;
            
            if (hit)
            {
                with (obj_hitthetarget)
                {
                    gameLives -= 1;
                    
                    if (gameLives == 0)
                        endGame();
                }
            }
            
            with (argument0)
                event_user(1);
            
            sfx_play(snd_hurt);
            
            if (obj_hitthetarget.gameLives != 0)
            {
                view_shake(2, 2);
                image_speed = 0.3;
            }
            else
            {
                invincibilityTimer = 0;
                image_speed = 0;
                image_index = 0;
            }
        }
        
        if (global.debug)
        {
            if (obj_debugger.invincible)
                obj_hitthetarget.gameLives = 3;
        }
    }
};
