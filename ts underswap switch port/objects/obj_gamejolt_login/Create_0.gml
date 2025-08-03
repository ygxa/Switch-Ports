state = 0;
alpha = 0;
fading = 1;
textFade = 1;
textFadeDir = 2;
username = "";
token = "";
sel = 0;
notDoneAnythingTimer = 0;
keyboard_string = "";

function needs_virtual_keyboard()
{
    return global.ostype == 1;
}

function show_keyboard()
{
    if (needs_virtual_keyboard())
    {
        if (!keyboard_virtual_status())
            keyboard_virtual_show(1, 9, 0, false);
    }
}

function supports_clipboard()
{
    return os_type != os_linux;
}

function take_keyboard_input(argument0, argument1)
{
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && supports_clipboard())
        keyboard_string += clipboard_get_text();
    
    var len = string_length(keyboard_string);
    
    if (len > 30)
    {
        keyboard_string = string_copy(keyboard_string, 1, 30);
        len = 30;
    }
    
    var tempStr = "";
    
    for (var i = 1; i <= len; i++)
    {
        var char = string_char_at(keyboard_string, i);
        
        if (argument0(char))
            tempStr += char;
    }
    
    len = string_length(tempStr);
    
    if (keyboard_string != tempStr)
        keyboard_string = tempStr;
    
    if (len > 0)
    {
        if (needs_virtual_keyboard() ? global.control_confirm_pressed : keyboard_check_pressed(vk_enter))
        {
            argument1();
            keyboard_string = "";
        }
    }
    
    return tempStr;
}

show_keyboard();
depth = -300;
