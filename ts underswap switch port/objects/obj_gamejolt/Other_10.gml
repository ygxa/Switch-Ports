//show_debug_message("Connection failed for GameJolt request");

if (ds_exists(callbacks, ds_type_map))
{
    var info = ds_map_find_value(callbacks, errorRequest);
    
    if (info != undefined && is_array(info))
    {
        switch (info[0])
        {
            case "users/auth":
                auth = (4 << 0);
                
                if (!instance_exists(obj_gamejolt_login))
                {
                    instance_destroy();
                    exit;
                }
                
                break;
            
            case "sessions/open":
            case "sessions/ping":
                session = (4 << 0);
                timer = 0;
                timerRand = random(2);
                
                if (timerExp < 100)
                    timerExp *= 2;
                
                break;
            
            case "sessions/close":
                loggingOut = true;
                instance_destroy();
                exit;
            
            case "trophies":
                trophyLoad = (4 << 0);
                timer = 0;
                timerRand = random(2);
                
                if (timerExp < 100)
                    timerExp *= 2;
                
                break;
            
            case "trophies/add-achieved":
                trophySync = (4 << 0);
                timer = 0;
                timerRand = random(2);
                
                if (timerExp < 100)
                    timerExp *= 2;
                
                break;
            
            case "data-store/set":
                fileUpload = (4 << 0);
                uploadSuccess = false;
                uploadTextAlpha = 1;
                alarm[0] = 60;
                break;
            
            case "data-store":
                fileDownload = (4 << 0);
                break;
        }
    }
    
    if (ds_map_exists(callbacks, errorRequest))
        ds_map_delete(callbacks, errorRequest);
}
