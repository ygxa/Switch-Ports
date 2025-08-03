var r = rkb_draw_handle();
var _x = r[0];
var _y = r[1];

if (!visible)
    exit;

if (!spared)
{
    var ws = sin(wingsiner);
    draw_sprite_ext(spr_rkb_wingbl, 0, _x + 20, _y + 50 + (ws * 3), 2, 2, ws * 12, image_blend, 1);
    draw_sprite_ext(spr_rkb_wingbr, 0, _x + 38, _y + 40 + (ws * 2), 2, 2, sin(wingsiner + 0.25) * 8, image_blend, 1);
}
else
{
    draw_sprite_ext(spr_rkb_wingbl, 0, _x + 20, _y + 50, 2, 2, 0, image_blend, 1);
    draw_sprite_ext(spr_rkb_wingbr, 0, _x + 38, _y + 40, 2, 2, 0, image_blend, 1);
}
