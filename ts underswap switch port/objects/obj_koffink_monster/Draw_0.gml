var _x = x;
var _y = y;

if (floating)
    y += (sin(siner) * 4);

if (spewXShake != 0)
    x = spewXStart + (choose(-1, 1) * spewXShake);

x = floor(x);
y = floor(y);

if (!drawOnGround)
{
    var preSpr = sprite_index;
    
    if (sprite_index == spr_kk_body_neutral)
    {
        draw_sprite_ext(spr_kk_body_neutral_armr, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_kk_body_neutral_arml, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        
        if (hp <= (maxHp * 0.5))
            sprite_index = spr_kk_body_neutral_thin;
    }
    
    draw_self();
    sprite_index = preSpr;
}

if (sprite_index == spr_kk_body_neutral || drawOnGround)
    draw_sprite_ext(drawFace, 0, x + 52, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

x = _x;

if (floating)
    y = _y;
