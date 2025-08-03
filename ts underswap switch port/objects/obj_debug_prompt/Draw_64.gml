obj_gamemanager.setGuiSurface();
draw_rectangle_pix(0, 0, 640, 480, 0, 0.6);
draw_set_color(c_white);
draw_set_font(fnt_main);
draw_text(10, 10, text);
draw_text(10, 58, "> " + keyboard_string);
surface_reset_target();
