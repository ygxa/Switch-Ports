hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
last_h = 0;
accel = 0.25;
accel_final = 0;
accel_max = 7.25;
sprint_accel_max = 10;
facing = 1;
abletodouble = 1;
hp = 150;
hpmax = 150;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
hitstun = 0;
gone = 0;
teleportcooldown = 0;
damagemeter = 0;
damagemetermax = 100;
damagemeter_height = 22;
damagemeter_width = 180;
event_inherited();
healthbar_height = 45;
healthbar_width = 140;
justspawned = 150;

if (global.player2intro == true)
{
    facing = -1;
    state = (18 << 0);
    image_xscale = -image_xscale;
}
