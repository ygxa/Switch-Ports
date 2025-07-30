draw_set_font(global.bigfont);
draw_set_alpha(1);

if (controllermode == 0)
{
    for (var i = 0; i < array_length(keys); i++)
    {
        var _col = (i == key_selected) ? 16777215 : 8421504;
        
        if (i == 8)
            _col = (i == key_selected) ? 255 : 8421504;
        
        draw_set_color(_col);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        var _keyname;
        
        if (i != 8)
            _keyname = string_concat(keys[i][0], ": ", translate_keycode(keys[i][1]));
        else
            _keyname = "ESCAPE";
        
        draw_text(480 + (offsetx * (((i % 2) == 1) ? -1 : 1)), 150 + (i * 40) + ((_keyname == "ESCAPE") ? 20 : 0), _keyname);
    }
    
    draw_set_color(c_dkgray);
    draw_text(100, 100, "PRESS SHIFT \nTO SWITCH\nTO PLAYER 2");
}
else if (controllermode == 1)
{
    for (var i = 0; i < array_length(buttons); i++)
    {
        var _col = (i == but_selected) ? 16777215 : 8421504;
        
        if (i == 8)
            _col = (i == but_selected) ? 255 : 8421504;
        
        draw_set_color(_col);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        var _keyname;
        
        if (i != 8)
            _keyname = string_concat(buttons[i][0], ": ", translate_keycode(buttons[i][1]));
        else
            _keyname = "ESCAPE";
        
        draw_text(480 + (offsetx * (((i % 2) == 1) ? -1 : 1)), 150 + (i * 40) + ((_keyname == "ESCAPE") ? 20 : 0), _keyname);
    }
    
    draw_set_color(c_dkgray);
    draw_text(100, 100, "PRESS SHIFT \nTO SWITCH\nTO PLAYER 2");
}
