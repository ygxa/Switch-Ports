if (guiSurface == -1 || !surface_exists(guiSurface))
    guiSurface = surface_create(1024, 512);

surface_set_target(guiSurface);
draw_clear_alpha(c_black, 0);
surface_reset_target();
