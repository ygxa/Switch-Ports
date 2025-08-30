draw_self();

if (showtext)
{
    draw_set_font(global.font);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    ini_open("saveData.ini");
    draw_text(x, y - 100, ini_read_string("Highscore", string(level), 0));
    draw_text(x, y - 150, ini_read_string("Secret", string(level), 0) + " OF 3 SECRETS");
    
    for (var i = 0; i < 5; i++)
    {
        var x_pos = -100 + (50 * i);
        var collected = ini_read_string("Confecti", string(level) + string(i + 1), 0);
        
        if (!collected)
            draw_sprite_ext_flash(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 200, 1, 1, 0, 0, 1);
        else
            draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 200, 1, 1, 0, c_white, 1);
    }
    
    ini_close_fixed();
}
