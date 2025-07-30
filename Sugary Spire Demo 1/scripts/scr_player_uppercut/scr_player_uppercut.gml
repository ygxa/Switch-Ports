function scr_player_uppercut()
{
    static attack_afterimagetimer = 6;
    
    image_speed = 0.35;
    
    if (sprite_index == spr_player_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_uppercutend;
        image_index = 0;
    }
    
    if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + xscale, y) && move != 0)
        movespeed = 0;
    
    move = key_left + key_right;
    
    if (move == 0)
        hsp = xscale * movespeed;
    else
        hsp = move * movespeed;
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 4)
            movespeed += 0.4;
        
        if (movespeed > 4)
            movespeed = 4;
    }
    
    if (move == 0)
    {
        if (movespeed > 0)
            movespeed -= 0.3;
    }
    
    if (!instance_exists(obj_dashcloud) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale;
    }
    
    if (grounded && vsp > 0)
    {
        scr_sound(63);
        landAnim = 1;
        input_buffer_secondjump = 0;
        state = 0;
        jumpAnim = 1;
        jumpstop = 0;
        image_index = 0;
        freefallstart = 0;
        instance_create_depth(x, y, 0, obj_landcloud);
    }
    
    if (attack_afterimagetimer > 0)
        attack_afterimagetimer--;
    
    if (attack_afterimagetimer <= 0 && vsp <= 0)
    {
        with (instance_create(x, y, obj_attack_aftereffect))
            playerid = other.id;
        
        attack_afterimagetimer = 6;
    }
}
