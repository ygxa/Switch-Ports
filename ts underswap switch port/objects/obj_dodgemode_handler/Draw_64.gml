if (alpha != 0)
{
    obj_gamemanager.setGuiSurface();
    draw_rectangle_pix(530, 428, 98, 44, 0, alpha * 0.5);
    draw_rectangle_pix(540, 452, 78, 14, 0, alpha);
    
    if (global.playerhp < global.playermaxhp)
        draw_rectangle_pix(538, 454, 82, 10, 255, alpha);
    
    draw_rectangle_pix(538, 454, floor(41 * (min(global.playerhp, global.playermaxhp) / global.playermaxhp)) * 2, 10, 65280, alpha);
    
    if (global.uiborder != spr_menuparts_ut)
    {
        draw_sprite_ext(spr_roundhp_dodgemode, 0, 536, 454, 2, 2, 0, c_white, alpha);
        draw_sprite_ext(spr_roundhp_dodgemode, 1, 618, 454, 2, 2, 0, c_white, alpha);
    }
    
    set_font(fnt_crypt);
    draw_set_alpha(alpha);
    var t = dxd_raw("dodgemode.lhp");
    draw_set_color(c_black);
    draw_text(536, 436, t);
    draw_text(540, 436, t);
    draw_text(538, 434, t);
    draw_text(538, 438, t);
    draw_set_color(c_white);
    draw_text(538, 436, t);
    global.dxformat[0] = _string(global.playerhp);
    global.dxformat[1] = _string(global.playermaxhp);
    t = dxd_int("dodgemode.lhp_value");
    draw_set_halign(fa_right);
    draw_set_color(c_black);
    draw_text(620, 436, t);
    draw_text(624, 436, t);
    draw_text(622, 434, t);
    draw_text(622, 438, t);
    draw_set_color(c_white);
    draw_text(622, 436, t);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
    surface_reset_target();
}
