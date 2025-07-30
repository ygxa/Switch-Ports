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
hp = 150;
noisebomb = 2;
hpmax = 150;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
hmove = 1;
hitstun = 0;

if (global.player2intro == true)
{
    facing = -1;
    state = (13 << 0);
    image_xscale = -image_xscale;
}

event_inherited();
healthbar_height = 69;
healthbar_width = 181;
justspawned = 150;
cputimer = 30;
noisedownaerialblock = false;
