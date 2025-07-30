cam = view_get_camera(0);
cam_x = 0;
cam_y = 0;
cam_minWidth = 960;
cam_minHeight = 540;
cam_width = cam_minWidth;
cam_height = cam_minHeight;
cam_aspect = cam_minWidth / cam_minHeight;
cam_xBuffer = 200;
cam_yBuffer = 200;
buff = 8;
xTo = xstart;
yTo = ystart;
view_enabled[0] = true;
player1inroom = true;
player2inroom = true;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
player1 = O_Player_1;
player2 = O_Player_2;

if (instance_exists(o_demrec) && o_demrec.state == (1 << 0))
{
    player1 = o_demrecdoll;
    player1 = o_demrecdoll2;
}

super = 0;
zoom = 1;
shakelength = 0;
shakeMagnitude = 0;
shake_remain = 0;
buff = 32;
