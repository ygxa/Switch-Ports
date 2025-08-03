try
{
    var evres = ds_map_find_value(async_load, "result");
    var req = ds_map_find_value(async_load, "id");
    var info = ds_map_find_value(callbacks, req);
    
    if (ds_map_find_value(async_load, "status") == 0 && evres != undefined && info != undefined && is_array(info))
    {
        var data;
        
        try
        {
            var j = json_parse(evres);
            data = variable_struct_get(j, "response");
        }
        catch (ex)
        {
            //show_debug_message("JSON parse error");
            //show_debug_message(ex);
            data = undefined;
        }
        
        if (data != undefined)
        {
            switch (info[0])
            {
                case "users/auth":
                    if (variable_struct_get(data, "success") == "true")
                    {
                        auth = (2 << 0);
                        gj_session_open(global.gj_username, global.gj_token);
                    }
                    else
                    {
                        auth = (3 << 0);
                        
                        if (!instance_exists(obj_gamejolt_login))
                            instance_destroy();
                    }
                    
                    break;
                
                case "sessions/open":
                case "sessions/ping":
                    if (sessionClosing)
                        break;
                    
                    timerExp = 5;
                    
                    if (variable_struct_get(data, "success") == "true")
                    {
                        if (!openedSession)
                        {
                            gj_trophies_load(global.gj_username, global.gj_token);
                        }
                        else if (trophySync == (4 << 0) && array_length(trophiesToSync) > 0)
                        {
                            trophySync = (0 << 0);
                            trophyTimer = 0;
                        }
                        
                        session = (2 << 0);
                        openedSession = true;
                    }
                    else
                    {
                        //show_debug_message("GameJolt session open/ping FAILED: " + _string(variable_struct_get(data, "message")));
                        session = (3 << 0);
                        
                        if (!openedSession && !instance_exists(obj_gamejolt_login))
                            instance_destroy();
                    }
                    
                    break;
                
                case "sessions/close":
                    loggingOut = true;
                    instance_destroy();
                    break;
                
                case "trophies":
                    if (sessionClosing)
                        break;
                    
                    timerExp = 5;
                    
                    if (variable_struct_get(data, "success") == "true")
                    {
                        trophyLoad = (2 << 0);
                        doneTrophyLoad = true;
                        var trophies = variable_struct_get(data, "trophies");
                        var s = is_array(trophies) ? array_length(trophies) : 0;
                        var changesMade = false;
                        trophiesToSync = [];
                        var trophiesToNotSync = ds_list_create();
                        
                        for (var i = 0; i < s; i++)
                        {
                            var t = trophies[i];
                            
                            if (!is_struct(t))
                                continue;
                            
                            var tid = string_digits(variable_struct_get(t, "id"));
                            
                            if (tid != "")
                                tid = real(tid);
                            
                            var ind = ds_map_find_value(global.gj_trophy_toindex, tid);
                            
                            if (ind != undefined)
                            {
                                if (variable_struct_get(t, "achieved") != "false")
                                {
                                    global.trophies[ind] = true;
                                    changesMade = true;
                                    ds_list_add(trophiesToNotSync, tid);
                                }
                                else if (global.trophies[ind] == true)
                                {
                                    array_push(trophiesToSync, tid);
                                }
                            }
                        }
                        
                        if (changesMade)
                            persist_save();
                        
                        for (var i = 0; i < 32; i++)
                        {
                            var tid = global.gj_index_totrophy[i];
                            
                            if (global.trophies[i] == true && ds_list_find_index(trophiesToNotSync, tid) == -1)
                                array_push(trophiesToSync, tid);
                        }
                        
                        ds_list_destroy(trophiesToNotSync);
                        
                        if (array_length(trophiesToSync) > 0)
                            gj_trophy_add(global.gj_username, global.gj_token, array_last(trophiesToSync));
                    }
                    else
                    {
                        //show_debug_message("GameJolt trophy load FAILED: " + _string(variable_struct_get(data, "message")));
                        trophyLoad = (3 << 0);
                        
                        if (!doneTrophyLoad && !instance_exists(obj_gamejolt_login))
                            instance_destroy();
                    }
                    
                    break;
                
                case "trophies/add-achieved":
                    timerExp = 5;
                    
                    if (variable_struct_get(data, "success") == "true")
                    {
                        trophySync = (2 << 0);
                        
                        if (array_length(trophiesToSync) > 0)
                        {
                            array_pop(trophiesToSync);
                            
                            if (array_length(trophiesToSync) > 0)
                                trophyTimer = 0;
                        }
                    }
                    else
                    {
                        trophySync = (3 << 0);
                        
                        if (array_length(trophiesToSync) > 0)
                        {
                            array_pop(trophiesToSync);
                            
                            if (array_length(trophiesToSync) > 0)
                                trophyTimer = 0;
                        }
                    }
                    
                    break;
                
                case "data-store/set":
                    if (variable_struct_get(data, "success") == "true")
                    {
                        fileUpload = (2 << 0);
                    }
                    else
                    {
                        //show_debug_message("GameJolt file upload FAILED: " + _string(variable_struct_get(data, "message")));
                        fileUpload = (3 << 0);
                    }
                    
                    uploadSuccess = fileUpload == (2 << 0);
                    uploadTextAlpha = 1;
                    alarm[0] = 60;
                    break;
                
                case "data-store":
                    if (variable_struct_get(data, "success") == "true")
                        fileDownload = gj_state_process(variable_struct_get(data, "data")) ? (2 << 0) : (3 << 0);
                    else
                        fileDownload = (3 << 0);
                    
                    break;
                    break;
                    continue;
            }
        }
        else
        {
            //show_debug_message("No 'response' JSON field for endpoint " + _string(info[0]));
            errorRequest = req;
            event_user(0);
        }
        
        if (ds_exists(callbacks, ds_type_map))
            ds_map_delete(callbacks, req);
    }
    else
    {
        errorRequest = req;
        event_user(0);
    }
}
catch (e)
{
    //show_debug_message(e);
}
