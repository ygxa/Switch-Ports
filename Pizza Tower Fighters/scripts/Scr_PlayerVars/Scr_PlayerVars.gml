function Scr_PlayerVars()
{
    global.keyboardp1left = ini_read_real("P1Control", "keyLeft", 37);
    global.keyboardp1right = ini_read_real("P1Control", "keyRight", 39);
    global.keyboardp1down = ini_read_real("P1Control", "keyDown", 40);
    global.keyboardp1up = ini_read_real("P1Control", "keyUp", 38);
    global.keyboardp1key_jump = ini_read_real("P1Control", "keyJump", 90);
    global.keyboardp1key_tilt = ini_read_real("P1Control", "keyAttack", 88);
    global.keyboardp1key_special = ini_read_real("P1Control", "keySpecial", 67);
    global.keyboardp1key_taunt = ini_read_real("P1Control", "keyTaunt", 86);
    global.conp1leftbut = 32783;
    global.conp1rightbut = 32784;
    global.conp1downbut = 32782;
    global.conp1upbut = 32781;
    global.conp1key_jump = 90;
    global.conp1key_tilt = 88;
    global.conp1key_special = 67;
    global.conp1key_taunt = 86;
}

function Scr_Player2Vars()
{
    global.keyboardp2left = ini_read_real("P2Control", "keyLeft", 65);
    global.keyboardp2right = ini_read_real("P2Control", "keyRight", 68);
    global.keyboardp2down = ini_read_real("P2Control", "keyDown", 83);
    global.keyboardp2up = ini_read_real("P2Control", "keyUp", 87);
    global.keyboardp2key_jump = ini_read_real("P2Control", "keyJump", 76);
    global.keyboardp2key_tilt = ini_read_real("P2Control", "keyAttack", 79);
    global.keyboardp2key_special = ini_read_real("P2Control", "keySpecial", 80);
    global.keyboardp2key_taunt = ini_read_real("P2Control", "keyTaunt", 73);
}
