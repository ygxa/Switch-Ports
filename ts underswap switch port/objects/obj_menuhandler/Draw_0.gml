var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
background.draw(vx, vy, 1);

if (fadeBackground != undefined)
    fadeBackground.draw(vx, vy, fadeBackgroundAlpha);

draw_sprite_ext(spr_fadebg, 0, vx, vy, 640, 2, 0, c_white, 1);

if (global.debug)
{
    if (obj_debugger.hitboxes)
        exit;
}

var bookmarkX = 322;

for (var i = 0; i < 2; i++)
{
    if (bookmarksActive[i])
    {
        draw_sprite_ext(spr_mbook_bookmark, i, bookmarkX, bookmarkY[i], 2, 2, 0, c_white, 1);
        bookmarkX += 52;
    }
}

draw_sprite_ext(spr_mbook, 0, 0, 0, 2, 2, 0, c_white, 1);
set_font(fnt_crypt);
draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_text(320 + vx, 448 + vy, "TS!UNDERSWAP DEMO V2.0.9 (C) TEAM SWITCHED 2025");
draw_text(320 + vx, 462 + vy, "UNDERTALE / DELTARUNE (C) TOBY FOX");
draw_set_halign(fa_left);

if (!enabled)
    exit;

if (room == rm_load)
{
    switch (options)
    {
        case 1:
            if (!instance_exists(obj_flip))
            {
                draw_set_color(c_white);
                set_font(fnt_main);
                draw_set_halign(fa_left);
                draw_text(90, 94, global.lplayername);
                
                if (storedText == undefined)
                {
                    storedText = array_create(12);
                    global.dxformat[0] = _string(floor(global.ltimeseconds / 60));
                    var seconds = global.ltimeseconds % 60;
                    
                    if (seconds < 10)
                        global.dxformat[1] = _string("0{0}", seconds);
                    else
                        global.dxformat[1] = _string(seconds);
                    
                    storedText[0] = dxd_int("save.time");
                    global.dxformat[0] = _string(global.lplayerlv);
                    storedText[1] = dxd_int("save.lv");
                    global.dxformat[0] = thousandify(global.lplayerxp);
                    storedText[2] = dxd_int("save.exp");
                    global.dxformat[0] = _string(global.lplayerhp);
                    storedText[3] = dxd_int("save.hp");
                    global.dxformat[0] = thousandify(global.lplayergold, dxd_raw("save.rich"));
                    storedText[4] = dxd_int("save.gold");
                    storedText[5] = room_title_m(room_id(global.lloadedroom));
                    
                    if (global.debug)
                    {
                        if (storedText[5] == undefined)
                            storedText[5] = room_get_name(global.lloadedroom);
                    }
                    
                    storedText[6] = dxd_raw("main_menu.lcontinue");
                    storedText[7] = dxd_raw("main_menu.lreset");
                    storedText[8] = dxd_raw("main_menu.loptions");
                    storedText[9] = dxd_raw("main_menu.lcredits");
                    storedText[10] = dxd_raw("main_menu.lextras");
                    storedText[11] = dxd_raw("main_menu.lfileselect");
                }
                
                draw_sprite_ext(spr_clock, 0, 196, 102, 2, 2, 0, c_white, 1);
                draw_text(224, 94, storedText[0]);
                draw_text(90, 142, storedText[1]);
                draw_text(196, 142, storedText[2]);
                draw_text(90, 170, storedText[3]);
                draw_text(196, 170, storedText[4]);
                draw_set_halign(fa_center);
                draw_text(190, 216, storedText[5]);
                draw_set_halign(fa_left);
                
                if (selected == 1)
                    draw_set_color(colorSelect);
                
                draw_text(364, 94, storedText[6]);
                
                if (selected == 2)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 132, storedText[7]);
                
                if (selected == 3)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(global.spep ? c_gray : c_white);
                
                draw_text_icons(364, 170, storedText[11]);
                
                if (selected == 4)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 232, storedText[8]);
                
                if (selected == 5)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 270, storedText[9]);
                
                if (selected == 6)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 308, storedText[10]);
            }
            
            break;
        
        case 6:
            if (!instance_exists(obj_flip))
            {
                set_font(fnt_main);
                draw_set_halign(fa_center);
                draw_set_color(c_white);
                draw_text(448, 94, dxd_raw("main_menu.ltfileselect"));
                draw_set_halign(fa_left);
                
                if (selected == 1)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(352, 140, dxd_raw("main_menu.lfile0"));
                
                if (selected == 2)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(352, 176, dxd_raw("main_menu.lfile1"));
                
                if (selected == 3)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(352, 212, dxd_raw("main_menu.lfile2"));
                var data = slotData[selected - 1];
                draw_set_color(c_gray);
                
                if (is_undefined(data))
                {
                    draw_set_halign(fa_center);
                    draw_text(190, 152, storedText[0]);
                    draw_set_halign(fa_left);
                }
                else
                {
                    draw_text(90, 94, data.playerName);
                    draw_sprite_ext(spr_clock, 0, 196, 102, 2, 2, 0, c_gray, 1);
                    draw_text(224, 94, storedText[0]);
                    draw_text(90, 142, storedText[1]);
                    draw_text(196, 142, storedText[2]);
                    draw_text(90, 170, storedText[3]);
                    draw_text(196, 170, storedText[4]);
                    draw_set_halign(fa_center);
                    draw_text(190, 216, storedText[5]);
                    draw_set_halign(fa_left);
                }
            }
            
            break;
    }
}
else
{
    switch (options)
    {
        case 1:
            if (!instance_exists(obj_flip))
            {
                if (storedText == undefined)
                {
                    storedText = array_create(7);
                    storedText[0] = dxd_raw("main_menu.linstr_title");
                    storedText[2] = dxd_raw("main_menu.linstr_right");
                    storedText[3] = dxd_raw("main_menu.lbegin");
                    storedText[4] = dxd_raw("main_menu.loptions");
                    storedText[5] = dxd_raw("main_menu.lcredits");
                    storedText[6] = dxd_raw("main_menu.lextras");
                }
                
                draw_set_color(c_white);
                draw_set_halign(fa_center);
                set_font(fnt_main);
                draw_text(190, 100, storedText[0]);
                draw_set_halign(fa_left);
                
                if (global.control_gamepad && global.gamepad_buttons_type != -1)
                {
                    draw_text_icons(80, 152, dxd_raw("main_menu.linstr_control_gamepad"), true);
                }
                else if (global.ostype == 1)
                {
                    draw_text(80, 152, dxd_raw("main_menu.linstr_control_mobile"));
                }
                else if (global.keyboard_keys[0] == 90 && global.keyboard_keys[1] == 88 && global.keyboard_keys[2] == 67)
                {
                    draw_text(80, 152, dxd_raw("main_menu.linstr_control_default"));
                }
                else
                {
                    global.dxformat[0] = keycode_to_string(global.keyboard_keys[0]);
                    global.dxformat[1] = keycode_to_string(global.keyboard_keys[1]);
                    global.dxformat[2] = keycode_to_string(global.keyboard_keys[2]);
                    draw_text(80, 152, dxd_int("main_menu.linstr_control"));
                }
                
                draw_text(364, 100, storedText[2]);
                
                if (selected == 1)
                    draw_set_color(colorSelect);
                
                draw_text(364, 184, storedText[3]);
                
                if (selected == 2)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 226, storedText[4]);
                
                if (selected == 3)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 268, storedText[5]);
                
                if (selected == 4)
                    draw_set_color(colorSelect);
                else
                    draw_set_color(c_white);
                
                draw_text(364, 310, storedText[6]);
            }
            
            break;
    }
}

if (bfadealpha != 0)
    draw_rectangle_pix(0, 0, 640, 480, 0, bfadealpha);

if (options == 5)
{
    if (!instance_exists(obj_flip))
        obj_menuhandler_options_draw();
}

draw_set_halign(fa_left);

if (screenFade > 0)
    draw_rectangle_pix(0, 0, 640, 480, 0, screenFade);
