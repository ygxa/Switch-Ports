event_inherited();
image_xscale = 2;
image_yscale = 2;
image_alpha = 0;
currentDir = 4;
blueSign = 0;

updateSprite = function(argument0, argument1)
{
    if (sign(argument1) == blueSign)
    {
        image_blend = #14A9FF;
        bulletType = (1 << 0);
    }
    else
    {
        image_blend = c_white;
        bulletType = (0 << 0);
    }
    
    if (currentDir == argument0)
        exit;
    
    currentDir = argument0;
    
    switch (argument0)
    {
        case 2:
            sprite_index = spr_greaterdog_tail_left;
            mask_index = spr_greaterdog_tail_left_col;
            break;
        
        case 1:
            sprite_index = spr_greaterdog_tail_middle;
            mask_index = spr_greaterdog_tail_middle_col;
            break;
        
        case 3:
            sprite_index = spr_greaterdog_tail_right;
            mask_index = spr_greaterdog_tail_right_col;
            break;
    }
};

spd = 0.005;

if (irandom(1) == 0)
{
    blueSign = 1;
    updateSprite(2, -1);
    siner = 4.71238898038469;
    image_angle = -50;
}
else
{
    blueSign = -1;
    updateSprite(3, 1);
    siner = 1.5707963267948966;
    image_angle = 50;
}
