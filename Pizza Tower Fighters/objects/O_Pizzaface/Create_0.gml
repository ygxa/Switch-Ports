hsp = -5;
vsp = 0;
grv = 0.7;
walksp = 5;
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
hp = 400;
hpmax = 400;
targetx = 0;
targety = 0;
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
hmove = 1;
hitstun = 0;
event_inherited();
PummelWeed = 0;
cputimer = 90;
attack = 0;
justspawned = 150;
timetillflip = 120;
y -= 250;
yaim = 5;
healthbar_width = 175;
healthbar_height = 75;
bdamaged_timr = 30;
state = (0 << 0);

if (room == R_Top)
{
    phase1tile = layer_get_id("p1cloud");
    phase1tile2 = layer_get_id("p1cloud2");
    phase1tile3 = layer_get_id("p1sky");
    phase3tile = layer_get_id("p3sky");
    phase3tile2 = layer_get_id("p3cloud2");
    phase3tile3 = layer_get_id("p3cloud1");
    phase3tile4 = layer_get_id("phase3rain");
    phase3tile5 = layer_get_id("phase3tint");
    fadeid = 0;
}

palette = 0;
winvarrr = 0;
