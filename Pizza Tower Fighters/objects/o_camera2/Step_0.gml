if instance_exists(o_player_default)
	player1 = o_player_default
if instance_exists(o_player_noise)
	player1 = o_player_noise
if instance_exists(o_player_vigilante)
	player1 = o_player_vigilante
if instance_exists(o_player_doise)
	player1 = o_player_doise
if instance_exists(o_player_fakepep)
	player1 = o_player_fakepep
	
if instance_exists(o_player_default2)
	player2 = o_player_default2
if instance_exists(o_player_noise2)
	player2 = o_player_noise2
if instance_exists(o_player_vigilante2)
	player2 = o_player_vigilante2
if instance_exists(o_player_doise2)
	player2 = o_player_doise2
if instance_exists(o_player_fakepep2)
	player2 = o_player_fakepep2
	
	
if (super == 1)
    zoom = 0.85;
else
    zoom = 1;

if (instance_exists(player1) && instance_exists(player2))
{
    x = lerp(xprevious, (player1.x + player2.x) / 2, 0.9);
    y = lerp(yprevious, (player1.y + player2.y) / 2, 0.9);
    cam_width = max(point_distance(player1.x, 0, player2.x, 0) + cam_xBuffer, cam_minWidth);
    cam_height = max(point_distance(0, player1.y, 0, player2.y) + cam_yBuffer, cam_minHeight);
    cam_x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
    cam_y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);
    cam_x += random_range(-shake_remain, shake_remain);
    cam_y += random_range(-shake_remain, shake_remain);
    shake_remain = max(0, shake_remain - ((1 / shakelength) * shakeMagnitude));
    var cur_aspect = max(cam_width, cam_height * cam_aspect);
    cam_width = cur_aspect;
    cam_height = cur_aspect / cam_aspect;
    camera_apply(cam);
    var _cam_x = cam_x - (cam_width / 2);
    var _cam_y = cam_y - (cam_height / 2);
    _cam_x = clamp(_cam_x, 0, room_width - cam_width);
    _cam_y = clamp(_cam_y, 0, room_width - cam_width);
    var _cam_width = cam_width;
    var _cam_height = cam_height;
    
    if (_cam_width > room_width)
        _cam_width = room_width;
    
    if (_cam_height > room_height)
        _cam_height = room_height;
    
    var cw = _cam_width * zoom;
    var ch = _cam_height * zoom;
    var offsetx = _cam_width - cw;
    var offsety = _cam_height - ch;
    camera_set_view_pos(cam, _cam_x + offsetx, _cam_y + offsety);
    camera_set_view_size(cam, _cam_width * zoom, _cam_height * zoom);
}
else
{
    if (instance_exists(player1))
    {
        xTo = player1.x;
        yTo = player1.y;
    }
    
    if (instance_exists(player2))
    {
        xTo = player2.x;
        yTo = player2.y;
    }
    
    x += ((xTo - x) / 10);
    y += ((yTo - y) / 10);
    var cw = 960 * zoom;
    var ch = 540 * zoom;
    var offsetx = 960 - cw;
    var offsety = 540 - ch;
    x = clamp(x, view_w_half, room_width - view_w_half);
    y = clamp(y, view_h_half, room_height - view_h_half);
    camera_set_view_size(cam, 960 * zoom, 540 * zoom);
    
    if (room == R_SecretRoom && o_secreteye.currentlayout == 1)
    {
        camera_set_view_size(cam, 960, 540);
        camera_set_view_pos(cam, 0, 0);
    }
    
    if (room == R_Top)
    {
        camera_set_view_size(cam, 960, 540);
        camera_set_view_pos(cam, 0, 0);
    }
    
    camera_set_view_pos(cam, floor((x - view_w_half) + offsetx), floor((y - view_h_half) + offsety));
}

if (room == R_Top)
{
    camera_set_view_size(cam, 960, 540);
    camera_set_view_pos(cam, 0, 0);
}

if (room == R_SecretRoom && o_secreteye.currentlayout == 1)
{
    camera_set_view_size(cam, 960, 540);
    camera_set_view_pos(cam, 0, 0);
}
