hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 15;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 15;
sprint_accel_max = 20;
facing = 1;
abletodouble = 1;
hp = 500;
hpmax = 500;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
hitstun = 0;
PummelWeed = 0;
event_inherited();
yoriginal = 0;
healthbar_x = 67;
healthbar_width = 145;
justspawned = 150;

if (global.player1intro == true && room != R_Credits && room != R_Tutorial)
    state = (7 << 0);
