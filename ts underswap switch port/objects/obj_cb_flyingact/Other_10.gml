set_font(fnt_main);
var w = string_width(text);
vspeed *= sqrt(w / 80);
x += lengthdir_x(w, direction + 180);
y += lengthdir_y(w, direction + 180);
