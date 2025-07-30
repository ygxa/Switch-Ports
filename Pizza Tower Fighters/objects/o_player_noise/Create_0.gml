hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 7;
sprint_accel_max = 9.5;
facing = 1;
abletodouble = 1;
noisebomb = 2;
hp = 150;
hpmax = 150;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
hitstun = 0;
event_inherited();
healthbar_height = 69;
healthbar_width = 181;

if (global.player1intro == true)
    state = (13 << 0);

justspawned = 150;
