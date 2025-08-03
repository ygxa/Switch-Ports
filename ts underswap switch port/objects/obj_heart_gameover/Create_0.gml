x = global.xstore;
y = global.ystore;
image_speed = 0;
alarm[0] = 20;
permadeath = false;

if (string_upper(global.playername) == "DEATH")
{
    permadeath = true;
    
    if (file_exists(_string("file{0}", global.save_variant)))
        file_delete(_string("file{0}", global.save_variant));
    
    if (file_exists(_string("file{0}_p", global.save_variant)))
        file_delete(_string("file{0}_p", global.save_variant));
    
    var foundAny = false;
    
    for (var i = 0; i < 3; i++)
    {
        if (file_exists(_string("file{0}", i)))
        {
            ds_map_set(global.pflags_global, "file", i);
            persist_save_internal(global.pflags_global, "file_p", true);
            foundAny = true;
            break;
        }
    }
    
    if (!foundAny)
    {
        ds_map_set(global.pflags_global, "file", 0);
        persist_save_internal(global.pflags_global, "file_p", true);
    }
}

keyCounter = 0;
groupDeaths = -1;
fastMode = false;
