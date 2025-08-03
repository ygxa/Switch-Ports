if (useGui || dontDraw)
    exit;

if (global.lowvfx)
    exit;

var cam = view_get_camera(0);
draw_rectangle_pix(camera_get_view_x(cam), camera_get_view_y(cam), camera_get_view_width(cam), camera_get_view_height(cam), color, alpha);
