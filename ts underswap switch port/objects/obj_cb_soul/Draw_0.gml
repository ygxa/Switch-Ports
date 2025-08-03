var py = y;
y += (sin(siner) * sinerAmplitude);
y = floor(y);
draw_self();
draw_sprite_ext(spr_cb_soul, 0, x + 29, y + 25, image_xscale, image_yscale, image_angle, c_blue, image_alpha);
y = py;
