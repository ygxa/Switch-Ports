obj_gamemanager.setGuiSurface();
draw_rectangle_pix(0, 0, 640, 480, 0, 0.6);
draw_set_color(c_white);
draw_set_font(fnt_main);
draw_text(10, 10, text);
draw_text(10, 58, "> " + keyboard_string);
set_font(fnt_mainsm);

for (var i = 0; i < 16; i++)
{
    if (tab == i)
        draw_set_color(c_white);
    else
        draw_set_color(c_ltgray);
    
    var res = results[i];
    draw_text(10, 96 + (i * 20), (res == -1) ? "---" : entryNames[res]);
}

surface_reset_target();
