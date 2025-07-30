sprite_index = key_accept2 ? s_cs_handpressed : s_cs_hand;

if (collision_rectangle(x, y, x + 40, y + 70, obj_mousepointer, false, true) && mouse_check_button(mb_left))
    controllerbymouse = true;

if (controllerbymouse)
{
    window_set_cursor(cr_none);
    instance_deactivate_object(obj_mousepointer);
    x = mouse_x;
    y = mouse_y;
    key_accept2 = mouse_check_button(mb_left);
    key_accept = mouse_check_button_pressed(mb_left);
    
    if (mouse_check_button(mb_right))
        keyboard_key_press(global.keyboardp1key_tilt);
    
    return 0;
}

controller_initialize(global.P1controllerport);
key_left = keyboard_check(global.keyboardp1left) || dpadLeft;
key_right = keyboard_check(global.keyboardp1right) || dpadRight;
key_accept = keyboard_check_pressed(global.keyboardp1key_jump) || buttonAPress;
key_accept2 = keyboard_check(global.keyboardp1key_jump) || buttonA;
key_up = keyboard_check(global.keyboardp1up) || dpadUp;
key_down = keyboard_check(global.keyboardp1down) || dpadDown;
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
move_wrap(true, true, 30);
