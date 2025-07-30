controller_initialize(global.P1controllerport);
ScrPlayer1Input();

if (instance_exists(O_Text))
{
    last_h = 0;
    ScrPlayer_StopSprintSound();
}

if (damagemeter > damagemetermax)
    damagemeter = damagemetermax;

if (damagemeter == damagemetermax)
{
    if (damagemeteract == 0)
    {
        audio_play_sound(su_super_ready, 50, false);
        damagemeteract = 1;
    }
    
    hi_squidward--;
    
    if (hi_squidward == 0)
    {
        hi_squidward = 40;
        instance_create_layer(x + irandom_range(-10, 10), y + irandom_range(-10, 10), "part", o_supertaunt_part);
    }
}

if (instance_exists(o_youwon))
{
    ScrPlayer_StopSprintSound();
    sprintstartanim = true;
    sprint = false;
    
    if (instance_exists(O_Timer))
    {
        if (O_Timer.timermin == 0)
            state = (22 << 0);
        else
            state = (21 << 0);
    }
    else
    {
        state = (21 << 0);
    }
}

var _axis_pressed_left2 = false;
var _axis_pressed_right2 = false;
var _axis_pressed_down2 = false;
var _axis_pressed_up2 = false;

if (_axis_pressed_left2 == false && axis_left_prev2 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axisrh) < 0)
        _axis_pressed_left2 = true;
}

axis_left_prev2 = gamepad_axis_value(global.P1controllerport, gp_axisrh) < 0;
b_left_press2 = _axis_pressed_left2;

if (_axis_pressed_right2 == false && axis_right_prev2 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axisrh) > 0)
        _axis_pressed_right2 = true;
}

axis_right_prev2 = gamepad_axis_value(global.P1controllerport, gp_axisrh) > 0;
b_right_press2 = _axis_pressed_right2;

if (_axis_pressed_down2 == false && axis_down_prev2 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axisrv) > 0)
        _axis_pressed_down2 = true;
}

axis_down_prev2 = gamepad_axis_value(global.P1controllerport, gp_axisrv) > 0;
b_down_press2 = _axis_pressed_down2;

if (_axis_pressed_up2 == false && axis_up_prev2 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axisrv) < 0)
        _axis_pressed_up2 = true;
}

axis_up_prev2 = gamepad_axis_value(global.P1controllerport, gp_axisrv) < 0;
b_up_press2 = _axis_pressed_up2;
