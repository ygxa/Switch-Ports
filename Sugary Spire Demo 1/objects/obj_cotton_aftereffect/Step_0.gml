if (playerid.state == 85)
    draw_alpha = (clamp(playerid.movespeed - 6, 0, 2) / 2) * 0.45;
else if (playerid.state == 95)
    draw_alpha = (playerid.movespeed / 8) * 0.45;
else if (playerid.state == 94)
    draw_alpha = (abs(playerid.vsp) / 20) * 0.45;

if (image_alpha > 0)
    image_alpha -= 0.06;

if (image_alpha <= 0)
    instance_destroy();
