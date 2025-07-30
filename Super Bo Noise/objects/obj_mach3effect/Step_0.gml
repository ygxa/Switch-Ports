if (!playerid.state == 123 && !playerid.state == 106)
    instance_destroy();

visible = playerid.visible;

if (playerid.state == 106)
    image_alpha = playerid.movespeed / 16;
