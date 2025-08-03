if (useGui || dontDraw)
    exit;

var cam = view_get_camera(0);
draw_rectangle_pix(camera_get_view_x(cam), camera_get_view_y(cam), camera_get_view_width(cam), camera_get_view_height(cam), color, alpha);

if (room == rm_ruin6_long)
{
    cam = view_get_camera(1);
    draw_rectangle_pix(camera_get_view_x(cam), camera_get_view_y(cam), camera_get_view_width(cam), camera_get_view_height(cam), color, alpha);
}
