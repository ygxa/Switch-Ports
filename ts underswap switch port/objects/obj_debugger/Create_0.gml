noclip = false;
invincible = false;
gameSpeed = 30;
debugOverlay = false;
makeVisible = false;
hitboxes = false;
objectDebug = false;
objectDebugRelative = (0 << 0);
objectDebugSelected = -4;
objectDebugSelectedXOff = 0;
objectDebugSelectedYOff = 0;
objectDebugAlign = false;
objectDebugMouseHold = 0;
objectDebugOverlays = true;
objectDebugCamera = false;
objectDebugClipboard = "";
objectDebugHovering = false;
lockCamera = false;
freecamX = 0;
freecamY = 0;
mouseX = 0;
mouseY = 0;
fullRoomView = false;
fullRoomRects = true;
month = -1;
faceDebug = false;
faceArray = [];
faceName = "";
faceHovering = undefined;
faceIndex = 0;
faceInfo = "";
faceSecondary = false;
areaTimer = -1;
mobileOrder = 0;
debugMenu = (0 << 0);
debugMove = true;
debugUnlock = false;
debugBuffer = 0;
debugMenuSel = 0;
debugPlot = -1;
debugBattle = -1;
debugFlagName = "";
debugOptions = ds_list_create();
debugLineDraws = [];
ds_list_add(debugOptions, 
{
    name: "Kill audio",
    func: audio_kill_all
});
ds_list_add(debugOptions, 
{
    name: "Edit a flag",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt_selector))
        {
            text = "Enter flag name:";
            keyboard_string = "plot";
            var i = 0;
            var k = ds_map_find_first(global.flags);
            
            while (k != undefined)
            {
                entryNames[i++] = k;
                k = ds_map_find_next(global.flags, k);
            }
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugFlagName = argument0;
                    var val = ds_map_find_value(global.flags, argument0);
                    
                    if (!is_numeric(val))
                    {
                        instance_create(obj_debug_message).text = "Sorry, that flag (\"" + argument0 + "\") doesn't exist or can't be edited (not a number)";
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugMenu = (3 << 0);
                    
                    with (instance_create(obj_debug_prompt))
                    {
                        text = "Enter new value of \"" + argument0 + "\":";
                        keyboard_string = _string(val);
                        
                        callback = function(argument0)
                        {
                            with (obj_debugger)
                            {
                                debugMenu = (0 << 0);
                                global.canmove = debugMove;
                                
                                if (is_undefined(argument0))
                                    exit;
                                
                                try
                                {
                                    ds_map_set(global.flags, debugFlagName, real(argument0));
                                }
                                catch (e)
                                {
                                    //show_debug_message(e);
                                    instance_create(obj_debug_message).text = "Invalid real number";
                                }
                            }
                        };
                    }
                }
            };
        }
    }
});
ds_list_add(debugOptions, 
{
    name: "Edit a p-flag",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt_selector))
        {
            text = "Enter pflag name:";
            keyboard_string = "";
            var i = 0;
            var k = ds_map_find_first(global.pflags);
            
            while (k != undefined)
            {
                entryNames[i++] = k;
                k = ds_map_find_next(global.pflags, k);
            }
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugFlagName = argument0;
                    var val = ds_map_find_value(global.pflags, argument0);
                    
                    if (!is_numeric(val))
                    {
                        instance_create(obj_debug_message).text = "Sorry, that pflag (\"" + argument0 + "\") doesn't exist or can't be edited (not a number)";
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugMenu = (3 << 0);
                    
                    with (instance_create(obj_debug_prompt))
                    {
                        text = "Enter new value of \"" + argument0 + "\":";
                        keyboard_string = _string(val);
                        
                        callback = function(argument0)
                        {
                            with (obj_debugger)
                            {
                                debugMenu = (0 << 0);
                                global.canmove = debugMove;
                                
                                if (is_undefined(argument0))
                                    exit;
                                
                                try
                                {
                                    ds_map_set(global.pflags, debugFlagName, real(argument0));
                                }
                                catch (e)
                                {
                                    //show_debug_message(e);
                                    instance_create(obj_debug_message).text = "Invalid real number";
                                }
                            }
                        };
                    }
                }
            };
        }
    }
});
ds_list_add(debugOptions, 
{
    name: "Edit a global p-flag",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt_selector))
        {
            text = "Enter global pflag name:";
            keyboard_string = "";
            var i = 0;
            var k = ds_map_find_first(global.pflags_global);
            
            while (k != undefined)
            {
                entryNames[i++] = k;
                k = ds_map_find_next(global.pflags_global, k);
            }
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugFlagName = argument0;
                    var val = ds_map_find_value(global.pflags_global, argument0);
                    
                    if (!is_numeric(val))
                    {
                        instance_create(obj_debug_message).text = "Sorry, that global pflag (\"" + argument0 + "\") doesn't exist or can't be edited (not a number)";
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    debugMenu = (3 << 0);
                    
                    with (instance_create(obj_debug_prompt))
                    {
                        text = "Enter new value of \"" + argument0 + "\":";
                        keyboard_string = _string(val);
                        
                        callback = function(argument0)
                        {
                            with (obj_debugger)
                            {
                                debugMenu = (0 << 0);
                                global.canmove = debugMove;
                                
                                if (is_undefined(argument0))
                                    exit;
                                
                                try
                                {
                                    ds_map_set(global.pflags_global, debugFlagName, real(argument0));
                                }
                                catch (e)
                                {
                                    //show_debug_message(e);
                                    instance_create(obj_debug_message).text = "Invalid real number";
                                }
                            }
                        };
                    }
                }
            };
        }
    }
});

