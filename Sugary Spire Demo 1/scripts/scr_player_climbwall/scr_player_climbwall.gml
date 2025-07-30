function scr_player_climbwall()
{
    if (windingAnim < 200)
        windingAnim++;
    
    suplexmove = 0;
    vsp = -wallspeed;
    
    if (vsp != 0 && place_meeting(x + xscale, y, obj_molassesWall))
    {
        if ((floor(image_index) % 4) == 0)
        {
            with (instance_create(x + (16 * xscale), y + 43, obj_debris))
            {
                sprite_index = spr_molassesgoop;
                image_index = irandom_range(0, 5);
            }
        }
    }
    
    if (wallspeed > 0)
    {
        if (place_meeting(x + xscale, y, obj_molassesWall))
            wallspeed -= 0.65;
        else
            wallspeed -= 0.25;
    }
    
    crouchslideAnim = 1;
    sprite_index = spr_climbwall;
    
    if (wallspeed <= 0 || !key_attack)
    {
        state = 57;
        sprite_index = spr_fall;
    }
    
    if (!scr_solid(x + xscale, y, true))
    {
        instance_create(x, y, obj_jumpdust);
        vsp = 0;
        
        if (mach2 < 100)
        {
            state = 66;
        }
        else if (mach2 >= 100)
        {
            state = 67;
            sprite_index = spr_player_mach4;
        }
        else
        {
            state = 57;
            vsp = -wallspeed;
        }
    }
    
    if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !scr_slope_ext(x + sign(hsp), y) && !scr_slope_ext(x - sign(hsp), y))
    {
        sprite_index = spr_player_ceilingcrash;
        scr_sound(51);
        image_index = 0;
        state = 49;
        machhitAnim = 0;
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
    }
    
    if (key_jump && key_attack)
    {
        if (mach2 >= 100 && !place_meeting(x + xscale, y, obj_molassesWall))
        {
            mach2 = 100;
            instance_create(x, y, obj_jumpdust);
            vsp = -9;
            sprite_index = spr_player_mach4;
            state = 67;
            xscale *= -1;
        }
        else if (!place_meeting(x + xscale, y, obj_molassesWall))
        {
            sprite_index = spr_player_mach2jump;
            mach2 = 35;
            instance_create(x, y, obj_jumpdust);
            vsp = -9;
            state = 66;
            xscale *= -1;
        }
        else
        {
            sprite_index = spr_player_mach2jump;
            
            if (movespeed > 10)
                movespeed = 10;
            
            mach2 = 35;
            instance_create(x, y, obj_jumpdust);
            vsp = -9;
            state = 66;
            xscale *= -1;
        }
    }
    
    image_speed = 0.6;
    
    if (!instance_exists(obj_cloudeffect))
        instance_create(x, y + 43, obj_cloudeffect);
}
