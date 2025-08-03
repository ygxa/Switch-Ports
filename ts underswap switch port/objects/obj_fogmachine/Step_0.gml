event_inherited();

if (stopped)
    exit;

if (!broken)
{
    if ((timer % 10) == 0)
    {
        var fog = instance_create_xy(x + 6, y + 18, obj_afterimage_fader);
        
        with (fog)
        {
            vspeed = 0.25;
            hspeed = xrandom_range(-2.4, -4);
            image_blend = #C14EC1;
            sprite_index = spr_star_float_smoke;
            image_speed = 0.2;
            image_xscale = xrandom_range(0.8, 2);
            image_yscale = xrandom_range(0.8, 2);
            depth = other.depth - 1;
            fadeSpeed = 0.02;
        }
    }
}
else
{
    if (!startedBreak)
    {
        startedBreak = true;
        alarm[0] = 1;
        timer = 0;
    }
    
    if ((timer % 10) == 0)
    {
        var fog = instance_create_xy(x + 27, y + 9, obj_afterimage_fader);
        
        with (fog)
        {
            vspeed = -2;
            hspeed = xrandom_range(-1.2, 1.2);
            image_blend = xchoose(8421504, 12632256);
            sprite_index = spr_star_float_smoke;
            image_speed = 0.2;
            image_xscale = xrandom_range(0.8, 2);
            image_yscale = xrandom_range(0.8, 2);
            fadeSpeed = 0.02;
        }
    }
}

timer++;