debugInvincible = function()
{
    invincible = !invincible;
    debug_message(_string("Invincible = {0}", invincible));
};

ds_list_add(debugOptions, 
{
    name: "Toggle invincibility",
    func: debugInvincible
});
ds_list_add(debugOptions, 
{
    name: "View all flags (filtered)",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt))
        {
            text = "Enter flag filter:";
            keyboard_string = "rhc_";
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    var filter = string_lower(argument0);
                    flagStrings = array_create(1);
                    var i = 0;
                    var k = ds_map_find_first(global.flags);
                    
                    while (k != undefined)
                    {
                        if (filter != "" && string_pos(filter, string_lower(k)) == 0)
                        {
                        }
                        else
                        {
                            var val = ds_map_find_value(global.flags, k);
                            flagStrings[i++] = k + "=" + _string(val);
                        }
                        
                        k = ds_map_find_next(global.flags, k);
                    }
                    
                    debugMenu = (2 << 0);
                }
            };
        }
    }
});
ds_list_add(debugOptions, 
{
    name: "View all p-flags (filtered)",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt))
        {
            text = "Enter pflag filter:";
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    var filter = string_lower(argument0);
                    flagStrings = array_create(1);
                    var i = 0;
                    var k = ds_map_find_first(global.pflags);
                    
                    while (k != undefined)
                    {
                        if (filter != "" && string_pos(filter, string_lower(k)) == 0)
                        {
                        }
                        else
                        {
                            var val = ds_map_find_value(global.pflags, k);
                            flagStrings[i++] = k + "=" + _string(val);
                        }
                        
                        k = ds_map_find_next(global.pflags, k);
                    }
                    
                    debugMenu = (2 << 0);
                }
            };
        }
    }
});
ds_list_add(debugOptions, 
{
    name: "View all global p-flags (filtered)",
    
    func: function()
    {
        debugMenu = (3 << 0);
        
        with (instance_create(obj_debug_prompt))
        {
            text = "Enter global pflag filter:";
            
            callback = function(argument0)
            {
                with (obj_debugger)
                {
                    if (is_undefined(argument0))
                    {
                        debugMenu = (0 << 0);
                        global.canmove = debugMove;
                        exit;
                    }
                    
                    var filter = string_lower(argument0);
                    flagStrings = array_create(1);
                    var i = 0;
                    var k = ds_map_find_first(global.pflags_global);
                    
                    while (k != undefined)
                    {
                        if (filter != "" && string_pos(filter, string_lower(k)) == 0)
                        {
                        }
                        else
                        {
                            var val = ds_map_find_value(global.pflags_global, k);
                            flagStrings[i++] = k + "=" + _string(val);
                        }
                        
                        k = ds_map_find_next(global.pflags_global, k);
                    }
                    
                    debugMenu = (2 << 0);
                }
            };
        }
    }
});

