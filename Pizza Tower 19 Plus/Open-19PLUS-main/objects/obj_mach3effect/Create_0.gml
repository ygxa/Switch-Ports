playerid = obj_player;
image_speed = 0;
image_blend = choose(global.mach3effectred, global.mach3effectgreen, global.mach3effectspecial);
alarm[1] = 3;
alarm[0] = 15;
fading = 0;

if (playerid.state == states.nwalljump || playerid.state == states.noisecrusher)
    image_alpha = abs(playerid.movespeed / 12);
else
    image_alpha = playerid.movespeed / 12;
