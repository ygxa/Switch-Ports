var _data = video_draw();
var _status = _data[0];

if (_status == 0)
{
    var _surface = _data[1];
    draw_surface_ext(_surface, x, y, 1.5, 1.5, 0, c_white, 1);
}
else
{
    instance_create_depth(x, y, depth, o_otherfade);
    audio_play_sound(mu_title, 0, false);
    instance_destroy();
}