debugFps = function()
{
    gameSpeed = get_integer("Set game speed in FPS (default 30)", gameSpeed);
    
    if (!is_real(gameSpeed) || gameSpeed <= 0)
        gameSpeed = 30;
};

ds_list_add(debugOptions, 
{
    name: (global.ostype == 1) ? "Speed FPS up/down" : "Set FPS",
    
    func: function()
    {
        if (global.ostype == 1)
        {
            if (gameSpeed == 30)
                gameSpeed = 90;
            else
                gameSpeed = 30;
        }
        else
        {
            debugFps();
        }
    }
});
ds_list_add(debugOptions, 
{
    name: "Get a ton of gold",
    
    func: function()
    {
        global.playergold += 100000000;
    }
});

debugAllVisible = function()
{
    makeVisible = !makeVisible;
    debug_message(_string("All visible = {0}", makeVisible));
};

ds_list_add(debugOptions, 
{
    name: "Toggle all objects visible",
    func: debugAllVisible
});

debugHitboxes = function()
{
    hitboxes = !hitboxes;
    debug_message(_string("Hitboxes = {0}", hitboxes));
};

ds_list_add(debugOptions, 
{
    name: "Toggle hitboxes visible",
    func: debugHitboxes
});

debugAttack = function()
{
    global.playerat = 10000;
    debug_message("Set AT to 10000");
};

ds_list_add(debugOptions, 
{
    name: "Set AT to 10000",
    func: debugAttack
});
ds_list_add(debugOptions, 
{
    name: "Give item",
    
    func: function()
    {
        debugMenu = (1 << 0);
        itemSelector();
    }
});

debugStats = function()
{
    try
    {
        global.playername = get_string("Player Name", global.playername) ?? global.playername;
        global.playerlv = get_integer("Player LV", global.playerlv) ?? global.playerlv;
        stat_update();
        global.playerhp = get_integer("Player HP", global.playerhp) ?? global.playerhp;
        global.playerxp = get_integer("Player XP", global.playerxp) ?? global.playerxp;
        global.playergold = get_integer("Player Gold", global.playergold) ?? global.playergold;
        global.fun = get_integer("Fun", global.fun) ?? global.fun;
        ds_map_set(global.flags, "cell", get_integer("Player Cell?", ds_map_find_value(global.flags, "cell")) ?? ds_map_find_value(global.flags, "cell"));
    }
    catch (e)
    {
        debug_error(e);
    }
};

debugRoomSelect = function()
{
    debugMenu = (3 << 0);
    debugMove = global.canmove;
    global.canmove = false;
    
    with (instance_create(obj_debug_selector))
    {
        name = "Room Selector";
        var size = array_length(global.room_ids);
        var i = 0;
        
        for (j = 0; j < size; j++)
        {
            var title = room_title(j);
            
            if (!is_undefined(title))
            {
                entryValues[i] = global.room_ids[j];
                entryNames[i] = title;
                i++;
            }
        }
        
        var j = room_first;
        
        while (j != -1)
        {
            entryValues[i] = j;
            entryNames[i] = room_get_name(j);
            i++;
            j = room_next(j);
        }
        
        callback = function(argument0)
        {
            with (obj_debugger)
            {
                debugMenu = (0 << 0);
                global.canmove = debugMove;
                
                if (argument0 != -1)
                {
                    room_goto(other.entryValues[argument0]);
                    event_user(0);
                }
            }
        };
    }
};

