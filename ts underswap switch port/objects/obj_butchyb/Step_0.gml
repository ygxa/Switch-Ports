siner += 0.15;
x = xstart + (sin(siner) * 8);
legFrame += 0.2;

if (legFrame >= 2)
    legFrame -= 2;

if (y >= (obj_battlemanager.boxY2 - 20))
    instance_destroy();
