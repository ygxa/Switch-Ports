arr = [];
num = 0;
drawgui = false;
p1time = 0;
p2time = 0;
state = 0;
SAVEDP1 = 100;
SAVEDP2 = 100;
alarm[0] = 20;

for (var i = 0; i <= gamepad_get_device_count(); i++)
{
    if (gamepad_is_connected(i))
    {
        array_push(arr, [i, gamepad_get_description(i)]);
        show_debug_message(arr[num]);
        num++;
    }
}

show_debug_message(gamepad_is_connected(1));

if (array_length(arr) == 0)
{
    if (array_length(arr) == 1)
        global.P1controllerport = arr[0][0];
    else
        global.P1controllerport = 100;
    
    gamepad_set_axis_deadzone(global.P1controllerport, 0.25);
    global.P2controllerport = 100;
    gamepad_set_axis_deadzone(global.P2controllerport, 0.25);
    fadeToRoom(R_Title, 20, 0);
    instance_destroy();
}
else
{
    global.P1controllerport = 100;
    gamepad_set_axis_deadzone(global.P1controllerport, 0.25);
    global.P2controllerport = 100;
    gamepad_set_axis_deadzone(global.P2controllerport, 0.25);
    show_message("I AM STUPID PERSON");
}
