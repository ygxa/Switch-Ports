var r = rkb_draw_handle();
var _x = r[0];
var _y = r[1];

if (!visible)
    exit;

if (!spared)
{
    var ws = sin(wingsiner);
    
    if (sprite_index == spr_rkb_karapaes_fly)
    {
        draw_sprite_ext(spr_rkb_wingkl, 0, _x + 120, _y + 46 + (ws * 4), -2, 2, ws * -8, image_blend, 1);
        draw_sprite_ext(spr_rkb_wingkr, 0, _x + 50, _y + 46 + (ws * 4), -2, 2, ws * 8, image_blend, 1);
    }
    else
    {
        draw_sprite_ext(spr_rkb_wingkl, 0, _x + 8, _y + 46 + (ws * 4), 2, 2, ws * 8, image_blend, 1);
        draw_sprite_ext(spr_rkb_wingkr, 0, _x + 80, _y + 46 + (ws * 4), 2, 2, ws * -8, image_blend, 1);
    }
}
else
{
    draw_sprite_ext(spr_rkb_wingkl, 0, _x + 8, _y + 46, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_rkb_wingkr, 0, _x + 80, _y + 46, 2, 2, 0, image_blend, 1);
}
