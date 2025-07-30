hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
key_left = 0;
key_right = 0;
key_jump = 0;
key_up = 0;
key_down = 0;
key_E = 0;
key_Q = 0;
key_taunt = 0;
key_double_pressed = 0;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 6;
facing = 1;
abletodouble = 1;
abletorecover = 1;
sprint_accel_max = 10;
hp = 250;
hpmax = 250;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
hmove = 1;
hitstun = 0;
event_inherited();
PummelWeed = 0;
cputimer = 30;
healthbar_width = 145;
justspawned = 150;

if (global.player2intro == true)
{
    state = (15 << 0);
    image_xscale = -image_xscale;
    facing = -1;
}

if (global.P2Cpu == true)
{
}
