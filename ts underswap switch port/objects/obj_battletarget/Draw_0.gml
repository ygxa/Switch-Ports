if (bt_set_surface_transform())
    exit;

draw_self();

if (!doFade && selectorVisible)
    draw_sprite(spr_battletargetsel, selectorSprIndex, selectorX, y - 7);
