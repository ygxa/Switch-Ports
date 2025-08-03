if (buffer > 0)
{
    if (global.ostype == 1 && !keyboard_virtual_status())
        keyboard_virtual_show(1, 9, 0, false);
    
    buffer--;
    exit;
}

if (keyboard_check_pressed(vk_escape))
{
    if (global.ostype == 1)
        keyboard_virtual_hide();
    
    if (callback != undefined)
        callback(undefined);
    
    instance_destroy();
    exit;
}

if (tab == -1 && (keyboard_check_pressed(vk_tab) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) || (global.ostype == 1 && !keyboard_virtual_status())))
{
    tab = keyboard_check_pressed(vk_up) ? 15 : 0;
    
    while (tab != -1 && results[tab] == -1)
        tab--;
    
    lock = keyboard_string;
}
else if (tab != -1)
{
    keyboard_string = lock;
    
    if (keyboard_check_pressed(vk_up))
        tab = number_sub_wrap(tab, 15);
    
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_tab))
    {
        tab = number_add_wrap(tab, 15);
        
        if (results[tab] == -1)
            tab = 0;
    }
    
    while (tab != -1 && results[tab] == -1)
        tab--;
    
    if (keyboard_check_pressed(vk_shift))
        tab = -1;
    
    if (tab != -1 && (keyboard_check_pressed(vk_enter) || (global.ostype == 1 && (global.control_confirm_pressed || !keyboard_virtual_status()))))
    {
        detected = results[tab];
        keyboard_string = entryNames[detected];
        tab = -1;
        
        if (global.ostype == 1)
            keyboard_virtual_hide();
        
        if (callback != undefined)
            callback(entryNames[detected]);
        
        instance_destroy();
    }
    
    exit;
}

if (os_type == os_windows && keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
{
    var t = clipboard_get_text();
    
    if (string_length(t) < 100)
        keyboard_string = t;
}

if (keyboard_check(vk_backspace))
{
    if (clearCounter < 15)
        clearCounter++;
    else
        keyboard_string = "";
}
else
{
    clearCounter = 0;
}

for (var i = 0; i < 16; i++)
    results[i] = -1;

var ind = 0;
type = -1;
detected = -1;

if (string_length(keyboard_string) > 0)
{
    var len = array_length(entryNames);
    
    if (caseSensitive)
    {
        for (var i = 0; i < len; i++)
        {
            if (string_pos(keyboard_string, entryNames[i]) > 0)
            {
                if (ind == 0)
                    detected = i;
                
                results[ind++] = i;
                
                if (ind >= 16)
                    break;
            }
        }
    }
    else
    {
        if (is_undefined(entryNamesCache))
        {
            for (var i = 0; i < len; i++)
                entryNamesCache[i] = string_lower(entryNames[i]);
        }
        
        var str = string_lower(keyboard_string);
        
        for (var i = 0; i < len; i++)
        {
            if (string_pos(str, entryNamesCache[i]) > 0)
            {
                if (ind == 0)
                    detected = i;
                
                results[ind++] = i;
                
                if (ind >= 16)
                    break;
            }
        }
    }
}

if ((keyboard_check_pressed(vk_enter) || (global.ostype == 1 && (global.control_confirm_pressed || !keyboard_virtual_status()))) && detected != -1)
{
    if (global.ostype == 1)
        keyboard_virtual_hide();
    
    if (callback != undefined)
        callback((detected != -1) ? entryNames[detected] : keyboard_string);
    
    instance_destroy();
}
