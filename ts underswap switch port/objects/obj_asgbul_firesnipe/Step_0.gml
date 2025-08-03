switch (bulletStage)
{
    case 0:
        siner++;
        break;
    
    case 1:
        if (side == 0)
        {
            image_speed = -1;
            hspeed = 16;
        }
        else
        {
            hspeed = -16;
        }
        
        if ((side == 0 && x >= (target - 16)) || (side == 1 && x <= (target + 16)))
        {
            var residue = instance_create_xy(target, y, obj_asgbul_sniperesidue);
            
            if (side == 0)
                residue.sprite_index = spr_asgbul_fire_grow_horiz_left;
            
            instance_destroy();
        }
        
        break;
    
    case 2:
        break;
}
