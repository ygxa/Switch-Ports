if (bt_set_surface_cutoff())
    exit;

if (state == 0)
    draw_battle_warner(bbox_left, bbox_top, bbox_right, bbox_bottom, warningTimer, true);
else
    draw_self();
