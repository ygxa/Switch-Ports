if (global.ostype == 1)
    instance_create(obj_mobilecontrols);

if (file_exists("version"))
{
    try
    {
        var f = file_text_open_read("version");
        var version = real(file_text_read_string(f));
        file_text_close(f);
        
        if (version > 2)
        {
            dialog = show_message_async(dxd_raw("warns.outdated"));
            exit;
        }
        else if (version < 2)
        {
            if (version < 2)
            {
                var fileList = ["file0", "file_p", "config.ini", "version"];
                var i = 0;
                var n = array_length(fileList);
                
                while (i < n)
                {
                    var sourceName = fileList[i];
                    var targetName = _string("demo1_{0}", sourceName);
                    
                    if (file_exists(sourceName) && !file_exists(targetName))
                        file_copy(sourceName, targetName);
                    
                    i++;
                }
            }
        }
        
        write_version();
    }
    catch (ex)
    {
        debug_error(ex);
        write_version();
    }
    
    global.fader_on_room_start = true;
    room_goto(rm_intro);
}
else
{
    var chosen = lang_auto_detect();
    
    if (chosen != global.lang)
    {
        global.lang = chosen;
        lang_init();
    }
    
    room_goto(rm_preconfig);
}
