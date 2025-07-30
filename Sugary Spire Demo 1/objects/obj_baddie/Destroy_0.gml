if (ds_list_find_index(global.baddieroom, id) == -1 || important)
{
    obj_tv.image_index = irandom_range(0, 4);
    
    repeat (3)
    {
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
    }
    
    instance_create(x, y + 30, obj_bangeffect);
    camera_shake(3, 3);
    
    if (debris == true)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.deadspr;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
        }
        
        var i = random_range(0, 100);
        
        if (i >= 95)
            scr_sound(115, 27, 9, 12, 110, 105);
        
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
    }
    
    if (!important)
    {
        global.combo++;
        
        switch (global.combo)
        {
            case 0:
            case 1:
                create_small_number(x, y, "10");
                global.collect += 10;
                break;
            
            case 2:
                create_small_number(x, y, "20");
                global.collect += 20;
                break;
            
            case 3:
                create_small_number(x, y, "40");
                global.collect += 40;
                break;
            
            default:
                create_small_number(x, y, "80");
                global.collect += 80;
                break;
        }
        
        global.combotime = 60;
        global.style += 4;
        global.combofreeze = 30;
    }
    
    ds_list_add(global.baddieroom, id);
}
