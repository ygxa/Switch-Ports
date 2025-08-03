if (!useGui || dontDraw)
    exit;

if (global.lowvfx)
    exit;

obj_gamemanager.setGuiSurface();
draw_rectangle_pix(0, 0, 640, 480, color, alpha);
surface_reset_target();
