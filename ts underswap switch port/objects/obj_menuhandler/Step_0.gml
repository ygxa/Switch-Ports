var naming = instance_exists(obj_namehandler);

if (naming || options == 6)
{
    var offset = 0;
    
    for (var i = 1; i >= 0; i--)
    {
        if (bookmarksActive[i])
        {
            bookmarkY[i] = number_approach_smooth(bookmarkY[i], 76, 0.1 + offset, 0.5);
            offset -= 0.01;
        }
    }
}
else
{
    var offset = 0;
    
    for (var i = 0; i < 2; i++)
    {
        if (bookmarksActive[i])
        {
            bookmarkY[i] = number_approach_smooth(bookmarkY[i], 6, 0.1 + offset, 0.5);
            offset -= 0.02;
        }
    }
}

if (global.debug)
{
    if (keyboard_check_pressed(vk_f10))
        global.currentarea = number_add_wrap(global.currentarea, 2, -1);
}

if (global.currentarea != background.bgArea && !((global.currentarea == 0 && background.bgArea == 1) || (global.currentarea == 1 && background.bgArea == 0)) && (!naming || obj_namehandler.phase == 1) && fadeBackground == undefined)
{
    fadeBackground = new Background();
    fadeBackground.enterBg = true;
    fadeBackground.moveBg = true;
    fadeBackgroundAlpha = 0;
}

background.update();

if (fadeBackground != undefined)
{
    fadeBackground.update();
    fadeBackgroundAlpha += 0.05;
    
    if (fadeBackgroundAlpha >= 1)
    {
        background = fadeBackground;
        fadeBackground = undefined;
    }
}

if (global.ostype != 1 && !instance_exists(obj_debug_selector))
{
    var s = keyboard_string;
    var l = string_length(s);
    
    if (l >= 1)
    {
        if (string_lower(string_char_at(s, 1)) == "s")
        {
            if (l >= 2)
            {
                if (string_lower(string_char_at(s, 2)) == "p")
                {
                    if (l >= 3)
                    {
                        if (string_lower(string_char_at(s, 3)) == "e")
                        {
                            if (l >= 4)
                            {
                                if (string_lower(string_char_at(s, 4)) == "e")
                                {
                                    if (l >= 5)
                                    {
                                        if (string_lower(string_char_at(s, 5)) == "d")
                                        {
                                            if (!instance_exists(obj_speedrun))
                                            {
                                                instance_create(obj_speedrun);
                                                sfx_play(snd_sparkle);
                                                keyboard_string = "";
                                            }
                                        }
                                        else
                                        {
                                            keyboard_string = "";
                                        }
                                    }
                                }
                                else
                                {
                                    keyboard_string = "";
                                }
                            }
                        }
                        else
                        {
                            keyboard_string = "";
                        }
                    }
                }
                else
                {
                    keyboard_string = "";
                }
            }
        }
        else
        {
            keyboard_string = "";
        }
    }
}

if (!enabled)
    exit;

switch (options)
{
    case 100:
        if (bfadealpha < 1)
        {
            bfadealpha += 0.1;
            music_gain(1 - bfadealpha, 0);
        }
        else
        {
            with (obj_speedrun)
            {
                if (storedTime != -1)
                    event_user(0);
            }
            
            audio_kill_all();
            global.savespawn_on_room_start = true;
            global.fader_on_room_start = true;
            room_goto(global.loadedroom);
        }
        
        break;
    
    case 101:
        if (bfadealpha < 1)
        {
            bfadealpha += 0.1;
            music_gain(1 - bfadealpha, 0);
        }
        else
        {
            audio_kill_all();
            room_goto(rm_extras);
        }
        
        break;
    
    case 102:
        if (bfadealpha < 1)
        {
            bfadealpha += 0.05;
            music_gain(1 - bfadealpha, 0);
        }
        else
        {
            audio_kill_all();
            global.credits_from_menu = true;
            room_goto(rm_credits);
        }
        
        break;
    
    case 1:
        if (!instance_exists(obj_flip) && screenFade == 0)
        {
            if (global.control_down_pressed)
            {
                selected = number_add_wrap(selected, selectMax, 1);
                
                if (global.spep)
                {
                    if (selected == 3)
                        selected = 4;
                }
            }
            
            if (global.control_up_pressed)
            {
                selected = number_sub_wrap(selected, selectMax, 1);
                
                if (global.spep)
                {
                    if (selected == 3)
                        selected = 2;
                }
            }
            
            if (global.control_confirm_pressed)
            {
                if (room == rm_load)
                {
                    storedText = undefined;
                    
                    switch (selected)
                    {
                        case 1:
                            options = 100;
                            break;
                        
                        case 2:
                            if (!instance_exists(obj_namehandler))
                            {
                                control_clear_confirm();
                                instance_create(obj_namehandler);
                                instance_create(obj_flip).trigger(false);
                                enabled = false;
                            }
                            
                            break;
                        
                        case 3:
                            options = 6;
                            lastSaveVariant = global.save_variant;
                            selected = clamp(1 + global.save_variant, 1, 3);
                            
                            for (var i = 0; i <= 2; i++)
                                slotData[i] = loadgame_partial(i);
                            
                            updateSlot();
                            instance_create(obj_flip).trigger(false);
                            break;
                        
                        case 4:
                            selected = 1;
                            section = 1;
                            instance_create(obj_flip).trigger(false);
                            options = 5;
                            break;
                        
                        case 5:
                            options = 102;
                            break;
                        
                        case 6:
                            options = 101;
                            break;
                    }
                }
                else
                {
                    storedText = undefined;
                    
                    switch (selected)
                    {
                        case 1:
                            options = 2;
                            
                            if (global.spep)
                            {
                                game_end_safe();
                            }
                            else if (!instance_exists(obj_namehandler))
                            {
                                control_clear_confirm();
                                instance_create(obj_namehandler);
                                instance_create(obj_flip).trigger(false);
                                enabled = false;
                            }
                            
                            break;
                        
                        case 2:
                            selected = 1;
                            section = 1;
                            instance_create(obj_flip).trigger(false);
                            options = 5;
                            break;
                        
                        case 3:
                            options = 102;
                            break;
                        
                        case 4:
                            options = 101;
                            break;
                    }
                }
            }
        }
        
        break;
    
    case 5:
        if (!instance_exists(obj_flip))
            obj_menuhandler_options_step();
        
        break;
    
    case 6:
        if (!instance_exists(obj_flip))
        {
            var preSel = selected;
            
            if (global.control_up_pressed)
                selected = number_sub_wrap(selected, 3, 1);
            
            if (global.control_down_pressed)
                selected = number_add_wrap(selected, 3, 1);
            
            if (preSel != selected)
                updateSlot();
            
            if (global.control_cancel_pressed)
            {
                global.save_variant = lastSaveVariant;
                selected = clamp(floor(global.save_variant) + 1, 1, 3);
                updateSlot();
                fullLoadSlot();
            }
            else if (global.control_confirm_pressed)
            {
                lastSaveVariant = global.save_variant;
                global.save_variant = selected - 1;
                fullLoadSlot();
            }
        }
        
        break;
}
