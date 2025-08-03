depth = -10;
canMove = false;
baseMoveSpeed = 4;
moveSpeed = 4;
type = 0;
invincibilityTimer = 0;
invincibilityBuff = 0;
gotoX = -1;
gotoY = -1;
gotoXChange = 0;
gotoYChange = 0;
gotoMode = false;
beforeX = x;
beforeY = y;
disableSlow = false;
wasMoving = false;
lastHurtSfx = -1;
hitCycle = 0;

damage = function(argument0, argument1)
{
    if (argument1 == 1 && (obj_battlemanager.statsKarmaHandler != undefined || invincibilityTimer == 0))
    {
        if (global.difficulty <= 0)
        {
            if (hitCycle != 0)
                argument1 = 0;
            
            if (obj_battlemanager.statsKarmaHandler != undefined)
                hitCycle = (hitCycle + 1) % 3;
            else
                hitCycle = (hitCycle + 1) % 2;
        }
        else if (global.difficulty <= 0.1)
        {
            if (hitCycle != 0)
                argument1 = 0;
            
            hitCycle = (hitCycle + 1) % 2;
        }
    }
    
    if (obj_battlemanager.statsKarmaHandler != undefined)
    {
        invincibilityTimer = 30 + invincibilityBuff;
        player_health(-argument1);
        
        with (argument0)
            event_user(1);
        
        if (global.playerhp > 0 && !sfx_played_this_frame(snd_hurt))
        {
            if (lastHurtSfx != -1)
                audio_stop_sound(lastHurtSfx);
            
            lastHurtSfx = sfx_play(snd_hurt);
        }
        
        image_speed = 0.3;
    }
    else if (invincibilityTimer == 0)
    {
        invincibilityTimer = 30 + invincibilityBuff;
        player_health(-argument1);
        
        with (argument0)
            event_user(1);
        
        if (global.playerhp > 0)
            lastHurtSfx = sfx_play(snd_hurt);
        
        view_shake(2, 2);
        image_speed = 0.3;
    }
};

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
