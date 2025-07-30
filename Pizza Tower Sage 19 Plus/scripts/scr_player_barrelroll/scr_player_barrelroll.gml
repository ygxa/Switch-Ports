function scr_player_barrelroll()
{
    mask_index = spr_crouchmask;
    hsp = xscale * movespeed;
    movespeed = 12;
    mach2 = 35;
    
    if (input_buffer_jump < 8 && grounded)
        vsp = -10;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if ((scr_solid(x + 1, y) && xscale == 1) && !place_meeting(x + 1, y, obj_volumebarrelblock) && (!scr_slope() && !place_meeting(x + sign(hsp), y, obj_slope)))
    {
        barrel = 0;
        mask_index = spr_player_mask;
        state = (49 << 0);
        hsp = -2;
        vsp = -2;
        mach2 = 0;
        image_index = 0;
        instance_create_depth(x + 10, y + 10, 0, obj_bumpeffect);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
    }
    
    if ((scr_solid(x - 1, y) && xscale == -1) && !place_meeting(x - 1, y, obj_volumebarrelblock) && (!scr_slope() && !place_meeting(x + sign(hsp), y, obj_slope)))
    {
        barrel = 0;
        mask_index = spr_player_mask;
        state = (49 << 0);
        hsp = 2;
        vsp = -2;
        mach2 = 0;
        image_index = 0;
        instance_create_depth(x - 10, y + 10, 0, obj_bumpeffect);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
        instance_create_depth(x + random_range(15, -15), y + random_range(15, -15), -1, obj_wooddebris);
    }
    
    if (!instance_exists(obj_mach3effect))
        instance_create_depth(x, y, 0, obj_mach3effect);
    
    sprite_index = spr_player_barrelroll;
    image_speed = 0.45;
}
