if (areaTimer > 0)
{
    areaTimer--;
    
    if (areaTimer <= 0)
    {
        areaTimer = -1;
        
        if (room != rm_load && room != rm_extras && room != rm_testencounters)
            debug_error("Area not set after loading!");
    }
}

mouseX = floor(((window_mouse_get_x() - obj_gamemanager.screenXOffset) * (1 / obj_gamemanager.screenXScale) * (camera_get_view_width(view_camera[0]) / 640)) + camera_get_view_x(view_camera[0]));
mouseY = floor(((window_mouse_get_y() - obj_gamemanager.screenYOffset) * (1 / obj_gamemanager.screenYScale) * (camera_get_view_height(view_camera[0]) / 480)) + camera_get_view_y(view_camera[0]));

if (!reloading && keyboard_check_pressed(vk_f5))
{
    game_restart_safe();
    exit;
}

if (keyboard_check_pressed(vk_f1))
{
    label = (debugMenu == (0 << 0)) ? !label : false;
    labelMore = keyboard_check(vk_shift);
}

if (debugBuffer > 0)
{
    debugBuffer--;
    exit;
}

var clear = debugMenu != (0 << 0);

if (clear)
    debugMove |= global.canmove;

switch (debugMenu)
{
    case (1 << 0):
        if (global.control_cancel_pressed)
        {
            debugMenu = (0 << 0);
            
            if (global.ostype == 1)
                label = true;
            
            global.canmove = debugMove;
        }
        
        if (global.control_up_pressed || global.control_left_pressed)
            debugMenuSel = number_sub_wrap(debugMenuSel, ds_list_size(debugOptions) - 1);
        
        if (global.control_down_pressed || global.control_right_pressed)
            debugMenuSel = number_add_wrap(debugMenuSel, ds_list_size(debugOptions) - 1);
        
        if (global.control_confirm_pressed)
        {
            debugMenu = (0 << 0);
            method(self, ds_list_find_value(debugOptions, debugMenuSel).func)();
            
            if (debugMenu == (0 << 0))
            {
                if (global.ostype == 1)
                    label = true;
                
                global.canmove = debugMove;
            }
        }
        
        break;
    
    case (2 << 0):
        if (global.control_cancel_pressed)
        {
            debugMenu = (0 << 0);
            
            if (global.ostype == 1)
                label = true;
            
            global.canmove = debugMove;
        }
        
        break;
}

if (clear)
{
    control_clear_cancel();
    control_clear_confirm();
    control_clear_menu();
    control_clear_up();
    control_clear_down();
    control_clear_left();
    control_clear_right();
}

