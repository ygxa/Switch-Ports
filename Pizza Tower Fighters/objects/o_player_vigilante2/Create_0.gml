hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 6.4;
sprint_accel_max = 9;
facing = 1;
abletodouble = 1;
noisebomb = 0;
hp = 200;
hpmax = 200;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
stupid = 0;
hmove = 1;
bullet_time = 10;
hitstun = 0;
event_inherited();
justspawned = 150;
cputimer = 30;

if (global.player2intro == true)
{
    state = (13 << 0);
    facing = -1;
    image_xscale = -image_xscale;
}
