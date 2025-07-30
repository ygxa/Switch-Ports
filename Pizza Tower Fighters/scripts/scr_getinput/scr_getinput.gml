function scr_writeinputglobals()
{
    ini_open("options.ini");
    var keybinds = ["key_left", "key_right", "key_up", "key_down", "key_jump", "key_attack", "key_run", "key_knife"];
    var keybindsdefault = [37, 39, 38, 40, 90, 88, 16, 65];
    
    for (var i = 0; i < array_length(keybinds); i++)
        ini_write_string("controls", keybinds[i], keybindsdefault[i]);
    
    keybinds = ["key_left_gamepad", "key_right_gamepad", "key_up_gamepad", "key_down_gamepad", "key_jump_gamepad", "key_attack_gamepad", "key_run_gamepad", "key_knife_gamepad"];
    keybindsdefault = [32783, 32784, 32781, 32782, 32769, 32771, 32774, 32772];
    
    for (var i = 0; i < array_length(keybinds); i++)
        ini_write_string("controls", keybinds[i], keybindsdefault[i]);
    
    ini_close();
}

function scr_saveinput()
{
    ini_open("options.ini");
    var keybinds = ["key_left", "key_right", "key_up", "key_down", "key_jump", "key_tilt", "key_special", "key_taunt"];
    var keybindsdefault = [global.keyboardp1left, global.keyboardp1right, global.keyboardp1up, global.keyboardp1down, global.keyboardp1key_jump, global.keyboardp1key_tilt, global.keyboardp1key_special, global.keyboardp1key_special];
    
    for (var i = 0; i < array_length(keybinds); i++)
        ini_write_string("controls", keybinds[i], keybindsdefault[i]);
    
    with (obj_savesystem)
    {
        dirty = true;
        dontdoshit = true;
    }
    
    ini_close();
}

function scr_initinputglobals()
{
    ini_open("options.ini");
    global.key_leftC = ini_read_string("controls", "key_left", 37);
    global.key_rightC = ini_read_string("controls", "key_right", 39);
    global.key_upC = ini_read_string("controls", "key_up", 38);
    global.key_downC = ini_read_string("controls", "key_down", 40);
    global.key_jumpC = ini_read_string("controls", "key_jump", 90);
    global.key_attackC = ini_read_string("controls", "key_attack", 88);
    global.key_runC = ini_read_string("controls", "key_run", 16);
    global.key_knifeC = ini_read_string("controls", "key_knife", 65);
    global.key_leftG = ini_read_string("controls", "key_left_gamepad", 32783);
    global.key_rightG = ini_read_string("controls", "key_right_gamepad", 32784);
    global.key_upG = ini_read_string("controls", "key_up_gamepad", 32781);
    global.key_downG = ini_read_string("controls", "key_down_gamepad", 32782);
    global.key_jumpG = ini_read_string("controls", "key_jump_gamepad", 32769);
    global.key_attackG = ini_read_string("controls", "key_attack_gamepad", 32771);
    global.key_runG = ini_read_string("controls", "key_run_gamepad", 32774);
    global.key_knifeG = ini_read_string("controls", "key_knife_gamepad", 32772);
    ini_close();
}

function scr_holding(argument0)
{
    return keyboard_check(argument0);
}

function scr_press(argument0)
{
    return keyboard_check_pressed(argument0);
}

function scr_initinput()
{
    player_input_device[0] = 0;
    key_left = 0;
    key_left2 = 0;
    key_right = 0;
    key_right2 = 0;
    key_up = 0;
    key_up2 = 0;
    key_down = 0;
    key_down2 = 0;
    key_jump = 0;
    key_jump2 = 0;
    key_run = 0;
    key_run2 = 0;
    key_attack = 0;
    key_attack2 = 0;
    key_knife = 0;
    key_knife2 = 0;
    
    for (var i = 0; i < gamepad_get_device_count(); i++)
    {
        if (gamepad_is_connected(i))
            player_input_device[0] = i;
    }
    
    global.player_gamepad[0] = player_input_device[0];
    scr_initinputglobals();
}

