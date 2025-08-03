switch (global.bev_subtype)
{
    case 0:
        instance_create_xy((x - sprite_xoffset) + (sprite_width * 0.5) + 10, (y - sprite_yoffset) + (sprite_height * 0.5), bt_attacker());
        didCriticalHit = abs(obj_battletarget.x - obj_battletarget.selectorX) <= 25;
        break;
    
    default:
        event_inherited();
        break;
}
