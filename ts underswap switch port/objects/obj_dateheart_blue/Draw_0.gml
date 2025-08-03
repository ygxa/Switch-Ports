if (!visible)
    exit;

with (obj_hangoutmanager)
{
    if (choice)
        exit;
}

var _x = x;
var _y = y;

switch (soulDir)
{
    case 1:
    case 0:
        _x = floor(_x);
        break;
    
    case 2:
    case 3:
        _y = floor(_y);
        break;
}

var xOff, sprite, yOff;

if (dashing)
{
    sprite = spr_bluesoul_centered;
    
    switch (soulDir)
    {
        case 1:
            xOff = 8;
            yOff = 8;
            break;
        
        case 0:
            xOff = -8;
            yOff = -8;
            break;
        
        case 2:
            xOff = -8;
            yOff = 8;
            break;
        
        case 3:
            xOff = 8;
            yOff = -8;
            break;
    }
}
else
{
    sprite = spr_bluesoul;
    xOff = 0;
    yOff = 0;
}

var dashXOff = 0;
var dashYOff = 0;
var dashFrame = 0;

if (canDash)
{
    switch (soulDir)
    {
        case 1:
            dashXOff = xOff + ((sprite == spr_bluesoul) ? 8 : 0);
            dashYOff = yOff + ((sprite == spr_bluesoul) ? 8 : 0);
            break;
        
        case 0:
            dashXOff = xOff + ((sprite == spr_bluesoul) ? 8 : 16);
            dashYOff = yOff + ((sprite == spr_bluesoul) ? 8 : 16);
            break;
        
        case 2:
            dashXOff = xOff + ((sprite == spr_bluesoul) ? 8 : 16);
            dashYOff = yOff + ((sprite == spr_bluesoul) ? 8 : 0);
            break;
        
        case 3:
            dashXOff = xOff + ((sprite == spr_bluesoul) ? 8 : 0);
            dashYOff = yOff + ((sprite == spr_bluesoul) ? 8 : 16);
            break;
    }
    
    if (dashing)
    {
        if (dashFrameCounter >= 10)
        {
            dashFrame = 22;
        }
        else
        {
            dashFrame = floor(clamp(10 - dashFrameCounter, 0, 10));
            
            if (floor(image_index) == 1)
                dashFrame += 11;
        }
    }
    else
    {
        var timeScale = 1;
        
        if (dashMaxCooldown <= 2)
            timeScale = 2;
        
        if (dashCooldown >= (8 / timeScale))
            dashFrame = 10;
        else
            dashFrame = floor(clamp(dashCooldown * ((10 * timeScale) / 8), 0, 10));
        
        if (floor(image_index) == 1)
            dashFrame += 11;
    }
}

switch (soulDir)
{
    case 1:
        draw_sprite_ext(sprite, image_index, _x + xOff, _y + yOff, image_xscale, image_yscale, dashAngle, image_blend, image_alpha);
        
        if (canDash)
            draw_sprite_ext(spr_bluesoul_dash, dashFrame, _x + dashXOff, _y + dashYOff, image_xscale, image_yscale, dashAngle, image_blend, image_alpha);
        
        break;
    
    case 0:
        draw_sprite_ext(sprite, image_index, _x + 16 + xOff, _y + 16 + yOff, image_xscale, image_yscale, dashAngle + 180, image_blend, image_alpha);
        
        if (canDash)
            draw_sprite_ext(spr_bluesoul_dash, dashFrame, _x + dashXOff, _y + dashYOff, image_xscale, image_yscale, dashAngle + 180, image_blend, image_alpha);
        
        break;
    
    case 2:
        draw_sprite_ext(sprite, image_index, _x + 16 + xOff, _y + yOff, image_xscale, image_yscale, dashAngle + 270, image_blend, image_alpha);
        
        if (canDash)
            draw_sprite_ext(spr_bluesoul_dash, dashFrame, _x + dashXOff, _y + dashYOff, image_xscale, image_yscale, dashAngle + 270, image_blend, image_alpha);
        
        break;
    
    case 3:
        draw_sprite_ext(sprite, image_index, _x + xOff, _y + 16 + yOff, image_xscale, image_yscale, dashAngle + 90, image_blend, image_alpha);
        
        if (canDash)
            draw_sprite_ext(spr_bluesoul_dash, dashFrame, _x + dashXOff, _y + dashYOff, image_xscale, image_yscale, dashAngle + 90, image_blend, image_alpha);
        
        break;
}