if (debugMenu == (0 << 0) && keyboard_check(vk_f2))
{
    if (keyboard_check_pressed(192) || keyboard_check_pressed(ord("2")))
    {
        debugMenu = (1 << 0);
        debugMove = global.canmove;
        global.canmove = false;
        debugMenuSel = 0;
        label = false;
        exit;
    }
    
    if (keyboard_check_pressed(ord("Q")))
    {
        if (room != room_first)
        {
            room_goto_previous();
            event_user(0);
        }
    }
    
    if (keyboard_check_pressed(ord("W")))
    {
        if (room != room_last)
        {
            room_goto_next();
            event_user(0);
        }
    }
    
    if (keyboard_check_pressed(ord("H")))
        debugInvincible();
    
    if (keyboard_check_pressed(ord("F")))
    {
        if (faceDebug)
        {
            faceDebug = false;
        }
        else if (global.ostype == 0 && obj_overworldui.state == (1 << 0) && !objectDebug)
        {
            var portraitSprite = obj_overworldui.portraitSprite;
            
            if (obj_overworldui.secondPortraitSprite != -1)
            {
                faceSecondary = true;
                portraitSprite = obj_overworldui.secondPortraitSprite;
            }
            else
            {
                faceSecondary = false;
            }
            
            var arr = asset_get_tags(portraitSprite, 1);
            var faceType = undefined;
            var i = array_length(arr) - 1;
            
            while (i >= 0)
            {
                if (string_starts_with(arr[i], "face_"))
                {
                    faceType = arr[i];
                    faceName = string_copy(faceType, 6, string_length(faceType) - 5);
                    break;
                }
                
                i--;
            }
            
            if (faceType != undefined)
            {
                faceDebug = true;
                arr = tag_get_asset_ids(faceType, 1);
                array_sort(arr, function(argument0, argument1)
                {
                    var nameA = sprite_get_name(argument0);
                    var nameB = sprite_get_name(argument1);
                    
                    if (nameA < nameB)
                        return -1;
                    
                    if (nameA > nameB)
                        return 1;
                    
                    return 0;
                });
                var _x = 8;
                var _y = 8;
                var len = array_length(arr);
                faceArray = array_create(len);
                var faceHeight = 1;
                
                for (i = 0; i < len; i++)
                {
                    var thisWidth = sprite_get_width(arr[i]);
                    var thisHeight = sprite_get_height(arr[i]);
                    faceHeight = max(faceHeight, thisHeight);
                    
                    if ((_x + thisWidth + 8) >= 640)
                    {
                        _x = 8;
                        _y += (faceHeight + 8);
                        faceHeight = 1;
                    }
                    
                    faceArray[i] = [arr[i], _x + sprite_get_xoffset(arr[i]), _y + sprite_get_yoffset(arr[i]), _x, _y, _x + thisWidth, _y + thisHeight];
                    _x += (thisWidth + 8);
                }
            }
            else
            {
                sfx_play(snd_error);
            }
        }
        else
        {
            debugFps();
        }
    }
    
    if (keyboard_check_pressed(ord("D")))
    {
        debugOverlay = !debugOverlay;
        audio_debug(keyboard_check(vk_shift) && debugOverlay);
        show_debug_overlay(debugOverlay);
    }
    
    if (keyboard_check_pressed(ord("G")))
        debugRoomSelect();
    
    if (keyboard_check_pressed(ord("V")))
    {
        if (room == rm_intro)
        {
            if (keyboard_check(vk_shift))
            {
                if (global.master_volume == 0)
                    global.master_volume = 0.6;
                
                if (global.sfx_volume == 0)
                    global.sfx_volume = 1;
                
                if (global.music_volume == 0)
                    global.music_volume = 1;
                else
                    global.music_volume = 0;
                
                debug_message("Toggled music volume");
            }
            else
            {
                if (global.music_volume == 0)
                    global.music_volume = 1;
                
                if (global.sfx_volume == 0)
                    global.sfx_volume = 1;
                
                if (global.master_volume == 0)
                    global.master_volume = 0.6;
                else
                    global.master_volume = 0;
                
                debug_message("Toggled master volume");
            }
            
            config_save();
        }
        else
        {
            debugAllVisible();
        }
    }
    
    if (keyboard_check_pressed(ord("B")))
        debugHitboxes();
    
    if (keyboard_check_pressed(ord("K")))
    {
        if (room == rm_battle)
        {
            debugAttack();
        }
        else
        {
            with (obj_player)
                accessory = number_add_wrap(accessory, 8);
            
            debug_message("Accessory swap");
        }
    }
    
    if (keyboard_check_pressed(ord("O")))
        debugStats();
    
    if (keyboard_check_pressed(ord("I")))
        itemSelector();
    
    if (keyboard_check_pressed(ord("X")))
        debugFullRoomView();
    
    if (keyboard_check_pressed(ord("Y")))
    {
        var _id = get_integer("Enter save ID to save as", global.save_variant);
        
        if (_id != undefined)
            savegame(_id);
    }
    
    if (keyboard_check_pressed(ord("U")))
    {
        var _id = get_integer("Enter save variant", global.save_variant);
        
        if (_id != undefined)
            global.save_variant = _id;
    }
    
    if (instance_exists(obj_player))
    {
        if (keyboard_check_pressed(ord("A")) && global.canmove)
        {
            debugMenu = (3 << 0);
            debugMove = global.canmove;
            global.canmove = false;
            
            with (instance_create(obj_debug_selector))
            {
                self.name = "Battlegroup Selector";
                var list = ds_list_create();
                var k = ds_map_find_first(global.battle_groups);
                
                while (k != undefined)
                {
                    ds_list_add(list, k);
                    k = ds_map_find_next(global.battle_groups, k);
                }
                
                ds_list_sort(list, true);
                var size = ds_list_size(list);
                
                for (var i = 0; i < size; i++)
                {
                    var curr = ds_list_find_value(list, i);
                    entryValues[i] = curr;
                    entryNames[i] = _string("{0} ({1})", ds_map_find_value(global.battle_groups, curr).name, curr);
                }
                
                callback = function(argument0)
                {
                    with (obj_debugger)
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                    }
                    
                    if (argument0 != -1)
                        bt_start(entryValues[argument0], false);
                };
                
                ds_list_destroy(list);
            }
        }
        
        if (keyboard_check_pressed(ord("N")))
        {
            noclip = !noclip;
            debug_message(_string("Noclip = {0}", noclip));
        }
        
        if (keyboard_check_pressed(ord("M")))
        {
            global.canmove = true;
            debug_message("Movement enabled");
        }
        
        if (keyboard_check_pressed(ord("E")))
        {
            with (obj_encounter_parent)
            {
                if (object_index != obj_encounter_nbs)
                {
                    obj_player.steps = requiredSteps;
                    debug_message("steps = requiredSteps");
                }
            }
        }
        
        if (keyboard_check_pressed(ord("L")))
        {
            lockCamera = !lockCamera;
            
            if (lockCamera)
            {
                camera_set_view_target(view_get_camera(0), obj_player);
                debug_message("Camera locked");
            }
            else
            {
                camera_set_view_target(view_get_camera(0), -4);
                debug_message("Camera unlocked");
            }
        }
        
        if (keyboard_check_pressed(ord("T")))
        {
            ds_map_set(global.flags, "wet", false);
            ds_map_set(global.flags, "run", true);
            ds_map_set(global.flags, "cell", true);
            
            if (!item_exists(2))
                items_add(2);
            
            if (!item_exists(4))
                items_add(4);
            
            if (ds_map_find_value(global.flags, "plot") < 39)
            {
                ds_map_set(global.flags, "plot", 38.5);
                
                if (!item_exists(6))
                    items_add(6);
                
                if (!item_exists(7))
                    items_add(7);
                
                if (!item_exists(3))
                    items_add(3);
                
                if (!item_exists(16))
                    items_add(16);
                
                if (!item_exists(17))
                    items_add(17);
                
                if (global.playergold < 100)
                    global.playergold = 100;
                
                room_goto(rm_star3);
            }
            else
            {
                room_goto(rm_star4);
            }
            
            event_user(0);
        }
    }
    else if (room == rm_extras && keyboard_check_pressed(ord("M")))
    {
        var m = get_integer("Set current month (1-12)", current_month);
        
        if (m != undefined)
        {
            month = m;
            music_kill_current();
            room_restart();
        }
    }
    
    if (room == rm_battle)
    {
        if (keyboard_check_pressed(ord("S")))
        {
            with (obj_monster_parent)
                isSpareable = true;
            
            debug_message("Everyone now spareable");
        }
        
        if (keyboard_check_pressed(ord("A")))
        {
            with (obj_battlemanager)
            {
                attackTime = 0;
                attackTimer = 0;
            }
            
            debug_message("Set attack timers to 0");
        }
    }
    else if (keyboard_check_pressed(ord("S")))
    {
        audio_kill_all();
    }
    
    if (keyboard_check_pressed(vk_space))
        debug_event("ResourceCounts");
    
    if (keyboard_check_pressed(ord("R")) && !reloading)
    {
        reloading = true;
        reloadRestart = keyboard_check(vk_shift);
        
        if (reloadDiannex)
        {
            global.__dx_filename = "data/game.dxb";
            
            if (file_exists("reload.dxb"))
                file_delete("reload.dxb");
            
            if (file_exists("reload_failure.txt"))
                file_delete("reload_failure.txt");
            
            var f = file_text_open_write("diannex_reload");
            file_text_write_string(f, "all");
            file_text_close(f);
            alarm[5] = game_get_speed(gamespeed_fps) * 8;
            //show_debug_message("Sent reload signal");
            
            with (obj_debug_message)
            {
                if (compileError)
                    instance_destroy();
            }
        }
    }
    
    if (keyboard_check_pressed(ord("Z")) && global.canmove)
    {
        debugMenu = (3 << 0);
        debugMove = global.canmove;
        global.canmove = false;
        
        with (instance_create(obj_debug_selector))
        {
            self.name = "Date Selector";
            var list = ds_list_create();
            var k = ds_map_find_first(global.hangout_groups);
            
            while (k != undefined)
            {
                ds_list_add(list, k);
                k = ds_map_find_next(global.hangout_groups, k);
            }
            
            ds_list_sort(list, true);
            var size = ds_list_size(list);
            
            for (var i = 0; i < size; i++)
            {
                var curr = ds_list_find_value(list, i);
                entryValues[i] = curr;
                entryNames[i] = _string("{0} ({1})", ds_map_find_value(global.hangout_groups, curr).name, curr);
            }
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    debugMenu = (0 << 0);
                    global.canmove = debugMove;
                }
                
                if (argument0 != -1)
                    dt_start(entryValues[argument0]);
            };
            
            ds_list_destroy(list);
        }
    }
}

