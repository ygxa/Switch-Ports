function scr_player_machslide()
{
    hit_horizontal = function(_h)
    {
        if (state == states.machslide)
            movespeed = 0;
        
        if (sprite_index == spr_machslide || sprite_index == spr_machslidestart)
        {
            state = states.bump;
            sprite_index = spr_wallsplat;
            image_index = 0;
            mach2 = 0;
            movespeed = 0;
            gamepadvibrate(0.4, 0, 7);
            scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y);
        }
    };
    
    hsp = xscale * movespeed;
    move = input_check_opposing("left", "right");
    movespeed = Approach(movespeed, 0, 0.4);
    
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_machslide;
    
    image_speed = 0.35;
    landAnim = 0;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (floor(movespeed) <= 0)
    {
        if (sprite_index == spr_machslide || sprite_index == spr_player_crouchslide)
        {
            state = states.normal;
            image_index = 0;
            
            if (sprite_index == spr_machslide)
                machslideAnim = 1;
            
            movespeed = 0;
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost)
    {
        if (!grounded)
        {
            sprite_index = spr_machslideboostend;
            image_index = 0;
        }
        else if (grounded)
        {
            image_index = 0;
            xscale *= -1;
            movespeed = 8;
            state = states.mach2;
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost3)
    {
        if (!grounded)
        {
            sprite_index = spr_machslideboost3end;
            image_index = 0;
        }
        else if (grounded)
        {
            sprite_index = spr_mach4;
            xscale *= -1;
            image_index = 0;
            movespeed = 12;
            state = states.mach3;
        }
    }
    
    if (grounded && sprite_index == spr_machslideboost3end)
    {
        xscale *= -1;
        sprite_index = spr_mach4;
        image_index = 0;
        movespeed = 12;
        state = states.mach3;
    }
    
    if (grounded && sprite_index == spr_machslideboostend)
    {
        image_index = 0;
        xscale *= -1;
        movespeed = 8;
        state = states.mach2;
    }
    
    if (movespeed == 0 && grounded)
    {
        if (sprite_index == spr_player_crouchslide)
        {
            facehurt = 1;
            state = states.normal;
            sprite_index = spr_facehurtup;
        }
    }
    
    if (!instance_exists(obj_dashcloud) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale;
    }
}
