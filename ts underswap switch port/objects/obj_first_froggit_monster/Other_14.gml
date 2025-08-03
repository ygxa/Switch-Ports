switch (global.bev_subtype)
{
    case 0:
        instance_create_xy(((x + offsetUiX) - sprite_xoffset) + (sprite_width * 0.5), (y - sprite_yoffset) + (sprite_height * 0.5), bt_attacker());
        
        if (obj_battletarget.damage >= maxHp)
        {
            dx_scene("battles.first_froggit.fightk");
            asgoreIntervened = true;
            invincible = true;
        }
        
        break;
}
