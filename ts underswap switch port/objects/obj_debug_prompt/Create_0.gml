text = "Sample text";
callback = undefined;
clearCounter = 0;
buffer = 5;
keyboard_string = "";

if (global.ostype == 1)
{
    if (!keyboard_virtual_status())
        keyboard_virtual_show(1, 9, 0, false);
}

depth = -14000;