ds_list_add(debugOptions, 
{
    name: "Go to room",
    func: debugRoomSelect
});

if (global.ostype != 1)
{
    ds_list_add(debugOptions, 
    {
        name: "Set basic stats",
        func: debugStats
    });
    ds_list_add(debugOptions, 
    {
        name: "Set global var",
        
        func: function()
        {
            try
            {
                var name = get_string("Variable name", "spep");
                
                if (is_string(name))
                {
                    var existingVal = variable_global_get(name);
                    
                    if (is_numeric(existingVal))
                        variable_global_set(name, real(get_string("Set " + name + " to?", _string(existingVal))));
                    else if (is_string(existingVal))
                        variable_global_set(name, get_string("Set " + name + " to?", _string(existingVal)));
                    else
                        throw "This only works with numerics/strings right now";
                }
            }
            catch (e)
            {
                debug_error(e);
            }
        }
    });
}
else
{
    ds_list_add(debugOptions, 
    {
        name: "Go to previous room",
        
        func: function()
        {
            if (room != room_first)
            {
                room_goto_previous();
                event_user(0);
            }
            
            debugMenu = (1 << 0);
        }
    });
    ds_list_add(debugOptions, 
    {
        name: "Go to next room",
        
        func: function()
        {
            if (room != room_last)
            {
                room_goto_next();
                event_user(0);
            }
            
            debugMenu = (1 << 0);
        }
    });
    ds_list_add(debugOptions, 
    {
        name: "Save game here",
        
        func: function()
        {
            savegame(global.save_variant);
        }
    });
    ds_list_add(debugOptions, 
    {
        name: "Trigger battle",
        
        func: function()
        {
            debugBattle = get_integer_async("Battle ID", 43);
        }
    });
}

debugFullRoomView = function()
{
    fullRoomView = !fullRoomView;
    
    if (!fullRoomView)
    {
        display_set_gui_maximize(-1, -1, 0, 0);
        view_set_visible(0, true);
        view_set_visible(1, false);
        view_set_visible(2, false);
        surface_resize(application_surface, 640, 480);
        
        if (obj_gamemanager.alarm[0] == -1)
            window_update();
    }
    else
    {
        fullRoomRects = true;
    }
};

