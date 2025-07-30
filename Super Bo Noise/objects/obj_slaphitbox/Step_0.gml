image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if ((playerid.image_index > 3 || playerid.state != 25) && playerid.state != 44 && playerid.state != 21)
    instance_destroy();
