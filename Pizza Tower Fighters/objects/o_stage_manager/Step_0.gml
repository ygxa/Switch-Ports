if (!instance_exists(O_Fade))
    y = approach(y, ystart, 20);

time += hoverSpeed;
var sine_value = sin(time);
x = wave(xstart - 6, xstart + 6, 6, 0);
