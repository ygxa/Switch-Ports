if (playerid.state != 67 && playerid.state != 2 && playerid.state != 4 && playerid.state != 66 && playerid.state != 15 && playerid.state != 68 && playerid.state != 35 && playerid.state != 28 && playerid.state != 32 && playerid.state != 34 && playerid.state != 98 && playerid.state != 29 && playerid.state != 26 && playerid.state != 60 && playerid.state != 90 && playerid.state != 93 && playerid.state != 125 && (playerid.state != 57 && playerid.state != 86 && playerid.state != 100 && global.cane == 0 && playerid.state != 101 && playerid.state != 112))
    vanish = 1;

if (vanish == 1)
{
    if (gonealpha > 0)
        gonealpha -= 0.15;
    else if (gonealpha <= 0)
        instance_destroy();
}

visible = playerid.visible;

with (realcol)
{
    switch (other.color)
    {
        case 1:
            r = 48;
            g = 168;
            b = 248;
            r2 = 15;
            g2 = 57;
            b2 = 121;
            break;
        
        case 2:
            r = 232;
            g = 80;
            b = 152;
            r2 = 95;
            g2 = 9;
            b2 = 32;
            break;
    }
}
