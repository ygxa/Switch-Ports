hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 15;
last_h = 0;
accel = 0.2;
accel_final = 0;
accel_max = 7.77;
sprint_accel_max = 9.99;
facing = 1;
abletodouble = 1;
noisebomb = 2;
hp = 125;
hpmax = 125;
state = (0 << 0);
HitByAttack = ds_list_create();
controller = 0;
flash = 0;
abletorecover = 1;
hitstun = 0;
hurt = false;
event_inherited();
healthbar_height = 67;

if (global.player1intro == true)
    state = (13 << 0);

justspawned = 150;
damagemetermax = 250;

if (global.palp1 == 3)
{
    with (instance_create_depth(x, y, -1000, O_Hat))
    {
        target = o_player_doise;
        sprite_index = s_el_diego_hat;
    }
}
