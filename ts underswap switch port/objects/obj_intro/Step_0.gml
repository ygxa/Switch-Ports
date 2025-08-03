if (!endbox && global.control_confirm_pressed)
{
    if (writer != -4)
    {
        instance_destroy(writer);
        writer = -4;
    }
    
    endbox = true;
    dontActuallyFade = false;
    fade = 2;
}

if (endbox && introEnd)
    slowframe = number_add_wrap(slowframe, 8);
else
    slowframe = number_add_wrap(slowframe, 3);

switch (fade)
{
    case 0:
        image_alpha = 1;
        
        if (writer.isDone)
        {
            if (!firstDone)
            {
                scene_resume();
                firstDone = true;
            }
            
            if (syncTimeOut != -1 && music_get_pos() >= syncTimeOut)
                syncTimeOut = -1;
            
            if (syncTimeOut == -1 && !syncAlarm)
            {
                fade = 2;
                
                if (hideTextOnFade)
                    writer.visible = false;
                
                firstDone = false;
                
                if (!endbox && !dontActuallyFade)
                {
                    nextTarget = image_index + 1;
                    xrandom_advance();
                    sfx_play(snd_textblip1);
                }
            }
        }
        
        break;
    
    case 1:
        if (image_alpha < 1)
        {
            if (slowframe == 1)
                image_alpha += 0.14;
        }
        else
        {
            image_alpha = 1;
            fade = 0;
        }
        
        break;
    
    case 2:
        if (image_alpha > 0)
        {
            if (slowframe == 1)
                image_alpha -= 0.14;
            
            if (endbox)
            {
                if (image_alpha <= 0)
                    music_kill_current();
                else
                    music_gain(image_alpha, 0);
            }
        }
        else
        {
            image_alpha = 0;
            fade = 3;
            
            if (endbox)
            {
                dx_instance_stop_scene(global.dxinst);
                
                if (introEnd)
                {
                    alarm[3] = 15;
                }
                else
                {
                    if (writer != -4)
                    {
                        instance_destroy(writer);
                        writer = -4;
                    }
                    
                    alarm[2] = 10;
                }
                
                fade = -1;
            }
        }
        
        break;
    
    case 3:
        image_alpha = 0;
        
        if (global.currentmusic == -4 || (syncTime != -1 && music_get_pos() >= syncTime))
            syncTime = -1;
        
        if (syncTime == -1)
        {
            fade = 1;
            image_index++;
            hideTextOnFade = false;
            writer.visible = true;
            scene_resume();
            writer.resume();
        }
        
        break;
}

if (image_index == 7)
{
    if (longscroll && longyoffset < 220 && (slowframe == 0 || slowframe == 2))
        longyoffset += 2;
}

if (global.debug)
{
    if (keyboard_check_pressed(vk_f6) || (variable_global_exists("__insta_reload") && global.__insta_reload))
    {
        global.__insta_reload = false;
        
        for (var c = 48; c <= 57; c++)
        {
            if (keyboard_check(c))
                global.save_variant = c - 48;
        }
        
        if (file_exists("file" + _string(global.save_variant)))
        {
            with (obj_debugger)
                label = false;
            
            loadgame(global.save_variant);
            persist_load_local();
            
            if (global.gamebroke != -1)
                exit;
            
            audio_kill_all();
            global.savespawn_on_room_start = true;
            global.fader_on_room_start = true;
            global.is_ruth_enabled = -1;
            room_goto(global.loadedroom);
        }
        else
        {
            sfx_play(snd_error);
        }
    }
    else if (keyboard_check_pressed(vk_f3))
    {
        audio_kill_all();
        
        with (obj_debugger)
            label = false;
        
        keyboard_string = "";
        room_goto(rm_testtext);
    }
}
