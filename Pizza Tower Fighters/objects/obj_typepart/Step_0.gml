if (place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left))
{
    selected = true;
    keyboard_string = text;
}
else if (!place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left))
{
    selected = false;
}

if (selected)
{
    if (keyboard_check_pressed(vk_anykey) || keyboard_check(vk_backspace))
        text = keyboard_string;
}

if (image_yscale < 32)
    show_error("the text thingy has to be 32 yscale dud", 0);

textout = text;
