key_speedup = keyboard_check(global.keyboardp1key_jump) || o_player_default.buttonA;
key_accept = keyboard_check_pressed(global.keyboardp1key_jump) || o_player_default.buttonAPress;
var _arr = ds_list_find_value(messages, messageID);
var _text = _arr[(0 << 0)];
messagetext = string_copy(_text, 1, messagechar);

if (goingaway == 0)
{
    y = approach(y, y_start, 20);
}
else
{
    y = approach(y, yfinish, 75);
    
    if (y == yfinish)
        instance_destroy();
}

if (messagechar <= string_length(_text))
{
    if (key_speedup)
        messagechar += (messageSpeed + 0.5);
    else
        messagechar += messageSpeed;
}

fpse -= 1;

if (fpse == 0)
{
    frame++;
    fpse = 20;
}

if (frame == framemax)
    frame = 0;

if (key_accept && messagechar > string_length(_text))
{
    if (messageID < (ds_list_size(messages) - 1))
    {
        messageID++;
        frame = 0;
        messagechar = 0;
    }
    else
    {
        goingaway = 1;
    }
}