if (invincible)
    global.playerhp = global.playermaxhp;

if (makeVisible && room != rm_battle)
{
    with (all)
    {
        if (!visible)
            visible = true;
    }
}

game_set_speed(gameSpeed, gamespeed_fps);

if (reloading)
{
    if (!reloadDiannex || file_exists("reload.dxb"))
    {
        alarm[5] = -1;
        
        if (reloadDiannex)
            //show_debug_message("Received reload data");
        
        if (reloadRestart)
        {
            //show_debug_message("Held shift... doing full restart and load afterwards");
            global.__insta_reload = true;
            global.__dx_filename = "reload.dxb";
            game_restart_safe();
            exit;
        }
        
        var time = get_timer();
        dx_instance_stop_scene(global.dxinst);
        
        with (obj_gamemanager)
            waitTimer = 0;
        
        ds_map_destroy(global.dxvars);
        
        if (reloadDiannex)
        {
            dx_unload_binary(global.dxbinary);
            dx_destroy_instance(global.dxinst);
            global.__dx_filename = "reload.dxb";
        }
        else
        {
            global.lang_loaded = "en";
        }
        
        global.lang_initialized = false;
        lang_init();
        //show_debug_message(_string("Reloaded in {0} ms", (get_timer() - time) * 0.001));
        room_restart();
        audio_kill_all();
        event_user(0);
        
        with (obj_overworldmenu)
        {
            if (active)
                global.canmove = false;
        }
        
        with (obj_overworldui)
            choice = 0;
        
        reloading = false;
    }
    else if (file_exists("reload_failure.txt"))
    {
        //show_debug_message("Received reload failure");
        var buff = buffer_load("reload_failure.txt");
        
        try
        {
            var str = buffer_read(buff, buffer_text);
            str = string_replace_all(str, "\r\n", "\n");
            var beginErrors = string_pos("...\n\n", str) + 5;
            
            if (beginErrors <= 5)
            {
                beginErrors = string_pos("...\n", str) + 4;
                
                if (beginErrors <= 4)
                    beginErrors = 1;
            }
            
            var endErrors = string_pos("Not proceeding", str);
            
            if (endErrors <= 0)
                endErrors = 10000;
            
            with (debug_error(string_copy(str, beginErrors, endErrors - beginErrors)))
                compileError = true;
        }
        catch (ex)
        {
            with (debug_error("Error reading compile error message"))
                compileError = true;
        }
        
        buffer_delete(buff);
        reloading = false;
        alarm[5] = -1;
    }
}

