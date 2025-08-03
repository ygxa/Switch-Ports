if (active && initialDelay <= 0 && timer <= 20)
{
    set_font(fnt_dotumche);
    draw_set_halign(fa_center);
    draw_rectangle_pix(obj_battlemanager.boxX1, obj_battlemanager.boxY1 - 30, obj_battlemanager.boxX2 - obj_battlemanager.boxX1, 30, 0, 0.4);
    
    if (global.control_gamepad && global.gamepad_buttons_type != -1)
    {
        global.dxformat[0] = "`*Z`";
        var s = dxd_int("battlesystem.ztodash");
        draw_set_color(c_black);
        draw_text_icons_centered(322, (obj_battlemanager.boxY1 - 24) + 2, s, undefined, true);
        draw_set_color(c_ltgray);
        draw_text_icons_centered(320, obj_battlemanager.boxY1 - 24, s);
    }
    else
    {
        global.dxformat[0] = keycode_to_string(global.keyboard_keys[0]);
        var s = dxd_int((global.keyboard_keys[0] == 90) ? "battlesystem.ztodash_default" : "battlesystem.ztodash");
        draw_set_color(c_black);
        draw_text(322, (obj_battlemanager.boxY1 - 24) + 2, s);
        draw_set_color(c_ltgray);
        draw_text(320, obj_battlemanager.boxY1 - 24, s);
    }
    
    draw_set_halign(fa_left);
}