ds_list_add(debugOptions, 
{
    name: "Full room view mode",
    func: debugFullRoomView
});
ds_list_add(debugOptions, 
{
    name: "Path: Pacifist",
    
    func: function()
    {
        global.playerlv = 1;
        global.playerhp = 20;
        global.playerxp = 0;
        global.playerkills = 0;
        
        for (var a = 0; a < array_length(global.areapopulations); a++)
            global.areapopulations[a] = global.initareapops[a];
        
        for (var a = 0; a < array_length(global.journal_health); a++)
        {
            if (global.journal_health[a] == (2 << 0))
                global.journal_health[a] = (1 << 0);
        }
        
        for (var a = 0; a < array_length(global.journal_kills); a++)
        {
            if (global.journal_kills[a] != -1)
                global.journal_kills[a] = 0;
        }
        
        ds_map_set(global.flags, "mk_rk", false);
        ds_map_set(global.flags, "gf", -1);
        ds_map_set(global.flags, "asg_betray", false);
        ds_map_set(global.flags, "st_sd_spec", 0);
        ds_map_set(global.flags, "st_muffet", 0);
        stat_update();
    }
});
ds_list_add(debugOptions, 
{
    name: "Path: Evac Neutral",
    
    func: function()
    {
        global.playerlv = 3;
        global.playerhp = 28;
        global.playermaxhp = 28;
        global.playerxp = global.expreq[2];
        stat_update();
        global.playerkills = global.initareapops[0];
        global.areapopulations[0] = 0;
        global.areapopulations[2] = global.initareapops[2];
        dx_scene("star.__pop__");
        ds_map_set(global.flags, "mk_rk", true);
        ds_map_set(global.flags, "gf", 1);
        journal_set_health(0, (1 << 0));
        
        if (global.currentarea >= 2 && ds_map_find_value(global.flags, "plot") < 37)
            ds_map_set(global.flags, "plot", 37);
    }
});
ds_list_add(debugOptions, 
{
    name: "Path: Ruthless RH",
    
    func: function()
    {
        global.playerlv = 3;
        global.playerhp = 28;
        global.playermaxhp = 28;
        global.playerxp = global.expreq[2];
        stat_update();
        global.playerkills = global.areapopulations[0];
        global.areapopulations[0] = 0;
        global.areapopulations[2] = global.initareapops[2];
        dx_scene("star.__pop__");
        ds_map_set(global.flags, "mk_rk", true);
        journal_set_health(0, (2 << 0));
        ds_map_set(global.flags, "gf", 0);
        
        if (global.currentarea >= 2 && ds_map_find_value(global.flags, "plot") < 23)
            ds_map_set(global.flags, "plot", 23);
    }
});
ds_list_add(debugOptions, 
{
    name: "Path: Ruthless ST",
    
    func: function()
    {
        global.playerlv = 8;
        global.playerhp = 48;
        global.playermaxhp = 48;
        global.playerxp = global.expreq[7];
        stat_update();
        global.playerkills = global.areapopulations[0] + global.areapopulations[2];
        global.areapopulations[0] = 0;
        global.areapopulations[2] = 0;
        ds_map_set(global.flags, "mk_rk", true);
        journal_set_health(0, (2 << 0));
        ds_map_set(global.flags, "gf", 0);
        ds_map_set(global.flags, "st_beenard", true);
        journal_set_health(20, (2 << 0));
        journal_set_health(23, (2 << 0));
        journal_set_health(25, (2 << 0));
        ds_map_set(global.flags, "st_muffet", 2);
        
        if (ds_map_find_value(global.flags, "plot") > 56 || ds_map_find_value(global.flags, "st_bp") >= 3)
            ds_map_set(global.flags, "st_bp", 50);
        
        if (global.currentarea >= 2 && ds_map_find_value(global.flags, "plot") < 23)
            ds_map_set(global.flags, "plot", 23);
    }
});
ds_list_add(debugOptions, 
{
    name: "Path: Neutral (exhaust ST)",
    
    func: function()
    {
        global.playerlv = 3;
        global.playerhp = 28;
        global.playermaxhp = 28;
        global.playerxp = global.expreq[2];
        stat_update();
        global.playerkills = global.initareapops[2];
        global.areapopulations[0] = 20;
        global.areapopulations[2] = 0;
        ds_map_set(global.flags, "mk_rk", false);
        journal_set_health(0, (1 << 0));
        ds_map_set(global.flags, "gf", -1);
    }
});
ds_list_add(debugOptions, 
{
    name: "[EXIT]",
    
    func: function()
    {
    }
});
flagStrings = undefined;
label = true;
labelMore = false;
buffer = 4;
reloading = false;
reloadRestart = false;
reloadDiannex = false;
depth = -15000;

itemSelector = function()
{
    if (debugMenu == (0 << 0))
    {
        debugMove = global.canmove;
        global.canmove = false;
    }
    
    debugMenu = (3 << 0);
    
    with (instance_create(obj_debug_selector))
    {
        name = "Item Selector";
        var list = ds_list_create();
        var k = ds_map_find_first(global.items);
        
        while (k != undefined)
        {
            ds_list_add(list, k);
            k = ds_map_find_next(global.items, k);
        }
        
        ds_list_sort(list, true);
        var size = ds_list_size(list);
        
        for (var i = 0; i < size; i++)
        {
            var curr = ds_list_find_value(list, i);
            entryValues[i] = curr;
            entryNames[i] = _string("{0} ({1})", item_get_name(curr), curr);
        }
        
        callback = function(argument0)
        {
            if (argument0 != -1)
                items_add(entryValues[argument0]);
            
            with (obj_debugger)
            {
                debugMenu = (0 << 0);
                global.canmove = debugMove;
            }
        };
        
        ds_list_destroy(list);
    }
};
