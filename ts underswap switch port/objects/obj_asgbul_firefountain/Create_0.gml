event_inherited();
doIDie = false;
state = 0;
timer = 0;
timeToDie = 45;
yScaleFudge = 0.4;
image_xscale = 2;
image_yscale = 4;
image_yscale_orig = image_yscale;

setState = function(argument0)
{
    image_index = 0;
    image_speed = 1;
    
    switch (argument0)
    {
        case 0:
            image_speed = 0.5;
            sprite_index = spr_asgbul_fire_flicker;
            break;
        
        case 1:
            sprite_index = spr_asgbul_fire_grow;
            image_speed = 0.2;
            alarm[0] = 25;
            break;
        
        case 2:
            image_speed = 0.5;
            sprite_index = spr_asgbul_fire_loop;
            timer = 0;
            break;
        
        case 3:
            image_yscale = image_yscale_orig;
            sprite_index = spr_asgbul_fire_grow;
            image_index = 3;
            image_speed = -0.2;
            alarm[1] = 15;
            break;
    }
    
    state = argument0;
};

xstart = x;
siner = 0;
setState(0);
