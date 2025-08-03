switch (debugMenu)
{
    case (1 << 0):
        draw_set_font(fnt_mainsm);
        var s = ds_list_size(debugOptions);
        
        for (var i = 0; i < s; i++)
        {
            var text = ((i == debugMenuSel) ? "> " : "  ") + ds_list_find_value(debugOptions, i).name;
            draw_set_color(c_black);
            draw_text(9, 5 + (i * 16), text);
            draw_set_color(c_white);
            draw_text(8, 4 + (i * 16), text);
        }
        
        break;
    
    case (2 << 0):
        draw_set_font(fnt_mainsm);
        var s = array_length(flagStrings);
        var _x = 8;
        var _y = 4;
        
        for (var i = 0; i < s; i++)
        {
            var text = flagStrings[i];
            draw_set_color(c_black);
            draw_text(_x + 1, _y + 1, text);
            draw_set_color(c_white);
            draw_text(_x, _y, text);
            _y += 16;
            
            if (_y >= 464)
            {
                _x += 150;
                _y = 4;
            }
        }
        
        break;
}
