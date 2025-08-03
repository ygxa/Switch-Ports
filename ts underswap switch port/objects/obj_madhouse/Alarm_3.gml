if (music == -4)
    music = music_load("housechase1");

var cam = view_get_camera(0);
var _x = camera_get_view_x(cam);
var _y = camera_get_view_y(cam);
var _w = camera_get_view_width(cam);
var _h = camera_get_view_height(cam);

if (_w != 320 || _h != 240 || _x != origXView || _y != origYView)
{
    camera_set_view_pos(cam, number_approach_smooth(_x, origXView, 0.2, 5), number_approach_smooth(_y, origYView, 0.2, 5));
    camera_set_view_size(cam, number_approach_smooth(_w, 320, 0.2, 5), number_approach_smooth(_h, 240, 0.2, 5));
    alarm[3] = 1;
}
else
{
    scene_resume();
}
