controller_initialize(global.P2controllerport);
key_left = keyboard_check(global.keyboardp2left) || dpadLeft;
key_right = keyboard_check(global.keyboardp2right) || dpadRight;
key_accept = keyboard_check_pressed(global.keyboardp2key_jump) || buttonAPress;
key_accept2 = keyboard_check(global.keyboardp2key_jump) || buttonA;
key_up = keyboard_check(global.keyboardp2up) || dpadUp;
key_down = keyboard_check(global.keyboardp2down) || dpadDown;
var move = key_left - key_right;
hsp = move * walksp;
var moveup = key_up - key_down;
vsp = moveup * YalkSp;

if (gamepad_is_connected(global.P1controllerport) && move == 0 && moveup == 0)
{
    hsp = stickLeftH * 9;
    vsp = stickLeftV * 9;
}

if (place_meeting(x + hsp, y, ObjWall))
{
    while (!place_meeting(x + sign(hsp), y, ObjWall))
        x += sign(hsp);
    
    hsp = 0;
}

x += hsp;

if (place_meeting(x, y + vsp, ObjWall))
{
    while (!place_meeting(x, y + sign(vsp), ObjWall))
        y += sign(vsp);
    
    vsp = 0;
}

y += vsp;
sprite_index = key_accept2 ? s_cs_handpressed2 : s_cs_hand2;
move_wrap(true, true, 30);
