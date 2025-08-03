obj_gamemanager.setGuiSurface();
set_font(fnt_dotumche);
draw_set_color(c_white);
var _x = (x - camera_get_view_x(view_camera[0])) * 2;
var _y = (y - camera_get_view_y(view_camera[0])) * 2;

if ((_x + string_width(str)) < -10 || _x >= 650 || (_y + string_height(str)) < -10 || _y >= 490 || instance_exists(obj_fader))
{
    surface_reset_target();
    instance_destroy();
    exit;
}

draw_set_alpha(alpha);
draw_text(_x, _y, str);
draw_set_alpha(1);
surface_reset_target();
