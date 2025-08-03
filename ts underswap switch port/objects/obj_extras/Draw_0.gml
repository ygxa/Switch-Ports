draw_rectangle_pix(0, 0, 640, 480, 0, 0.2);
draw_sprite_ext(spr_fadebg, 0, 0, -48, 640, 1, 0, c_white, 0.3);
draw_rectangle_pix(0, 192, 640, 288, 0, 0.3);
set_font(fnt_main);

if (menu != (7 << 0))
{
    if (trophySurface != -1 && surface_exists(trophySurface))
    {
        surface_free(trophySurface);
        trophySurface = -1;
    }
}

switch (menu)
{
    case (2 << 0):
    case (0 << 0):
    case (1 << 0):
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(320, 28, dxd_raw("extras.menu.ltitle"));
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        
        if (global.control_gamepad && global.gamepad_buttons_type != -1)
        {
            draw_text_icons(30, 76, dxd_raw("extras.menu.lreturn_gamepad"), true);
        }
        else if (global.ostype == 1)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lreturn_mobile"));
        }
        else if (global.keyboard_keys[1] == 88)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lreturn_default"));
        }
        else
        {
            global.dxformat[0] = keycode_to_string(global.keyboard_keys[1]);
            draw_text(30, 76, dxd_int("extras.menu.lreturn"));
        }
        
        draw_set_color(c_white);
        var numMenus = array_length(optionMenus);
        var _x = 30;
        
        for (var i = 0; i < numMenus; i++)
        {
            draw_set_color((sel == i) ? c_yellow : c_white);
            var str = dxd_raw(optionMenus[i].title);
            draw_text(_x, 110, str);
            _x += (string_width(str) + 32);
        }
        
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        
        if (sel != -1)
            optionMenus[sel].draw(true);
        
        if (menu == (0 << 0))
        {
            draw_rectangle_pix(0, 0, 320 * (1 - alpha), 480, 0, 1);
            draw_rectangle_pix(320 + (320 * alpha), 0, 320 * (1 - alpha), 480, 0, 1);
        }
        else if (menu == (1 << 0))
        {
            draw_rectangle_pix(0, 0, 640, 480, 0, 1 - clamp(alpha, 0, 1));
        }
        
        break;
    
    case (3 << 0):
        var optionMenu = optionMenus[currentOptionMenu];
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(320, 28, dxd_raw(optionMenu.topTitle));
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        
        if (global.control_gamepad && global.gamepad_buttons_type != -1)
        {
            draw_text_icons(30, 76, dxd_raw("extras.menu.lback_gamepad"), true);
        }
        else if (global.ostype == 1)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_mobile"));
        }
        else if (global.keyboard_keys[1] == 88)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_default"));
        }
        else
        {
            global.dxformat[0] = keycode_to_string(global.keyboard_keys[1]);
            draw_text(30, 76, dxd_int("extras.menu.lback"));
        }
        
        draw_set_color(c_white);
        optionMenu.draw(false);
        
        if (fading != 3)
            draw_rectangle_pix(0, 0, 640, 480, 0, 1 - alpha);
        
        break;
    
    case (5 << 0):
    case (6 << 0):
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(320, 28, dxd_raw("extras.gamejolt.ltitle"));
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        
        if (global.control_gamepad && global.gamepad_buttons_type != -1)
        {
            draw_text_icons(30, 76, dxd_raw("extras.menu.lback_gamepad"), true);
        }
        else if (global.ostype == 1)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_mobile"));
        }
        else if (global.keyboard_keys[1] == 88)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_default"));
        }
        else
        {
            global.dxformat[0] = keycode_to_string(global.keyboard_keys[1]);
            draw_text(30, 76, dxd_int("extras.menu.lback"));
        }
        
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        var gjExists = instance_exists(obj_gamejolt);
        var logout = !gjExists || obj_gamejolt.sessionClosing;
        
        if (logout)
        {
            draw_text(610, 170, dxd_raw("extras.gamejolt.lstatus_logout"));
        }
        else if (obj_gamejolt.session == (3 << 0))
        {
            draw_set_color(c_orange);
            draw_text(610, 170, dxd_raw("extras.gamejolt.lstatus_failure"));
        }
        else if (obj_gamejolt.session == (4 << 0))
        {
            draw_set_color(c_orange);
            draw_text(610, 170, dxd_raw("extras.gamejolt.lstatus_retry"));
        }
        else
        {
            draw_text(610, 170, dxd_raw("extras.gamejolt.lstatus_success"));
        }
        
        draw_set_color(c_white);
        draw_text(610, 206, dxd_raw("extras.gamejolt.luser"));
        var preSel;
        
        if (menu == (6 << 0))
        {
            preSel = sel;
            sel = -1;
        }
        
        set_font(fnt_main);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        
        if (logout)
            draw_set_color(c_gray);
        else
            draw_set_color((sel == 0) ? c_yellow : c_white);
        
        draw_text(30, 170, dxd_raw("extras.gamejolt.llogout"));
        
        if (!gjExists || obj_gamejolt.fileDownload != (0 << 0))
            draw_set_color(c_gray);
        else
            draw_set_color((sel == 1) ? c_yellow : c_white);
        
        draw_text(30, 206, dxd_raw("extras.gamejolt.ldownload"));
        
        if (gjExists && obj_gamejolt.fileDownload != (0 << 0))
        {
            if (obj_gamejolt.fileDownload == (1 << 0))
            {
                draw_set_color(c_white);
                draw_text(50, 246, dxd_raw("extras.gamejolt.ldl_attempt"));
            }
            else if (obj_gamejolt.fileDownload == (2 << 0))
            {
                draw_set_color(c_lime);
                draw_text(50, 246, dxd_raw("extras.gamejolt.ldl_success"));
            }
            else
            {
                draw_set_color(c_red);
                draw_text(50, 246, dxd_raw("extras.gamejolt.ldl_failed"));
            }
        }
        
        set_font(fnt_mainsm);
        draw_set_color(c_gray);
        
        if (gjExists && obj_gamejolt.fileDownload == (0 << 0))
            draw_text(30, 242, dxd_raw("extras.gamejolt.lsaveinfo"));
        
        draw_set_color(c_lime);
        draw_set_halign(fa_right);
        draw_text(610, 240, global.gj_username);
        
        if (menu == (6 << 0))
        {
            sel = preSel;
            draw_menu_rectangle(50, 80, 270, 166);
            draw_set_color(c_white);
            set_font(fnt_main);
            draw_set_halign(fa_center);
            draw_text(320, 176, dxd_raw("extras.gamejolt.ldl_confirm"));
            draw_set_color((sel == 0) ? c_yellow : c_white);
            draw_text(260, 280, dxd_raw("gen_menu.lyes"));
            draw_set_color((sel == 1) ? c_yellow : c_white);
            draw_text(380, 280, dxd_raw("gen_menu.lno"));
        }
        
        break;
    
    case (4 << 0):
        draw_rectangle_pix(0, 0, 640, 480, 0, 1);
        break;
    
    case (7 << 0):
        var areaData = global.trophy_areas[trophyArea];
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(320, 28, dxd_raw("extras.menu.ltrophies_title"));
        draw_set_halign(fa_left);
        draw_set_halign(fa_left);
        draw_set_color(c_gray);
        
        if (global.control_gamepad && global.gamepad_buttons_type != -1)
        {
            draw_text_icons(30, 76, dxd_raw("extras.menu.lback_gamepad"), true);
        }
        else if (global.ostype == 1)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_mobile"));
        }
        else if (global.keyboard_keys[1] == 88)
        {
            draw_text(30, 76, dxd_raw("extras.menu.lback_default"));
        }
        else
        {
            global.dxformat[0] = keycode_to_string(global.keyboard_keys[1]);
            draw_text(30, 76, dxd_int("extras.menu.lback"));
        }
        
        draw_set_color(c_white);
        
        if (trophySurface == -1 || !surface_exists(trophySurface))
            trophySurface = surface_create(1024, 512);
        
        surface_set_target(trophySurface);
        draw_clear_alpha(c_black, 0);
        draw_set_halign(fa_left);
        var numAchieved = 0;
        
        for (var i = areaData.trophyStart; i <= areaData.trophyEnd; i++)
        {
            var curr = global.trophies[i];
            numAchieved += (curr ? 1 : 0);
            var relOffset = ((i - areaData.trophyStart) * 88) + trophyY;
            
            if (relOffset < -80 || relOffset > 300)
                continue;
            
            var spr;
            
            if (curr)
            {
                spr = asset_get_index(_string("spr_t{0}", i));
            }
            else
            {
                switch (global.trophy_kinds[i])
                {
                    case 0:
                        spr = spr_tlock_bronze;
                        break;
                    
                    case 1:
                        spr = spr_tlock_silver;
                        break;
                    
                    case 2:
                        spr = spr_tlock_gold;
                        break;
                    
                    default:
                        spr = spr_tlock_platinum;
                        break;
                }
            }
            
            draw_sprite_ext(spr, 0, 30, 168 + relOffset, 2, 2, 0, c_white, alpha);
        }
        
        for (var i = areaData.trophyStart; i <= areaData.trophyEnd; i++)
        {
            var relOffset = ((i - areaData.trophyStart) * 88) + trophyY;
            
            if (relOffset < -80 || relOffset > 300)
                continue;
            
            if (sel == (i - areaData.trophyStart))
            {
                draw_set_color(c_yellow);
            }
            else if (!global.trophies[i])
            {
                switch (global.trophy_kinds[i])
                {
                    case 0:
                        draw_set_color(#AD7A46);
                        break;
                    
                    case 1:
                        draw_set_color(#A0A0A0);
                        break;
                    
                    case 2:
                        draw_set_color(#C18A1D);
                        break;
                    
                    default:
                        draw_set_color(#467AAD);
                        break;
                }
            }
            
            draw_text(116, 176 + relOffset, dxd_raw(_string("extras.trophies.t{0}", i)));
            set_font(fnt_mainsm);
            draw_set_color(c_gray);
            draw_text(116, 210 + relOffset, dxd_raw(global.trophies[i] ? _string("extras.trophies.t{0}_d", i) : "extras.trophies.locked"));
            draw_set_color(c_white);
            set_font(fnt_main);
        }
        
        surface_reset_target();
        draw_surface_part(trophySurface, 0, 160, 640, 320, 0, 160);
        draw_set_halign(fa_center);
        var completed = numAchieved / areaData.trophyNum;
        global.dxformat[0] = _string(numAchieved);
        global.dxformat[1] = _string(areaData.trophyNum);
        global.dxformat[2] = _string(floor(completed * 100));
        draw_text(320, 104, dxd_int("extras.trophies.lprogress"));
        draw_set_halign(fa_left);
        
        if (numAchieved != areaData.trophyNum)
            draw_rectangle_pix(232, 138, 178, 8, areaData.progressColorIncomplete, 1);
        
        draw_rectangle_pix(232, 138, floor(178 * completed), 8, areaData.progressColorComplete, 1);
        break;
}
