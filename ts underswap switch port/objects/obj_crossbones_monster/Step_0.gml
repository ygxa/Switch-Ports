event_inherited();
actor_shake_logic();

if (shmoving)
{
    if (slowShmove)
        shmoveCounter += 0.75;
    else
        shmoveCounter++;
}
else
{
    shmoveCounter = 0;
}

if (freezeShmove)
    shmoveCounter = 0;

capeIndex += 0.25;

if (floor(capeIndex) >= 4)
    capeIndex -= 4;

eyeFlashInd += 0.5;

if (floor(eyeFlashInd) >= 2)
    eyeFlashInd -= 2;

if (dodgingState == 0 && (!phaseEnd || vfinalattemptkill) && (fightType != 2 || phase != 3))
{
    if (instance_exists(obj_attack_effect))
    {
        dodgingState = 1;
        xstart = x;
        dodgeSpd = -12;
        
        if (fightType == 2 && phase == 2 && !removedMask)
        {
            if (instance_exists(obj_pan_atk))
                dodgeDelay = 7;
            else if (instance_exists(obj_battlepunch))
                dodgeDelay = 9;
            else if (instance_exists(obj_battleslice))
                dodgeDelay = clamp(4.4 / obj_battleslice.image_speed, 9, 19);
            else
                dodgeDelay = 19;
        }
    }
}

switch (dodgingState)
{
    case 0:
        break;
    
    case 1:
        if (dodgeDelay > 0)
        {
            dodgeDelay--;
            break;
        }
        
        x += dodgeSpd;
        
        if (x < (xstart - 72))
        {
            if (dodgeSpd > 0)
            {
                dodgeSpd += 2;
            }
            else
            {
                dodgeSpd = 0;
                
                if (!instance_exists(obj_attack_effect))
                    dodgingState = 2;
            }
        }
        
        break;
    
    default:
        dodgingState++;
        break;
    
    case 22:
        x += dodgeSpd;
        
        if (x < xstart)
        {
            if (dodgeSpd < 12)
                dodgeSpd += 2;
            else
                dodgeSpd = 12;
        }
        else
        {
            dodgingState = 0;
            hspeed = 0;
            x = xstart;
        }
        
        break;
}

if (specialTextWriter != -4 && instance_exists(specialTextWriter))
{
    if (specialTextWriter.isDone && (global.control_confirm_pressed || (global.ctoskip && global.control_menu)))
    {
        instance_destroy(specialTextWriter);
        specialTextWriter = -4;
        scene_resume();
    }
}

if (glowAmount != 0)
{
    glowSiner += 0.15;
    
    if (glowSiner >= (2 * pi))
        glowSiner -= (2 * pi);
    
    glowTimer++;
    
    if (glowTimer >= 8)
    {
        with (instance_create_xy(x + 45, y + 70, obj_afterimage_fader))
        {
            image_blend = #7777FF;
            image_alpha = other.glowAmount;
            sprite_index = spr_cb_crossbonebul;
            image_angle = random(360);
            direction = random(360);
            speed = 8;
            friction = 0.35;
            fadeSpeed = 0.05 * other.glowAmount;
            scaleSpeed = 0;
            depth = other.depth + 1;
        }
        
        glowTimer = 0;
    }
}

if (fightType == 2)
{
    if (removedMask || ds_map_find_value(global.pflags, "cb_endure") >= 2)
        name = dxd_raw("battles.cb_g.name2");
}
