x = playerid.x;
y = playerid.y + yoff;

if (playerid.state != 78 && playerid.state != 110)
    instance_destroy();

visible = !(room == rank_room);
