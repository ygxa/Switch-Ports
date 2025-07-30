function scr_player_handstandjump()
{
    move = key_left + key_right;
    landAnim = 0;
    
    if (mach2 < 35)
        mach2 = 35;
    
    hsp = xscale * movespeed;
    grav = 0;
    momemtum = 1;
    dir = xscale;
    
    if (image_index < 2)
        movespeed = 12;
    
    if (image_index > 7)
        movespeed -= 1;
    
    if (move != xscale && move != 0)
    {
        state = 57;
        image_index = 0;
        sprite_index = spr_player_suplexdashCancel;
        jumpAnim = true;
        momemtum = 0;
        mach2 = 0;
        xscale *= -1;
        
        if (audio_is_playing(sound_suplex1))
            audio_stop_sound(sound_suplex1);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        state = 0;
        grav = 0.5;
        flash = 0;
    }
    
    if (key_down)
    {
        if (grounded)
        {
            grav = 0.5;
            sprite_index = spr_crouchslip;
            machhitAnim = 0;
            state = 64;
            
            if (audio_is_playing(sound_suplex1))
                audio_stop_sound(sound_suplex1);
        }
        else
        {
            grav = 0.5;
            image_index = 1;
            state = 50;
            sprite_index = spr_player_bodyslamstart;
            vsp = -5;
        }
    }
    
    if (key_jump && grounded)
    {
        movespeed = 10;
        sprite_index = spr_mach2jump;
        instance_create(x, y, obj_jumpdust);
        state = 66;
        vsp = -9;
        
        if (audio_is_playing(sound_suplex1))
            audio_stop_sound(sound_suplex1);
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        var _jumpup = false;
        var MaxIncline = 32;
        
        for (var i = MaxIncline; i > 0; i--)
        {
            var _check = true;
            var _z = i - 1;
            
            repeat (i - 1)
            {
                if (!scr_solid_player(x + xscale, y - _z))
                    _check = false;
                
                _z--;
            }
            
            if (scr_solid_player(x + xscale, y) && _check && (!scr_solid_player(x + xscale, y - i) || (scr_solid_player(x + xscale, y - i) && place_meeting(x + xscale, y - i, obj_destructibles))))
            {
                y -= i;
                _jumpup = true;
                break;
            }
        }
        
        if (!_jumpup && !place_meeting(x + xscale, y, obj_destructibles))
        {
            grav = 0.5;
            movespeed = 0;
            state = 69;
            hsp = -2.5 * xscale;
            vsp = -3;
            mach2 = 0;
            image_index = 0;
            machslideAnim = 1;
            machhitAnim = 0;
            instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
            
            if (audio_is_playing(sound_suplex1))
                audio_stop_sound(sound_suplex1);
            
            scr_sound(4);
        }
    }
    
    image_speed = 0.3;
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
        instance_create(x, y, obj_slidecloud);
    
    if (key_attack && floor(image_index) == (image_number - 1) && sprite_index != spr_player_bump)
    {
        if (mach2 >= 100)
        {
            machhitAnim = 0;
            state = 67;
            flash = 1;
            sprite_index = spr_player_mach4;
            instance_create(x, y, obj_jumpdust);
            
            if (movespeed < 12)
                movespeed = 12;
        }
        else
        {
            charged = 0;
            movespeed = 10;
            state = 66;
            sprite_index = spr_mach;
            instance_create(x, y, obj_jumpdust);
        }
    }
    
    if (key_slap2 && !key_down)
    {
        sprite_index = spr_player_machtumble;
        image_index = 0;
        image_speed = 0.2;
        state = 100;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
}
