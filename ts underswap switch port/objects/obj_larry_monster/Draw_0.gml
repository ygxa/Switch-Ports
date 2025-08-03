var preShakeX = x;
var preShakeY = y;

if (isRuth && mercyThresholdHit)
{
    x += (irandom(1) + (sin(bodyDrawCounter) * 6));
    y += irandom(1);
}

if (spared || alarm[10] || forceDrawSelf)
{
    if (cloudShakeAmt > 0)
    {
        var _x = x;
        var _y = y;
        x += (cloudShakeAmt * choose(-1, 1));
        y += (cloudShakeAmt * choose(-1, 1));
        draw_self();
        x = _x;
        y = _y;
    }
    else
    {
        draw_self();
    }
}
else
{
    var bodyOffset = 3 * sin(bodyDrawCounter);
    var headOffset = 1 * sin(bodyDrawCounter);
    var armOffset = 2 * sin(bodyDrawCounter);
    draw_sprite_ext(spr_larry_leg_r, 0, x + 18, y + 174, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_larry_leg_l, 0, x + 140, y + 174, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_larry_body, 0, x, y + 18 + bodyOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_larry_arms, 0, x + 12, y + 54 + armOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    var actualFaceSprite = faceSprite;
    
    if (isRuth && actualFaceSprite == spr_larryfaceb_0)
        actualFaceSprite = spr_larryfaceb_gd;
    
    if (isRuth && mercyThresholdHit)
        actualFaceSprite = spr_larryfaceb_g0;
    
    draw_sprite_ext(actualFaceSprite, 0, x + 48, y + headOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

x = preShakeX;
y = preShakeY;

if (drawMountain)
{
    draw_rectangle_pix(0, 245, 640, 235, 0, 1);
    draw_sprite(spr_battlebg, 9, 0, 0);
}
