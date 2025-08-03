if ((x + len + 12) < (obj_battlemanager.boxX1 + 5))
    exit;

if ((x - len - 12) > (obj_battlemanager.boxX2 - 5))
    exit;

if ((y + 36) < (obj_battlemanager.boxY1 - 5))
    exit;

if (bt_set_surface_cutoff())
    exit;

var height = (floor(y) - obj_battlemanager.boxY1) + 20 + 8;
var adjustedHeight = (ceil(height / 3) * 3) + 1;
var top = obj_battlemanager.boxY1 - 20 - (adjustedHeight - height);
draw_sprite_stretched(spr_cb_hanging_platform, 0, x - len - 3, top, (len + 3) * 2, adjustedHeight);
draw_sprite_stretched_ext(spr_cb_hanging_platform, 1, x - len - 3, top + 2, (len + 3) * 2, adjustedHeight, c_green, 1);
