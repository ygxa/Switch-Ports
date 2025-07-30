function scr_player_machroll()
{
    if (!place_meeting(x, y + 1, obj_railh))
        hsp = xscale * movespeed;
    else if (place_meeting(x, y + 1, obj_railh))
        hsp = (xscale * movespeed) - 5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = (xscale * movespeed) + 5;
    
    mach2 = 100;
    machslideAnim = 1;
    move = key_right + key_left;
    
    if (grounded)
        sprite_index = spr_player_machroll;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        scr_sound(51);
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        hsp = 0;
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
                image_xscale *= -1;
            }
        }
        
        combo = 0;
        state = 69;
        hsp = -2.5 * xscale;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
    }
    
    if (!instance_exists(obj_cloudeffect) && grounded)
        instance_create(x, y + 43, obj_cloudeffect);
    
    image_speed = 0.8;
    
    if (grounded)
    {
        sprite_index = spr_machroll;
    }
    else if (sprite_index != spr_dive)
    {
        sprite_index = spr_dive;
        vsp = 10;
    }
    
    if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
    {
        scr_sound(13);
        image_index = 0;
        sprite_index = spr_player_rollgetup;
        state = 67;
    }
    
    if (key_jump2 && character == "N")
    {
        sprite_index = spr_pizzano_twirl;
        state = 111;
        vsp = -12;
    }
}
