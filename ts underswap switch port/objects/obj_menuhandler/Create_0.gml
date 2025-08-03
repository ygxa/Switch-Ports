obj_gamemanager.hideScreen = false;

if (global.ostype != 1)
    keyboard_string = "";

depth = 1;
menuVariant = undefined;
bookmarkY[1] = 0;

updateSave = function(argument0)
{
    var prevMenuVariant;
    
    if (argument0)
        prevMenuVariant = menuVariant;
    
    menuVariant = "menu";
    bookmarksActive[0] = global.journal_health[0] == (1 << 0);
    bookmarksActive[1] = ds_map_find_value(global.flags, "sts_hangout");
    var sum = 1;
    
    for (var i = 0; i < 2; i++)
    {
        bookmarkY[i] = 76;
        
        if (bookmarksActive[i])
            sum++;
    }
    
    if (sum >= 2)
        menuVariant = "menu" + _string(sum);
    
    if (argument0)
    {
        if (prevMenuVariant != menuVariant)
        {
            if (alarm[2] == -1)
            {
                music_gain(0, 500);
                alarm[2] = game_get_speed(gamespeed_fps) * 0.5;
            }
        }
    }
};

updateSave(false);

updateSlot = function()
{
    var data = slotData[selected - 1];
    
    if (is_undefined(data))
    {
        storedText[0] = dxd_raw("main_menu.lemptyslot");
        global.currentarea = -1;
    }
    else
    {
        global.currentarea = data.area;
        global.dxformat[0] = _string(floor(data.timeSeconds / 60));
        var seconds = data.timeSeconds % 60;
        
        if (seconds < 10)
            global.dxformat[1] = _string("0{0}", seconds);
        else
            global.dxformat[1] = _string(seconds);
        
        storedText[0] = dxd_int("save.time");
        global.dxformat[0] = _string(data.playerLv);
        storedText[1] = dxd_int("save.lv");
        global.dxformat[0] = thousandify(data.playerXp);
        storedText[2] = dxd_int("save.exp");
        global.dxformat[0] = _string(data.playerHp);
        storedText[3] = dxd_int("save.hp");
        global.dxformat[0] = thousandify(data.playerGold, dxd_raw("save.rich"));
        storedText[4] = dxd_int("save.gold");
        storedText[5] = room_title_m(data.loadedRoomRaw);
        
        if (global.debug)
        {
            if (storedText[5] == undefined)
                storedText[5] = room_get_name(data.loadedRoom);
        }
    }
};

lastSaveVariant = 0;

fullLoadSlot = function()
{
    if (is_undefined(slotData[selected - 1]))
    {
        options = 50;
        stats_init(false);
        flags_init(false);
        global.playername = "";
        global.lplayername = "";
        control_clear_confirm();
        instance_create(obj_namehandler);
        instance_create(obj_flip).trigger(false);
        enabled = false;
    }
    else
    {
        stats_init(false);
        flags_init(false);
        loadgame(global.save_variant);
        persist_load_local(true);
        
        if (global.gamebroke != -1)
            exit;
        
        if (global.loadedroom == undefined || string_length(global.playername) > 6)
        {
            global.gamebroke = 1;
            room_goto(rm_gamebroke);
            exit;
        }
        
        global.tempflag = 0;
        updateSave(true);
        ds_map_set(global.pflags_global, "file", global.save_variant);
        persist_save();
        options = 1;
        selected = 3;
        storedText = undefined;
        instance_create(obj_flip).trigger(true);
    }
};

obj_menuhandler_options_init();
selected = 1;

if (room == rm_load)
    selectMax = 6;
else
    selectMax = 4;

if (!music_is_current(menuVariant))
    music_lcplay(menuVariant, true);

options = 1;
section = 1;
substate = 0;
enabled = true;
bfadealpha = 0;
screenFade = 1;
storedText = undefined;
unresponsive = 0;
slotData = array_create(3);

