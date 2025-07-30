alpha -= 0.01;
draw_set_color(c_red);
draw_set_alpha(alpha);
draw_rectangle(0, 0, 960, 540, false);

if (alpha < 0)
    instance_destroy();
