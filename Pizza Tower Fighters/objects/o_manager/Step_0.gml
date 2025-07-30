if (global.gameselect == "CPU")
    global.P2Cpu = true;

var windowfocus = window_has_focus();
audio_group_set_gain(mu_credits, global.music_group_gain - (muteperc * global.music_group_gain), 0);

if (instance_exists(obj_tape))
    muteperc = approach(muteperc, 0.98, 0.02);
else
    muteperc = approach(muteperc, 0, 0.02);

if (instance_exists(o_youwon))
{
    var func = function(argument0)
    {
        if (audio_is_playing(argument0))
            audio_stop_sound(argument0);
    };
    
    func(mu_credits);
    func(mu_funfarm);
    func(mu_dmas);
    func(mu_gnomeforest);
    func(mu_grinchrace);
    func(mu_pizzascape);
    func(mu_pizzascapeOLD);
    func(mu_secretstage);
    func(mu_training);
    func(mu_tutorial);
    func(mu_top);
}

if (global.unfocusedmute)
{
    if (windowfocus)
        audio_master_gain(global.default_group_gain);
    else
        audio_master_gain(0);
}
else
{
    audio_master_gain(global.default_group_gain);
}

var axis_pressed_left1 = false;
var axis_pressed_right1 = false;
var axis_pressed_down1 = false;
var axis_pressed_up1 = false;

if (axis_pressed_left1 == false && axis_left_prev1 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axislh) < 0)
        axis_pressed_left1 = true;
}

axis_left_prev1 = gamepad_axis_value(global.P1controllerport, gp_axislh) < 0;
global.b_left_press1 = axis_pressed_left1;

if (axis_pressed_right1 == false && axis_right_prev1 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axislh) > 0)
        axis_pressed_right1 = true;
}

axis_right_prev1 = gamepad_axis_value(global.P1controllerport, gp_axislh) > 0;
global.b_right_press1 = axis_pressed_right1;

if (axis_pressed_down1 == false && axis_down_prev1 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axislv) > 0)
        axis_pressed_down1 = true;
}

axis_down_prev1 = gamepad_axis_value(global.P1controllerport, gp_axislv) > 0;
global.b_down_press1 = axis_pressed_down1;

if (axis_pressed_up1 == false && axis_up_prev1 == false)
{
    if (gamepad_axis_value(global.P1controllerport, gp_axislv) < 0)
        axis_pressed_up1 = true;
}

axis_up_prev1 = gamepad_axis_value(global.P1controllerport, gp_axislv) < 0;
global.b_up_press1 = axis_pressed_up1;
var axis_pressed_left2 = false;
var axis_pressed_right2 = false;
var axis_pressed_down2 = false;
var axis_pressed_up2 = false;

if (axis_pressed_left2 == false && axis_left_prev2 == false)
{
    if (gamepad_axis_value(global.P2controllerport, gp_axislh) < 0)
        axis_pressed_left2 = true;
}

axis_left_prev2 = gamepad_axis_value(global.P2controllerport, gp_axislh) < 0;
global.b_left_press2 = axis_pressed_left2;

if (axis_pressed_right2 == false && axis_right_prev2 == false)
{
    if (gamepad_axis_value(global.P2controllerport, gp_axislh) > 0)
        axis_pressed_right2 = true;
}

axis_right_prev2 = gamepad_axis_value(global.P2controllerport, gp_axislh) > 0;
global.b_right_press2 = axis_pressed_right2;

if (axis_pressed_down2 == false && axis_down_prev2 == false)
{
    if (gamepad_axis_value(global.P2controllerport, gp_axislv) > 0)
        axis_pressed_down2 = true;
}

axis_down_prev2 = gamepad_axis_value(global.P2controllerport, gp_axislv) > 0;
global.b_down_press2 = axis_pressed_down2;

if (axis_pressed_up2 == false && axis_up_prev2 == false)
{
    if (gamepad_axis_value(global.P2controllerport, gp_axislv) < 0)
        axis_pressed_up2 = true;
}

axis_up_prev2 = gamepad_axis_value(global.P2controllerport, gp_axislv) < 0;
global.b_up_press2 = axis_pressed_up2;
