if (instance_exists(o_hand_player1))
{
    if (point_in_circle(x, y, o_hand_player1.x, o_hand_player1.y, 70) && o_hand_player1.key_accept2)
        pressed = 1;
    else
        pressed = 0;
}

time += hoverSpeed;
var sine_value = sin(time);
y = (original_y - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);
