x += hsp;
time += hoverSpeed;
var sine_value = sin(time);
y = (original_y - (hoverHeight / 2)) + ((hoverHeight / 2) * sine_value);

if (place_meeting(x, y, o_snowman_fuckoff_point))
    instance_destroy();
