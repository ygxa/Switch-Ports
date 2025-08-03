if ((x + len) < (obj_battlemanager.boxX1 + 5))
    exit;

if ((x - len) > (obj_battlemanager.boxX2 - 5))
    exit;

if ((y + 6) < (obj_battlemanager.boxY1 + 5))
    exit;

if ((y - 4) > (obj_battlemanager.boxY2 - 5))
    exit;

if (bt_set_surface_cutoff())
    exit;

var _y = floor(y);
draw_rectangle_pix(x - len, _y - 4, len * 2, 10, 0, image_alpha);
draw_rectangle_pix_outline(x - len, _y, len * 2, 6, 16777215, image_alpha);
draw_rectangle_pix_outline(x - len, _y - 4, len * 2, 6, 32768, image_alpha);
