hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 0;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 1;
facing = 1;
abletodouble = 1;
hp = 1000000000000;
hpmax = 10000000000000;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
inv = false;
hitstun = 0;
healthbar_x = 520;
healthbar_y = 82;
parry = false;
comboshake = 0;
combo = 0;
combo_show = 0;
damagedealtshow = 0;
damagedealttotalshow = 0;
damagedealt = 0;
damagedealttotal = 0;
global.player2intro = false;

with (instance_create_layer(x, y, layer, o_maker2))
    image_alpha = 0;

if (!instance_exists(o_maker2))
    instance_create_layer(x, y, layer, o_maker2);
