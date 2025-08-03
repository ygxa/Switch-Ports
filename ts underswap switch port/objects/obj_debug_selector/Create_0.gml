entryNames = ["A"];
entryNamesCache = undefined;
entryValues = [0];
name = "Test Selector";
caseSensitive = false;
callback = undefined;
tab = -1;
results = array_create(16, -1);
clearCounter = 0;
detected = -1;
lock = "";
keyboard_string = "";
buffer = 5;

if (global.ostype == 1)
{
    if (!keyboard_virtual_status())
        keyboard_virtual_show(1, 9, 0, false);
}

depth = -14000;
