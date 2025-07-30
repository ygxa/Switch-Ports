switch (state)
{
    case 82:
        if (attackbuffer > 0)
            attackbuffer--;
        else
            state = 2;
        
        break;
}

if (!place_meeting(x, y, obj_trapghost))
{
    sprite_index = spr_kingghost_spike;
    state = 2;
}

if (cooldown > 0 && state != 82)
    cooldown--;
