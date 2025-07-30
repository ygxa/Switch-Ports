ini_open("saveData.ini");
global.input_check = {
    up:    ini_read_integer("ControlsKeys",    "up",     38),
    right: ini_read_integer("ControlsKeys",    "right",  39),
    left:  ini_read_integer("ControlsKeys",    "left",   37),
    down:  ini_read_integer("ControlsKeys",    "down",   40),
    jump:  ini_read_integer("ControlsKeys",    "jump",   90),
    slap:  ini_read_integer("ControlsKeys",    "slap",   88),
    shoot: ini_read_integer("ControlsKeys",    "shoot",  67),
    attack:ini_read_integer("ControlsKeys",    "attack", 16),
    start: 27
};
global.input_check_pressed = {
    jump: ini_read_integer("ControlsKeys", "jump", 90)
};
global.ctrl_button = {
    up:     ini_read_integer("ControllerButton", "up",    32781),
    right:  ini_read_integer("ControllerButton", "right", 32784),
    left:   ini_read_integer("ControllerButton", "left",  32783),
    down:   ini_read_integer("ControllerButton", "down",  32782),
    jump:   ini_read_integer("ControllerButton", "jump",  32769),
    slap:   ini_read_integer("ControllerButton", "slap",  32771),
    shoot:  ini_read_integer("ControllerButton", "shoot", 32770),
    attack: ini_read_integer("ControllerButton", "attack",32774),
    start:  ini_read_integer("ControllerButton", "start", 32778)
};
global.input_check2 = {
    up:    ini_read_integer("ControlsKeys2", "up",     87),
    right: ini_read_integer("ControlsKeys2", "right",  68),
    left:  ini_read_integer("ControlsKeys2", "left",   65),
    down:  ini_read_integer("ControlsKeys2", "down",   83),
    jump:  ini_read_integer("ControlsKeys2", "jump",   76),
    slap:  ini_read_integer("ControlsKeys2", "slap",   75),
    taunt: ini_read_integer("ControlsKeys2", "taunt",  79),
    shoot: ini_read_integer("ControlsKeys2", "shoot",  73),
    attack:ini_read_integer("ControlsKeys2", "attack", 74),
    start: ini_read_integer("ControlsKeys2", "start",  80)
};
global.ctrl_button2 = {
    up:     ini_read_integer("ControllerButton", "up",    32781),
    right:  ini_read_integer("ControllerButton", "right", 32784),
    left:   ini_read_integer("ControllerButton", "left",  32783),
    down:   ini_read_integer("ControllerButton", "down",  32782),
    jump:   ini_read_integer("ControllerButton", "jump",  32769),
    slap:   ini_read_integer("ControllerButton", "slap",  32771),
    taunt:  ini_read_integer("ControllerButton", "taunt", 32772),
    shoot:  ini_read_integer("ControllerButton", "shoot", 32770),
    attack: ini_read_integer("ControllerButton", "attack",32774),
    start:  ini_read_integer("ControllerButton", "start", 32778)
};
ini_close();


optionselect = 0;
level[0] = "1.DESERT";
level[1] = "2.MANSION";
level[2] = "3.FACTORY";
level[3] = "4.SEWER";
level[4] = "5.FREEZER";
level[5] = "6.GOLF";
b = 0;
levelselect = 0;
