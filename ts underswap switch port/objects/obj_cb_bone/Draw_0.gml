if (bbox_right < obj_battlemanager.boxX1 || bbox_left > obj_battlemanager.boxX2 || bbox_bottom < obj_battlemanager.boxY1 || bbox_top > obj_battlemanager.boxY2)
    exit;

if (bt_set_surface_cutoff())
    exit;

draw_sprite_ext(spr_cb_bone, 0, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, 1);
