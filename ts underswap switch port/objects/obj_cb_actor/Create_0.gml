event_inherited();
talkSpeed = 0;
spriteDown = spr_cb_down;
spriteRight = spr_cb_right;
spriteUp = spr_cb_up;
spriteLeft = spr_cb_left;
talkChar = "cb";
talkIndex = false;
lookDirection = 3;
fogAlpha = 0;
baseSetSolid = setSolid;

setSolid = function(argument0)
{
    baseSetSolid(argument0);
    
    if (argument0)
        s.image_yscale = 0.6;
};

drawAfterimage = function()
{
    lastXDist = 0;
    lastYDist = 0;
    prevLastX = -100;
    prevLastY = -100;
    lastAngle = 0;
    
    tempDrawFunction = function()
    {
        gpu_set_fog(true, c_white, 0, 0);
        var prevXDist = lastXDist;
        var prevYDist = lastYDist;
        lastXDist = x - xprevious;
        lastYDist = y - yprevious;
        
        if (lastXDist == 0 && lastYDist == 0)
        {
            lastXDist = prevXDist;
            lastYDist = prevYDist;
        }
        
        lastXDist = clamp(lastXDist, -3, 3);
        lastYDist = clamp(lastYDist, -3, 3);
        draw_sprite_ext(sprite_index, image_index, prevLastX, prevLastY, 1, 1, lastAngle, c_white, 0.25);
        draw_sprite_ext(sprite_index, image_index, x - lastXDist, y - lastYDist, 1, 1, lastAngle, c_white, 0.35);
        prevLastX = x - lastXDist;
        prevLastY = y - lastYDist;
        lastAngle = image_angle;
        gpu_set_fog(false, c_black, 0, 0);
        draw_self();
    };
};

switchSpriteSet = function(argument0)
{
    switch (argument0)
    {
        case 0:
        default:
            spriteDown = spr_cb_down;
            spriteRight = spr_cb_right;
            spriteUp = spr_cb_up;
            spriteLeft = spr_cb_left;
            break;
        
        case 1:
            spriteDown = spr_cb_down_noeyes;
            spriteRight = spr_cb_right_noeyes;
            spriteUp = spr_cb_up;
            spriteLeft = spr_cb_left_noeyes;
            break;
    }
    
    spriteSet = argument0;
};
