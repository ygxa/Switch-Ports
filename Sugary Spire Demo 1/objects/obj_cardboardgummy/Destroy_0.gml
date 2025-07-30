if (ds_list_find_index(global.saveroom, id) == -1)
{
    camera_shake(20, 40);
    
    switch (global.combo)
    {
        case 0:
        case 1:
            scr_sound(31);
            break;
        
        case 2:
            scr_sound(33);
            break;
        
        case 3:
            scr_sound(34);
            break;
        
        default:
            scr_sound(35);
            break;
    }
    
    with (instance_create(x, y, obj_harrydead))
        sprite_index = spr_gummy_cardboard_death;
    
    repeat (2)
    {
        instance_create(x, y, obj_bangeffect);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
    }
}
