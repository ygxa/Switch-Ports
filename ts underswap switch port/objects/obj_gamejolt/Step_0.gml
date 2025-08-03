if (global.gj_initialized)
{
    try
    {
        if (!sessionClosing)
        {
            if (trophySync != (4 << 0) && trophyTimer != -1)
            {
                trophyTimer++;
                
                if (trophyTimer >= (2 * game_get_speed(gamespeed_fps)))
                {
                    trophyTimer = -1;
                    
                    if (array_length(trophiesToSync) > 0)
                        gj_trophy_add(global.gj_username, global.gj_token, array_last(trophiesToSync));
                }
            }
            
            if (session == (2 << 0))
            {
                timer++;
                
                if (timer >= (30 * game_get_speed(gamespeed_fps)))
                {
                    timer = 0;
                    gj_session_ping(global.gj_username, global.gj_token);
                }
            }
            else if (session == (4 << 0))
            {
                timer++;
                
                if (timer >= ((timerExp + timerRand) * game_get_speed(gamespeed_fps)))
                {
                    timer = 0;
                    
                    if (openedSession)
                        gj_session_ping(global.gj_username, global.gj_token);
                    else
                        gj_session_open(global.gj_username, global.gj_token);
                }
            }
            else if (trophyLoad == (4 << 0))
            {
                timer++;
                
                if (timer >= ((timerExp + timerRand) * game_get_speed(gamespeed_fps)))
                {
                    timer = 0;
                    gj_trophies_load(global.gj_username, global.gj_token);
                }
            }
            else if (trophySync == (4 << 0))
            {
                trophyTimer = -1;
                timer++;
                
                if (timer >= ((timerExp + timerRand) * game_get_speed(gamespeed_fps)))
                {
                    timer = 0;
                    
                    if (array_length(trophiesToSync) > 0)
                        gj_trophy_add(global.gj_username, global.gj_token, array_last(trophiesToSync));
                }
            }
        }
        
        if (ds_exists(callbacks, ds_type_map))
        {
            var k = ds_map_find_first(callbacks);
            
            while (k != undefined)
            {
                var info = ds_map_find_value(callbacks, k);
                
                if (info[1] >= (10 * game_get_speed(gamespeed_fps)))
                {
                    errorRequest = k;
                    event_user(0);
                    
                    if (!ds_exists(callbacks, ds_type_map))
                        break;
                }
                else
                {
                    ds_map_set(callbacks, k, [info[0], info[1] + 1, info[2]]);
                }
                
                k = ds_map_find_next(callbacks, k);
            }
        }
    }
    catch (e)
    {
        //show_debug_message(e);
    }
}
