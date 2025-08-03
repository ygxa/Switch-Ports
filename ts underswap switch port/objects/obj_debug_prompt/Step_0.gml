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

if (keyboard_check_pressed(vk_enter) || (global.ostype == 1 && (global.control_confirm_pressed || !keyboard_virtual_status())))
{
    if (global.ostype == 1)
        keyboard_virtual_hide();
    
    if (callback != undefined)
        callback(keyboard_string);
    
    instance_destroy();
}
