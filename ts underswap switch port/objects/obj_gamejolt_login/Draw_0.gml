draw_set_alpha(alpha);
draw_set_halign(fa_center);

if (state == 6)
{
    draw_set_color(c_white);
    draw_text(320, 140, dxd_raw("extras.gjlogin.lsaveinfo"));
    draw_set_color((sel == 0) ? c_yellow : c_white);
    draw_text(260, 250, dxd_raw("gen_menu.lyes"));
    draw_set_color((sel == 1) ? c_yellow : c_white);
    draw_text(380, 250, dxd_raw("gen_menu.lno"));
}
else if (state == 5)
{
    draw_set_color(c_white);
    draw_text(320, 200, dxd_raw("extras.gjlogin.lsuccess"));
    draw_set_color(c_yellow);
    draw_text(320, 250, dxd_raw("extras.gjlogin.lcontinue"));
}
else if (state == 3 || state == 4)
{
    draw_set_color(c_white);
    
    if (state == 4)
        draw_text(320, 200, dxd_raw("extras.gjlogin.linterrupt"));
    else
        draw_text(320, 200, dxd_raw("extras.gjlogin.lfailed"));
    
    draw_set_color((sel == 0) ? c_yellow : c_white);
    draw_text(260, 250, dxd_raw("gen_menu.lyes"));
    draw_set_color((sel == 1) ? c_yellow : c_white);
    draw_text(380, 250, dxd_raw("gen_menu.lno"));
}
else if (state == 2)
{
    draw_set_color(c_white);
    
    if (instance_exists(obj_gamejolt) && (obj_gamejolt.session == (4 << 0) || obj_gamejolt.trophyLoad == (4 << 0)))
        draw_text(320, 200, dxd_raw("extras.gjlogin.llostconn"));
    else
        draw_text(320, 200, dxd_raw("extras.gjlogin.linprogress"));
}
else
{
    var offset = needs_virtual_keyboard() ? -70 : 0;
    draw_set_color(c_gray);
    set_font(fnt_mainsm);
    
    if (needs_virtual_keyboard())
        draw_text(320, 60, dxd_raw("extras.gjlogin.lcontrols_mobile"));
    else
        draw_text(320, 60, dxd_raw("extras.gjlogin.lcontrols"));
    
    if (state == 0)
        draw_text(320, 156, dxd_raw("extras.gjlogin.lnotfancy"));
    else if (state == 1)
        draw_text(320, 232 + offset, dxd_raw("extras.gjlogin.lnotpassword"));
    
    draw_set_color(c_white);
    set_font(fnt_main);
    draw_text(320, 14, dxd_raw("extras.gjlogin.ltitle"));
    
    if (!needs_virtual_keyboard() || state == 0)
    {
        draw_set_color((state == 0) ? c_white : c_gray);
        draw_text(320, 130, dxd_raw("extras.gjlogin.lusername"));
        
        if (state == 0)
            draw_set_alpha(alpha * textFade);
        
        if (string_length(username) == 0)
            draw_sprite_ext(spr_cursor, 0, 316, 178, 1, 1, 0, c_white, alpha * textFade);
        else
            draw_text(320, 168, username);
        
        draw_set_alpha(alpha);
    }
    
    if (needs_virtual_keyboard())
    {
        draw_set_color(c_orange);
        draw_text(320, 380, dxd_raw("extras.gjlogin.lvk"));
    }
    
    if (state == 1)
    {
        draw_set_color(c_white);
        draw_text(320, 200 + offset, dxd_raw("extras.gjlogin.lgametoken"));
        draw_set_alpha(alpha * textFade);
        
        if (string_length(token) == 0)
            draw_sprite_ext(spr_cursor, 0, 316, 260 + offset, 1, 1, 0, c_white, alpha * textFade);
        else
            draw_text(320, 250 + offset, string_fill_char("", string_length(token), dxd_raw("extras.gjlogin.filler")));
    }
}

draw_set_halign(fa_left);
draw_set_alpha(1);
