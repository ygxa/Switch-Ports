function ExtrasOptionMenu(argument0, argument1, argument2) constructor
{
    static build = function(argument0)
    {
        sel = 0;
        array_resize(options, 0);
        self.builder(argument0);
    };
    
    static update = function(argument0)
    {
        if (global.control_down_pressed)
        {
            var preSel = sel;
            var expr;
            
            do
            {
                sel = number_add_wrap(sel, array_length(options) - 1);
                expr = options[sel].isActive();
                
                if (sel == preSel)
                    break;
            }
            until (expr);
        }
        
        if (global.control_up_pressed)
        {
            var preSel = sel;
            var expr;
            
            do
            {
                sel = number_sub_wrap(sel, array_length(options) - 1);
                expr = options[sel].isActive();
                
                if (sel == preSel)
                    break;
            }
            until (expr);
        }
        
        if (argument0.cancelPressed)
        {
            sel = 0;
            argument0.sel = argument0.currentOptionMenu;
            argument0.menu = (2 << 0);
            exit;
        }
        
        if (argument0.confirmPressed || global.control_left_pressed || global.control_right_pressed)
        {
            if (options[sel].isActive())
                options[sel].use(argument0.confirmPressed, global.control_left_pressed, global.control_right_pressed);
            else
                sfx_play(snd_error);
        }
    };
    
    static draw = function(argument0)
    {
        var _y = 170;
        
        if (argument0)
        {
            var i = 0;
            var n = array_length(options);
            
            while (i < n)
            {
                if (!options[i].isActive())
                    draw_set_color(merge_color(c_dkgray, c_black, 0.5));
                else
                    draw_set_color(c_dkgray);
                
                var text = options[i].getText(30, _y, false, true);
                draw_text(30, _y, text);
                _y += options[i].height;
                i++;
            }
        }
        else
        {
            var i = 0;
            var n = array_length(options);
            
            while (i < n)
            {
                if (!options[i].isActive())
                    draw_set_color(c_dkgray);
                else
                    draw_set_color((sel == i) ? c_yellow : c_white);
                
                var text = options[i].getText(30, _y, sel == i, false);
                draw_text(30, _y, text);
                _y += options[i].height;
                i++;
            }
        }
    };
    
    function ExtrasOption(argument0) constructor
    {
        static setText = function(argument0)
        {
            getText = method(self, argument0);
            return self;
        };
        
        static setUse = function(argument0)
        {
            use = method(self, argument0);
            return self;
        };
        
        static setActive = function(argument0)
        {
            isActive = method(self, argument0);
            return self;
        };
        
        static setHeight = function(argument0)
        {
            height = argument0;
            return self;
        };
        
        getText = undefined;
        use = undefined;
        
        isActive = function()
        {
            return true;
        };
        
        height = 36;
    }
    
    title = argument0;
    topTitle = argument1;
    options = [];
    builder = method(self, argument2);
    sel = 0;
}

