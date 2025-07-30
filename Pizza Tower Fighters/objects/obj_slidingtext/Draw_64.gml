draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(F_Menu);
draw_rectangle_color(0, 490 - (scaling * 3.5), 1000, 490 + (scaling * 3.5), c_black, c_black, c_black, c_black, false);
var str = string_copy(text, 1, 1) + string_lower(string_copy(text, 2, string_length(text)));

if (scaling == 10)
    draw_text((camera_get_view_width(view_camera[0]) / 2) + 25, 465, str);

draw_set_halign(fa_left);
