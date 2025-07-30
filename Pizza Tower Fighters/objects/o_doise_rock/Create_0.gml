event_inherited();
player = 1;
hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 5;
timer = 200;
facing = 0;
firstplayer = player;
bounced = 10;
damagemeter = 0;
damagemetermax = 0;
damagenull = false;

if (place_meeting(x, y, ObjWall) && !place_meeting(x, y, o_slope))
{
    instance_destroy();
    instance_create_layer(x, y, layer, o_player_noise_explosion);
}
