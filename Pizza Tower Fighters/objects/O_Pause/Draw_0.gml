if (PAUSE == true)
{
    draw_set_alpha(0.5);
    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    DrawSetText(16777215, F_Menu, 50, 50);
}
else
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
