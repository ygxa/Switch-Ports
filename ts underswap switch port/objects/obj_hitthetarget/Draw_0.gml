var bgY = camera_get_view_y(view_get_camera(0));
draw_sprite_ext(spr_hitthetarget_bg, 0, bgX, bgY, 2, 2, 0, c_white, bgAlpha);

if (drawGameBox)
    draw_menu_rectangle(borderLeft, borderTop, borderRight, borderBottom, 1, 9);
