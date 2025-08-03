if ((x + len + 12) < (obj_battlemanager.boxX1 + 5))
    exit;

if ((x - len - 12) > (obj_battlemanager.boxX2 - 5))
    exit;

if ((y - 32) > (obj_battlemanager.boxY2 - 5))
    exit;

if (bt_set_surface_cutoff())
    exit;

var _y = floor(y);
draw_sprite_stretched(spr_cb_building, type, x - len - 5, _y - 26, (len + 5) * 2, (obj_battlemanager.boxY2 - _y) + 26);
draw_sprite_stretched_ext(spr_cb_building_platform, 0, x - len - 5, _y - 13, (len + 5) * 2, 19, c_green, 1);

if (blackCover)
    draw_rectangle_pix(x - len - 2, obj_battlemanager.boxY2 - 16, (len + 2) * 2, 16, 0, 1);
