var _border = 192;
draw_set_color(c_black);
draw_rectangle(-_border, -_border, room_width, 0, false); //Top
draw_rectangle(-_border, room_height, room_width, room_height + _border, false); //Bottom
draw_rectangle(-_border, -_border, 0, room_height + _border, false); //Left
draw_rectangle(room_width, -_border, room_width + _border, room_height + _border, false); //Right
draw_set_color(c_white);
