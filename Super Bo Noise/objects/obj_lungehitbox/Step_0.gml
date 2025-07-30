if (playerid.state != 45 && playerid.state != 44)
{
    instance_destroy();
    exit;
}

x = playerid.x + (24 * playerid.xscale);
y = playerid.y;
