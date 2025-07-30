if instance_exists(o_player_default)
	follow = o_player_default
if instance_exists(o_player_noise)
	follow = o_player_noise
if instance_exists(o_player_vigilante)
	follow = o_player_vigilante
if instance_exists(o_player_doise)
	follow = o_player_doise
if instance_exists(o_player_fakepep)
	follow = o_player_fakepep

if (instance_exists(follow))
{
    xTo = follow.x;
    yTo = follow.y;
}

x += ((xTo - x) / 10);
y += ((yTo - y) / 10);
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shakelength) * shakeMagnitude));
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