function scr_getinput()
{
    key_left = -(keyboard_check(global.key_leftC) || gamepad_button_check(global.player_gamepad[0], global.key_leftG));
    key_left2 = -(keyboard_check_pressed(global.key_leftC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_leftG));
    key_right = keyboard_check(global.key_rightC) || gamepad_button_check(global.player_gamepad[0], global.key_rightG);
    key_right2 = keyboard_check_pressed(global.key_rightC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_rightG);
    key_up = keyboard_check(global.key_upC) || gamepad_button_check(global.player_gamepad[0], global.key_upG);
    key_up2 = keyboard_check_pressed(global.key_upC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_upG);
    key_down = keyboard_check(global.key_downC) || gamepad_button_check(global.player_gamepad[0], global.key_downG);
    key_down2 = keyboard_check_pressed(global.key_downC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_downG);
    key_jump = keyboard_check(global.key_jumpC) || gamepad_button_check(global.player_gamepad[0], global.key_jumpG);
    key_jump2 = keyboard_check_pressed(global.key_jumpC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_jumpG);
    key_run = keyboard_check(global.key_runC) || gamepad_button_check(global.player_gamepad[0], global.key_runG);
    key_run2 = keyboard_check_pressed(global.key_runC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_runG);
    key_attack = keyboard_check(global.key_attackC) || gamepad_button_check(global.player_gamepad[0], global.key_attackG);
    key_attack2 = keyboard_check_pressed(global.key_attackC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_attackG);
    key_knife = keyboard_check(global.key_knifeC) || gamepad_button_check(global.player_gamepad[0], global.key_knifeG);
    key_knife2 = keyboard_check_pressed(global.key_knifeC) || gamepad_button_check_pressed(global.player_gamepad[0], global.key_knifeG);
    key_start = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.player_gamepad[0], gp_start);
}

function scr_getinput2()
{
    key_left = -scr_holding(65);
    key_left2 = -scr_press(65);
    key_right = scr_holding(68);
    key_right2 = scr_press(68);
    key_up = scr_holding(87);
    key_up2 = scr_press(87);
    key_down = scr_holding(83);
    key_down2 = scr_press(83);
    key_jump = scr_holding(74);
    key_jump2 = scr_press(74);
    key_run = scr_holding(72);
    key_run2 = scr_press(72);
    key_attack = scr_holding(75);
    key_attack2 = scr_press(75);
    key_knife = scr_holding(80);
    key_knife2 = scr_press(80);
}

function scr_updateoptionskeys()
{
    if (player_set == 1)
    {
        with (obj_optionkeyselect)
        {
            backbuffer = 3;
            keys = [];
            array_push(keys, ["UP", global.keyboardp1up]);
            array_push(keys, ["DOWN", global.keyboardp1down]);
            array_push(keys, ["LEFT", global.keyboardp1left]);
            array_push(keys, ["RIGHT", global.keyboardp1right]);
            array_push(keys, ["JUMP", global.keyboardp1key_jump]);
            array_push(keys, ["TILT", global.keyboardp1key_tilt]);
            array_push(keys, ["SPECIAL", global.keyboardp1key_special]);
            array_push(keys, ["TAUNT", global.keyboardp1key_taunt]);
            array_push(keys, ["EXIT", "PRESS JUMP"]);
        }
    }
    else
    {
        with (obj_optionkeyselectP2)
        {
            backbuffer = 3;
            keys = [];
            array_push(keys, ["UP", global.keyboardp2up]);
            array_push(keys, ["DOWN", global.keyboardp2down]);
            array_push(keys, ["LEFT", global.keyboardp2left]);
            array_push(keys, ["RIGHT", global.keyboardp2right]);
            array_push(keys, ["JUMP", global.keyboardp2key_jump]);
            array_push(keys, ["TILT", global.keyboardp2key_tilt]);
            array_push(keys, ["SPECIAL", global.keyboardp2key_special]);
            array_push(keys, ["TAUNT", global.keyboardp2key_taunt]);
            array_push(keys, ["EXIT", "PRESS JUMP"]);
        }
    }
}