Background = function() constructor
{
    static update = function()
    {
        if (global.debug)
        {
            if (keyboard_check(vk_f3))
            {
                if (global.control_up)
                    bgLayerY[0]--;
                
                if (global.control_down)
                    bgLayerY[0]++;
            }
        }
        
        if (enterBg)
        {
            var allDone = true;
            
            for (var i = 0; i < 3; i++)
            {
                if (bgLayer[i] != -1)
                {
                    var a = bgLayerYDone[i];
                    var b = bgLayerAlphaDone[i];
                    var temp = number_approach_smooth(bgLayerY[i], a, bgLayerEnterSpeed[i], 1);
                    bgLayerY[i] = temp;
                    bgLayerAlpha[i] += bgLayerAlphaSpeed[i];
                    
                    if (bgLayerAlpha[i] >= b)
                    {
                        bgLayerAlpha[i] = b;
                        allDone &= (a == temp);
                    }
                    else
                    {
                        allDone = false;
                    }
                }
            }
            
            if (allDone)
                enterBg = false;
        }
        
        if (bgFrameSpeed != 0)
        {
            bgFrame += bgFrameSpeed;
            
            if (floor(bgFrame) >= bgFrameCount)
                bgFrame = 0;
        }
        
        if (moveBg)
        {
            for (var i = 0; i < 3; i++)
            {
                if (bgLayer[i] != -1)
                {
                    var s = bgLayerSpeed[i];
                    var w = bgLayerWidth[i];
                    var nw = -w;
                    bgLayerX[i] += s;
                    bgLayerX2[i] += s;
                    
                    if (s < 0 && bgLayerX[i] <= nw)
                        bgLayerX[i] = w - (nw - bgLayerX[i]);
                    else if (bgLayerX[i] >= w)
                        bgLayerX[i] = nw + (bgLayerX[i] - w);
                    
                    if (s < 0 && bgLayerX2[i] <= nw)
                        bgLayerX2[i] = w - (nw - bgLayerX2[i]);
                    else if (bgLayerX2[i] >= w)
                        bgLayerX2[i] = nw + (bgLayerX2[i] - w);
                }
            }
        }
    };
    
    static draw = function(argument0, argument1, argument2)
    {
        if (argument2 != 1)
        {
            if (surf == -1 || !surface_exists(surf))
                surf = surface_create(1024, 512);
            
            surface_set_target(surf);
            draw_clear_alpha(c_black, 1);
        }
        else if (surf != -1 && surface_exists(surf))
        {
            surface_free(surf);
            surf = -1;
        }
        
        for (var i = 0; i < 3; i++)
        {
            var b = bgLayer[i];
            
            if (b != -1)
            {
                var _x = floor(bgLayerX[i]);
                var _x2 = floor(bgLayerX2[i]);
                var _y = floor(bgLayerY[i]) * 2;
                var a = bgLayerAlpha[i];
                
                if (i == 0)
                {
                    draw_rectangle_pix(argument0, argument1, 640, 480, merge_color(c_black, bgColor, a), 1);
                    
                    if (b == bkg_star_parallax)
                        draw_rectangle_pix(argument0, argument1, 640, 40, 0, 1);
                }
                
                var w = sprite_get_width(b);
                var h = sprite_get_height(b);
                
                if (bgCutoff && i < 2 && bgLayer[i + 1] != -1)
                {
                    var top = floor(bgLayerY[i + 1]) * 2;
                    
                    if ((_y + (h * 2)) >= top)
                        h = floor(top - _y) * 0.5;
                }
                
                if (_x <= 324)
                    draw_sprite_part_ext(b, bgFrame, 0, 0, w, h, argument0 + (_x * 2), argument1 + _y, 2, 2, c_white, a);
                
                if (_x2 <= 324)
                    draw_sprite_part_ext(b, bgFrame, 0, 0, w, h, argument0 + (_x2 * 2), argument1 + _y, 2, 2, c_white, a);
            }
        }
        
        if (argument2 != 1)
        {
            surface_reset_target();
            draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, argument2);
        }
    };
    
    bgColor = 0;
    bgCutoff = false;
    bgFrame = 0;
    bgFrameCount = 0;
    bgFrameSpeed = 0;
    bgArea = global.currentarea;
    enterBg = false;
    moveBg = false;
    surf = -1;
    
    switch (global.currentarea)
    {
        case -1:
        default:
            bgLayer[0] = spr_parallax_cave0;
            bgLayer[1] = spr_parallax_cave1;
            bgLayer[2] = -1;
            bgColor = 530220;
            bgLayerSpeed[0] = -0.0625;
            bgLayerX[0] = 0;
            bgLayerYDone[0] = 0;
            bgLayerY[0] = 12;
            bgLayerAlpha[0] = 0;
            bgLayerAlphaDone[0] = 1;
            bgLayerAlphaSpeed[0] = 0.05;
            bgLayerEnterSpeed[0] = 0.1;
            bgLayerSpeed[1] = -0.25;
            bgLayerX[1] = 0;
            bgLayerYDone[1] = 0;
            bgLayerY[1] = 16;
            bgLayerAlpha[1] = 0;
            bgLayerAlphaDone[1] = 1;
            bgLayerAlphaSpeed[1] = 0.0625;
            bgLayerEnterSpeed[1] = 0.125;
            other.colorSelect = 65535;
            other.colorSelectUnfocused = 1919621;
            other.colorDoubleSelect = 255;
            other.colorSlider = 2389943;
            other.colorSliderSelected = 3054058;
            other.colorSliderPreview = 1991318;
            break;
        
        case 0:
        case 1:
            bgLayer[0] = spr_parallax_rh0;
            bgLayer[1] = spr_parallax_rh1;
            bgLayer[2] = spr_parallax_rh2;
            bgLayerSpeed[0] = -0.0625;
            bgLayerX[0] = 0;
            bgLayerYDone[0] = 0;
            bgLayerY[0] = 12;
            bgLayerAlpha[0] = 0;
            bgLayerAlphaDone[0] = 1;
            bgLayerAlphaSpeed[0] = 0.05;
            bgLayerEnterSpeed[0] = 0.1;
            bgLayerSpeed[1] = -0.125;
            bgLayerX[1] = 0;
            bgLayerYDone[1] = 0;
            bgLayerY[1] = 16;
            bgLayerAlpha[1] = 0;
            bgLayerAlphaDone[1] = 1;
            bgLayerAlphaSpeed[1] = 0.0625;
            bgLayerEnterSpeed[1] = 0.125;
            bgLayerSpeed[2] = -0.25;
            bgLayerX[2] = 0;
            bgLayerYDone[2] = 0;
            bgLayerY[2] = 20;
            bgLayerAlpha[2] = 0;
            bgLayerAlphaDone[2] = 1;
            bgLayerAlphaSpeed[2] = 0.075;
            bgLayerEnterSpeed[2] = 0.15;
            other.colorSelect = 65535;
            other.colorSelectUnfocused = 10526720;
            other.colorDoubleSelect = 255;
            other.colorSlider = 14188548;
            other.colorSliderSelected = 14203652;
            other.colorSliderPreview = 10182147;
            break;
        
        case 2:
            bgLayer[0] = bkg_star_parallax;
            bgLayer[1] = bkg_star_parallax;
            bgLayer[2] = bkg_star_parallax;
            bgColor = 3674632;
            bgCutoff = true;
            bgFrameCount = 4;
            bgFrameSpeed = 0.05;
            bgLayerSpeed[0] = -0.0625;
            bgLayerX[0] = 80;
            bgLayerYDone[0] = 2;
            bgLayerY[0] = 14;
            bgLayerAlpha[0] = 0;
            bgLayerAlphaDone[0] = 1;
            bgLayerAlphaSpeed[0] = 0.075;
            bgLayerEnterSpeed[0] = 0.125;
            bgLayerSpeed[1] = -0.0625;
            bgLayerX[1] = 40;
            bgLayerYDone[1] = 42;
            bgLayerY[1] = 54;
            bgLayerAlpha[1] = 0;
            bgLayerAlphaDone[1] = 1;
            bgLayerAlphaSpeed[1] = 0.075;
            bgLayerEnterSpeed[1] = 0.125;
            bgLayerSpeed[2] = -0.0625;
            bgLayerX[2] = 0;
            bgLayerYDone[2] = 82;
            bgLayerY[2] = 94;
            bgLayerAlpha[2] = 0;
            bgLayerAlphaDone[2] = 1;
            bgLayerAlphaSpeed[2] = 0.075;
            bgLayerEnterSpeed[2] = 0.125;
            other.colorSelect = 65535;
            other.colorSelectUnfocused = 12664709;
            other.colorDoubleSelect = 255;
            other.colorSlider = 12664709;
            other.colorSliderSelected = 14245826;
            other.colorSliderPreview = 9843047;
            break;
        
        case 3:
            bgLayer[0] = bkg_star_parallax;
            bgLayer[1] = bkg_star_parallax;
            bgLayer[2] = bkg_star_parallax;
            bgColor = 3674632;
            bgCutoff = true;
            bgFrameCount = 4;
            bgFrameSpeed = 0.05;
            bgLayerSpeed[0] = -0.0625;
            bgLayerX[0] = 80;
            bgLayerYDone[0] = 2;
            bgLayerY[0] = 14;
            bgLayerAlpha[0] = 0;
            bgLayerAlphaDone[0] = 1;
            bgLayerAlphaSpeed[0] = 0.075;
            bgLayerEnterSpeed[0] = 0.125;
            bgLayerSpeed[1] = -0.0625;
            bgLayerX[1] = 40;
            bgLayerYDone[1] = 42;
            bgLayerY[1] = 54;
            bgLayerAlpha[1] = 0;
            bgLayerAlphaDone[1] = 1;
            bgLayerAlphaSpeed[1] = 0.075;
            bgLayerEnterSpeed[1] = 0.125;
            bgLayerSpeed[2] = -0.0625;
            bgLayerX[2] = 0;
            bgLayerYDone[2] = 82;
            bgLayerY[2] = 94;
            bgLayerAlpha[2] = 0;
            bgLayerAlphaDone[2] = 1;
            bgLayerAlphaSpeed[2] = 0.075;
            bgLayerEnterSpeed[2] = 0.125;
            other.colorSelect = 65535;
            other.colorSelectUnfocused = 7361727;
            other.colorDoubleSelect = 255;
            other.colorSlider = 7361727;
            other.colorSliderSelected = 8150488;
            other.colorSliderPreview = 5455763;
            break;
    }
    
    for (var i = 0; i < 3; i++)
    {
        var b = bgLayer[i];
        
        if (b != -1)
        {
            var temp = sprite_get_width(b);
            bgLayerWidth[i] = temp;
            bgLayerX2[i] = bgLayerX[i] + temp;
        }
    }
};

background = new Background();
fadeBackground = undefined;
fadeBackgroundAlpha = 0;
alarm[1] = 1;
