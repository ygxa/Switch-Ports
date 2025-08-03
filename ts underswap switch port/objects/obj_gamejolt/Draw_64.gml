if (uploadTextAlpha != 0)
{
    draw_set_alpha(uploadTextAlpha);
    set_font(fnt_mainsm);
    draw_set_color(c_black);
    
    if (uploadSuccess)
    {
        var s = dxd_raw("extras.gamejolt.lup_success");
        draw_text(9, 9, s);
        draw_set_color(c_yellow);
        draw_text(8, 8, s);
    }
    else
    {
        var s = dxd_raw("extras.gamejolt.lup_failed");
        draw_text(9, 9, s);
        draw_set_color(c_red);
        draw_text(8, 8, s);
    }
    
    draw_set_alpha(1);
}