menu = (0 << 0);
sel = -1;
currentOptionMenu = 0;
optionMenus = [new ExtrasOptionMenu("extras.menu.lgameplay", "extras.menu.lgameplay_title", function(argument0)
{
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        if (global.ctoskip)
            global.dxformat[0] = dxd_raw("extras.menu.lon");
        else
            global.dxformat[0] = dxd_raw("extras.menu.loff");
        
        return dxd_int("extras.gameplay.lmbtoskip");
    }).setUse(function(argument0, argument1, argument2)
    {
        global.ctoskip = !global.ctoskip;
        config_save();
    }));
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        if (argument2)
            draw_sprite(spr_extras_flavor, global.flavor_sprites ? 1 : 0, 640 - argument0, argument1 + 4);
        
        if (global.flavor_sprites)
            global.dxformat[0] = dxd_raw("extras.gameplay.lflavored");
        else
            global.dxformat[0] = dxd_raw("extras.gameplay.lclassic");
        
        return dxd_int("extras.gameplay.lbattlesprites");
    }).setUse(function(argument0, argument1, argument2)
    {
        global.flavor_sprites = !global.flavor_sprites;
        config_save();
    }));
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        if (argument2)
            draw_menu_rectangle(640 - argument0 - 24, argument1 + 4, 640 - argument0, argument1 + 24 + 4, 1);
        
        if (ds_map_find_value(global.pflags_global, "box_border") == 1)
            global.dxformat[0] = dxd_raw("extras.gameplay.lclassic");
        else
            global.dxformat[0] = dxd_raw("extras.gameplay.ltsus");
        
        return dxd_int("extras.gameplay.lmenuskin");
    }).setUse(function(argument0, argument1, argument2)
    {
        ds_map_set(global.pflags_global, "box_border", !ds_map_find_value(global.pflags_global, "box_border"));
        persist_save();
    }).setActive(function()
    {
        return ds_map_find_value(global.pflags_global, "menuskin");
    }));
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        if (argument2)
        {
            var preFont = draw_get_font();
            var preColor = draw_get_color();
            set_font(fnt_mainsm);
            draw_set_color(c_gray);
            draw_set_halign(fa_right);
            draw_set_valign(fa_middle);
            draw_text(610, argument1 + 16, dxd_raw("extras.gameplay.ldifficulty_desc"));
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            set_font(preFont);
            draw_set_color(preColor);
        }
        
        global.dxformat[0] = _string(floor((global.difficulty + 0.001) * 100));
        var str = dxd_int("extras.gameplay.ldifficulty");
        
        if (argument2)
            draw_sprite_ext(spr_arrowshorz, 0, argument0 + string_width(str) + 16, argument1 + 10, 2, 2, 0, c_white, 1);
        
        return str;
    }).setUse(function(argument0, argument1, argument2)
    {
        var prevDifficulty = global.difficulty;
        
        if (argument1)
            global.difficulty -= 0.1;
        
        if (argument2)
            global.difficulty += 0.1;
        
        global.difficulty = clamp(global.difficulty, 0, 1);
        
        if (prevDifficulty != global.difficulty)
            config_save();
    }));
}), new ExtrasOptionMenu("extras.menu.ltrophies", "extras.menu.ltrophies_title", function(argument0)
{
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2, argument3)
    {
        var areaData = global.trophy_areas[0];
        var numAchieved = 0;
        
        for (var i = areaData.trophyStart; i <= areaData.trophyEnd; i++)
        {
            var curr = global.trophies[i];
            numAchieved += (curr ? 1 : 0);
        }
        
        var completed = numAchieved / areaData.trophyNum;
        global.dxformat[0] = _string(numAchieved);
        global.dxformat[1] = _string(areaData.trophyNum);
        global.dxformat[2] = _string(floor(completed * 100));
        var colorLerp = argument3 ? 0.5 : (argument2 ? 0 : 0.2);
        
        if (numAchieved != areaData.trophyNum)
            draw_rectangle_pix(432, argument1 + 12, 178, 8, merge_color(areaData.progressColorIncomplete, c_black, colorLerp), 1);
        
        draw_rectangle_pix(432, argument1 + 12, floor(178 * completed), 8, merge_color(areaData.progressColorComplete, c_black, colorLerp), 1);
        return dxd_int("extras.trophies.lruinedhome");
    }).setUse(function(argument0, argument1, argument2)
    {
        if (argument0)
        {
            with (obj_extras)
            {
                sel = 0;
                trophyY = 0;
                trophyArea = 0;
                menu = (7 << 0);
            }
        }
    }));
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2, argument3)
    {
        var areaData = global.trophy_areas[1];
        var numAchieved = 0;
        
        for (var i = areaData.trophyStart; i <= areaData.trophyEnd; i++)
        {
            var curr = global.trophies[i];
            numAchieved += (curr ? 1 : 0);
        }
        
        var completed = numAchieved / areaData.trophyNum;
        global.dxformat[0] = _string(numAchieved);
        global.dxformat[1] = _string(areaData.trophyNum);
        global.dxformat[2] = _string(floor(completed * 100));
        var colorLerp = argument3 ? 0.5 : (argument2 ? 0 : 0.2);
        
        if (numAchieved != areaData.trophyNum)
            draw_rectangle_pix(432, argument1 + 12, 178, 8, merge_color(areaData.progressColorIncomplete, c_black, colorLerp), 1);
        
        draw_rectangle_pix(432, argument1 + 12, floor(178 * completed), 8, merge_color(areaData.progressColorComplete, c_black, colorLerp), 1);
        return dxd_int("extras.trophies.lstarlightisles");
    }).setUse(function(argument0, argument1, argument2)
    {
        if (argument0)
        {
            with (obj_extras)
            {
                sel = 0;
                trophyY = 0;
                trophyArea = 1;
                menu = (7 << 0);
            }
        }
    }));
}), new ExtrasOptionMenu("extras.menu.lonline", "extras.menu.lonline_title", function(argument0)
{
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        return dxd_raw(obj_extras.gamejoltActive ? "extras.online.lgamejolt_s" : "extras.online.lgamejolt_c");
    }).setUse(function(argument0, argument1, argument2)
    {
        if (argument0)
        {
            with (obj_extras)
            {
                if (gamejoltActive)
                {
                    sel = 0;
                    menu = (5 << 0);
                    
                    if (instance_exists(obj_gamejolt))
                        obj_gamejolt.fileDownload = (0 << 0);
                }
                else
                {
                    fading = 2;
                    alpha = 1;
                    
                    fadeOutCallback = function()
                    {
                        menu = (4 << 0);
                        instance_create(obj_gamejolt_login);
                    };
                }
            }
        }
    }));
    
    if (argument0.discordPresenceSupported)
    {
        array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
        {
            if (global.presence)
                global.dxformat[0] = dxd_raw("extras.menu.lon");
            else
                global.dxformat[0] = dxd_raw("extras.menu.loff");
            
            return dxd_int("extras.online.lrichpresence");
        }).setUse(function(argument0, argument1, argument2)
        {
            global.presence = !global.presence;
            config_save();
            
            if (global.presence)
                presence_init();
            else
                discord_reset();
        }));
    }
}), new ExtrasOptionMenu("extras.menu.lother", "extras.menu.lother_title", function(argument0)
{
    array_push(options, new ExtrasOption().setText(function(argument0, argument1, argument2)
    {
        return dxd_raw("extras.other.lbugerpant");
    }).setUse(function(argument0, argument1, argument2)
    {
        if (argument0)
        {
            with (obj_extras)
            {
                fading = 2;
                alpha = 1;
                
                fadeOutCallback = function()
                {
                    audio_kill_all();
                    room_goto(rm_bugerpant_disclaimer);
                };
            }
        }
    }).setActive(function()
    {
        return ds_map_find_value(global.pflags_global, "buger");
    }));
})];
gamejoltActive = instance_exists(obj_gamejolt);
discordPresenceSupported = os_type == os_windows;
alpha = 0;
fading = 3;
fadeOutCallback = undefined;
gjTimer = -1;
trophyArea = 0;
trophyY = 0;
trophySurface = -1;
confirmPressed = false;
cancelPressed = false;
confirmBuffer = 0;
cancelBuffer = 0;
instance_create(obj_extras_bg);
depth = -200;
var month = current_month;

if (global.debug)
{
    if (obj_debugger.month != -1)
        month = obj_debugger.month;
}

if (month == 12 || month <= 2)
    weather = 0;
else if (month >= 3 && month <= 5)
    weather = 1;
else if (month >= 6 && month <= 8)
    weather = 2;
else
    weather = 3;

instance_create(obj_seasonal_deco).season = weather;
sfx_play(snd_extrasopen);