if (global.ostype == 0)
{
    if (objectDebug)
    {
        var clipboardHandled = false;
        
        if (mouse_check_button_pressed(mb_right))
        {
            if (objectDebugCamera)
            {
                objectDebugCamera = false;
            }
            else
            {
                objectDebugCamera = true;
                freecamX = camera_get_view_x(view_camera[0]);
                freecamY = camera_get_view_y(view_camera[0]);
            }
        }
        else if (objectDebugCamera)
        {
            var spd = keyboard_check(vk_shift) ? 4 : 2;
            
            if (objectDebugAlign)
                spd = keyboard_check(vk_shift) ? 5 : 10;
            
            if (keyboard_check(ord("A")))
                freecamX -= spd;
            
            if (keyboard_check(ord("D")))
                freecamX += spd;
            
            if (keyboard_check(ord("W")))
                freecamY -= spd;
            
            if (keyboard_check(ord("S")))
                freecamY += spd;
            
            if (objectDebugAlign)
            {
                freecamX = floor(freecamX / spd) * spd;
                freecamY = floor(freecamY / spd) * spd;
            }
            
            if (!clipboardHandled)
            {
                objectDebugClipboard = _string("{0}, {1}", freecamX, freecamY);
                clipboardHandled = true;
            }
        }
        
        if (mouse_check_button_pressed(mb_middle) || (keyboard_check(vk_control) && mouse_check_button_pressed(mb_left)))
        {
            objectDebug = false;
            window_set_cursor(cr_default);
        }
        else
        {
            if (keyboard_check_pressed(ord("1")))
                objectDebugOverlays = !objectDebugOverlays;
            
            if (keyboard_check_pressed(ord("2")))
                objectDebugAlign = !objectDebugAlign;
            
            if (keyboard_check_pressed(vk_backspace))
                objectDebugRelative = number_add_wrap(objectDebugRelative, 2);
            
            var candidate = -4;
            var list = ds_list_create();
            var count = collision_rectangle_list(mouseX - 2, mouseY - 2, mouseX + 2, mouseY + 2, all, false, true, list, true);
            
            for (var i = 0; i < count; i++)
            {
                if (ds_list_find_value(list, i).visible && ds_list_find_value(list, i).image_alpha != 0 && !ds_list_find_value(list, i).persistent)
                {
                    candidate = ds_list_find_value(list, i);
                    break;
                }
            }
            
            ds_list_destroy(list);
            
            if (candidate != -4)
            {
                objectDebugHovering = true;
                
                if (objectDebugSelected == -4)
                    window_set_cursor(cr_handpoint);
                
                if (mouse_check_button_pressed(mb_left))
                {
                    objectDebugSelected = candidate;
                    objectDebugSelectedXOff = candidate.x - mouseX;
                    objectDebugSelectedYOff = candidate.y - mouseY;
                    objectDebugMouseHold = 0;
                }
                else if (keyboard_check_pressed(191))
                {
                    if (keyboard_check(vk_shift))
                    {
                        var name = get_string("Variable name to set", "");
                        
                        if (name != undefined && name != "")
                        {
                            var existingVal = variable_instance_get(candidate, name);
                            var conversionFunc = is_string(existingVal) ? _string : real;
                            
                            switch (name)
                            {
                                case "sprite_index":
                                    conversionFunc = function(argument0)
                                    {
                                        if (argument0 == "-1")
                                            return -1;
                                        
                                        return asset_get_index_checked(argument0);
                                    };
                                    
                                    if (existingVal != -1)
                                        existingVal = sprite_get_name(existingVal);
                                    
                                    break;
                            }
                            
                            var val = get_string("Value to set " + name + " to", _string(existingVal));
                            
                            if (val != undefined)
                            {
                                try
                                {
                                    variable_instance_set(candidate, name, conversionFunc(val));
                                }
                                catch (ex)
                                {
                                    debug_error(ex);
                                }
                            }
                        }
                    }
                    else
                    {
                        var name = get_string("Variable name to track", "");
                        
                        if (name != undefined && name != "")
                        {
                            if (variable_instance_exists(candidate, "___TRACK_VARIABLE___"))
                                array_push(candidate.___TRACK_VARIABLE___, name);
                            else
                                candidate.___TRACK_VARIABLE___ = [name];
                        }
                    }
                }
                else if (mouse_wheel_up())
                {
                    candidate.image_index += 0.5;
                }
                else if (mouse_wheel_down())
                {
                    candidate.image_index -= 0.5;
                }
            }
            else
            {
                objectDebugHovering = false;
                
                if (objectDebugSelected == -4)
                    window_set_cursor(cr_default);
            }
            
            if (objectDebugSelected != -4)
            {
                if (!clipboardHandled)
                {
                    with (objectDebugSelected)
                    {
                        other.objectDebugClipboard = _string("{0}, {1}", x, y);
                        clipboardHandled = true;
                    }
                }
                
                if (mouse_check_button(mb_left))
                {
                    if (objectDebugMouseHold < 2)
                    {
                        if (candidate == objectDebugSelected)
                            objectDebugMouseHold++;
                        else
                            objectDebugMouseHold = 0;
                    }
                    else
                    {
                        window_set_cursor(cr_drag);
                        
                        with (objectDebugSelected)
                        {
                            x = other.mouseX + other.objectDebugSelectedXOff;
                            y = other.mouseY + other.objectDebugSelectedYOff;
                            
                            if (other.objectDebugAlign)
                            {
                                x = floor(x / 10) * 10;
                                y = floor(y / 10) * 10;
                            }
                            
                            other.objectDebugClipboard = _string(x) + ", " + _string(y);
                            clipboardHandled = true;
                        }
                    }
                }
                else
                {
                    objectDebugSelected = -4;
                }
            }
        }
        
        if (objectDebugClipboard != "" && keyboard_check_pressed(vk_tab))
        {
            clipboard_set_text(objectDebugClipboard);
            sfx_play(snd_bark);
            objectDebugClipboard = "";
        }
    }
    else if (faceDebug)
    {
        faceHovering = undefined;
        faceInfo = "";
        var len = array_length(faceArray);
        var guiMouseX = device_mouse_x_to_gui(0);
        var guiMouseY = device_mouse_y_to_gui(0);
        
        for (var i = 0; i < len; i++)
        {
            var curr = faceArray[i];
            
            if (guiMouseX >= curr[3] && guiMouseY >= curr[4] && guiMouseX <= curr[5] && guiMouseY <= curr[6])
            {
                faceHovering = curr;
                var _name = sprite_get_name(curr[0]);
                faceInfo = faceName + "_" + string_copy(_name, string_pos("face_", _name) + 5, string_length(_name));
                break;
            }
        }
        
        if (keyboard_check_pressed(vk_space))
        {
            faceIndex = !floor(faceIndex);
        }
        else if (keyboard_check(vk_space))
        {
            faceIndex += 0.1;
            
            if (floor(faceIndex) >= 2)
                faceIndex -= 2;
        }
        
        if (faceHovering != undefined)
        {
            if (keyboard_check_pressed(vk_tab))
            {
                clipboard_set_text(faceInfo);
                sfx_play(snd_bark);
            }
            
            if (mouse_check_button_pressed(mb_left))
            {
                clipboard_set_text(faceInfo);
                
                if (faceSecondary)
                    obj_overworldui.secondPortraitSprite = faceHovering[0];
                else
                    obj_overworldui.portraitSprite = faceHovering[0];
                
                sfx_play(snd_bark);
                faceDebug = false;
            }
        }
        
        if (keyboard_check_pressed(vk_escape))
            faceDebug = false;
    }
    else if ((mouse_check_button_pressed(mb_middle) || (keyboard_check(vk_control) && mouse_check_button_pressed(mb_left))) && !faceDebug)
    {
        objectDebug = true;
    }
}

if (fullRoomView)
{
    if (keyboard_check_pressed(vk_shift))
        fullRoomRects = !fullRoomRects;
}

if (debugMenu != (1 << 0) && keyboard_check_pressed(192))
    gameSpeed = (gameSpeed == 30) ? (120 - (110 * keyboard_check(vk_control))) : 30;
