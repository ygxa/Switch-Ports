event_inherited();
image_xscale = 2;
image_yscale = 2;

if (irandom(1) == 0)
{
    x = global.boxtypes[(4 << 0)][3] - 20;
    spd = 8;
    dir = -1;
    grav = 0;
}
else
{
    x = global.boxtypes[(4 << 0)][1] + 20;
    spd = -8;
    dir = 1;
    grav = 0;
}

y = obj_battlemanager.boxY2 - 10;
bulletType = (0 << 0);
alarm[0] = 60;
