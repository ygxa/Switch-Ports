if (ds_map_find_value(global.flags, "st7c_crash") || evac(2))
{
    instance_destroy();
    exit;
}

global.scene_on_room_start_override = true;
global.canmove = false;
global.player_direction_on_room_start = 3;
speedup = false;
speed = 0;
gravity_direction = 270;
playedFall = false;
alarm[1] = 20;
ds_map_set(global.flags, "st7c_crash", true);
