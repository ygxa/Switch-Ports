function scr_player_machtumble()
{
    static bufferslap = 0;
    static attack_afterimagetimer = 6;
    
    hsp = xscale * movespeed;
    
    if (movespeed < 11 && grounded)
        movespeed += 0.5;
    else if (movespeed < 11 && !grounded)
        movespeed = 11;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        scr_sound(51);
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        image_speed = 0.35;
        
        with (obj_baddie)
        {
            if (bbox_in_camera(view_camera[0]) && grounded)
            {
                stun = 1;
                alarm[0] = 200;
                ministun = 0;
                vsp = -5;
                hsp = 0;
            }
        }
        
        flash = 0;
        combo = 0;
        sprite_index = spr_player_mach3hitwall;
        state = 69;
        hsp = -2.5 * xscale;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
    }
    
    if (key_slap2)
        bufferslap = 0;
    else if (bufferslap < 10)
        bufferslap++;
    
    if (key_down)
    {
        sprite_index = spr_crouchslip;
        machhitAnim = 0;
        state = 64;
        
        if (audio_is_playing(sound_suplex1))
            audio_stop_sound(sound_suplex1);
    }
    
    if (animation_end())
    {
        if (key_attack)
        {
            if (mach2 < 100)
            {
                state = 66;
                sprite_index = spr_player_mach;
            }
            
            if (mach2 >= 100)
            {
                state = 67;
                sprite_index = spr_player_mach4;
            }
        }
        else if (!key_attack && bufferslap >= 8)
        {
            image_speed = 0.35;
            state = 0;
            grav = 0.5;
        }
        else if (!key_attack && bufferslap < 8)
        {
            sprite_index = spr_player_machtumble;
            image_index = 0;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
        }
    }
    
    image_speed = 0.35;
    
    if (attack_afterimagetimer > 0)
        attack_afterimagetimer--;
    
    if (attack_afterimagetimer <= 0 && vsp <= 0)
    {
        with (instance_create(x, y, obj_attack_aftereffect))
            playerid = other.id;
        
        attack_afterimagetimer = 6;
    }
}
