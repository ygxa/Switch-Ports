image_blend = merge_color(c_black, c_white, blender);
var shadowX = x;

if (shadowForceX != -1)
    shadowX = shadowForceX;

var shadowY = y;

if (shadowForceY != -1)
    shadowY = shadowForceY;

draw_sprite_stretched_ext(spr_shadow, 0, (shadowX + 6) - (trans * 0.5), shadowY + 58, 25 + trans, 15, c_white, shadowAlpha);
var _x = x;
var _y = y;
y += trans;

if (shakeAmount != 0)
{
    x += irandom(shakeAmount);
    y += irandom(shakeAmount);
}

event_inherited();
x = _x;
y = _y;
