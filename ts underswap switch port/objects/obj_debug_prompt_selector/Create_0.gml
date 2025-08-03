entryNames = [];
entryNamesCache = undefined;
text = "Sample text";
caseSensitive = false;
callback = undefined;
tab = -1;
results = array_create(16, -1);
clearCounter = 0;
detected = "";
type = -1;
lock = "";
keyboard_string = "";
buffer = 5;

if (global.ostype == 1)
{
    if (!keyboard_virtual_status())
        keyboard_virtual_show(1, 9, 0, false);
}

depth = -14000;
