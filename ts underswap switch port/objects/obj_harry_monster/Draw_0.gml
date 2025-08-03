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
    else if (alarm[10] <= 0 && shake)
    {
        var _x = x;
        x += choose(0, 2);
        draw_self();
        x = _x;
    }
    else if (eyesShake > 0)
    {
        var _x = x;
        var _y = y;
        x += (eyesShake * choose(-1, 1));
        y += (eyesShake * choose(-1, 1));
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
    var tailAngle = 20 * sin(bodySiner);
    var rArmAngle = 5 * sin(bodySiner);
    var tieAngle = 5 * sin(bodySiner);
    var lArmAngle = 10 * sin(bodySiner + 10);
    var headOffset = 4 * sin(bodySiner);
    draw_sprite_ext(spr_harry_tail, 0, x + 144, y + 100, image_xscale, image_yscale, tailAngle, image_blend, image_alpha);
    draw_sprite_ext(spr_harry_arm_r, 0, x + 76, y + 78, image_xscale, image_yscale, rArmAngle, image_blend, image_alpha);
    draw_sprite_ext(spr_harry_body, 0, x + 62, y + 56, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_harry_tie, 0, x + 110, y + 70 + headOffset, image_xscale, image_yscale, tieAngle, image_blend, image_alpha);
    draw_sprite_ext(spr_harry_arm_l, 0, x + 116, y + 66, image_xscale, image_yscale, lArmAngle, image_blend, image_alpha);
    var actualFaceSprite = faceSprite;
    
    if (isRuth && actualFaceSprite == spr_harryfaceb_0)
        actualFaceSprite = spr_harryfaceb_gd;
    
    draw_sprite_ext(actualFaceSprite, 0, x + 46, y + headOffset, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
