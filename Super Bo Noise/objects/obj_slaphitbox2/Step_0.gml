image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if (playerid.image_index > 3 || playerid.state != 25)
    instance_destroy();
