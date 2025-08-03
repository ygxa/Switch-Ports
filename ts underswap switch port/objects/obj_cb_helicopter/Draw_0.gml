if ((bbox_right + 36) < (obj_battlemanager.boxX1 - 5))
    exit;

if ((bbox_left - 36) > (obj_battlemanager.boxX2 + 5))
    exit;

if ((bbox_top - 36) > (obj_battlemanager.boxY2 + 5))
    exit;

if ((bbox_bottom + 36) < (obj_battlemanager.boxY1 - 5))
    exit;

if (bt_set_surface_cutoff())
    exit;

var _y = floor(y);
draw_sprite(sprite_index, image_index, x - 37, _y - 42);
draw_sprite_ext(spr_cb_helicopter_platform, 0, x - 37, _y - 41, 1, 1, 0, c_green, 1);
