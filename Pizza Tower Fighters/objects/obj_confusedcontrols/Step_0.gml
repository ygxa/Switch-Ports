if (global.P1controllerport != SAVEDP1)
{
    global.P1controllerport = SAVEDP1;
    show_message(string(SAVEDP1) + " 1");
}

if (global.P2controllerport != SAVEDP2)
{
    global.P2controllerport = SAVEDP2;
    show_message(string(SAVEDP2) + " 2");
}

if (!drawgui)
    exit;

switch (state)
{
    case 0:
        for (var i = 0; i < array_length(arr); i++)
        {
            if (gamepad_button_check(arr[i][0], gp_face1))
            {
                p1time++;
                
                if (p1time > 120)
                {
                    global.P1controllerport = arr[i][0];
                    gamepad_set_axis_deadzone(global.P1controllerport, 0.25);
                    state++;
                    show_debug_message(global.P1controllerport);
                    SAVEDP1 = global.P1controllerport;
                    break;
                }
            }
        }
        
        if (keyboard_check(vk_enter) && keyboard_check(vk_tab))
        {
            state = 2;
            alarm[1] = 60;
        }
        
        break;
    
    case 1:
        for (var i = 0; i < array_length(arr); i++)
        {
            if (gamepad_button_check(arr[i][0], gp_face1) && i != global.P1controllerport)
            {
                p2time++;
                
                if (p2time > 120)
                {
                    global.P2controllerport = arr[i][0];
                    gamepad_set_axis_deadzone(global.P2controllerport, 0.25);
                    state++;
                    alarm[1] = 60;
                    SAVEDP2 = global.P2controllerport;
                    break;
                }
            }
        }
        
        if (gamepad_button_check(global.P1controllerport, gp_start) && gamepad_button_check(global.P1controllerport, gp_select))
        {
            state++;
            alarm[1] = 60;
        }
        
        break;
}

var temparr = [];

for (var i = 0; i <= gamepad_get_device_count(); i++)
{
    if (gamepad_is_connected(i))
        array_push(temparr, [i, gamepad_get_description(i)]);
}

if (arr != temparr)
    arr = temparr;
