direction += spin;

if (spin == 0 && (x < obj_battlemanager.boxX1 || x > obj_battlemanager.boxX2 || y < obj_battlemanager.boxY1 || y > obj_battlemanager.boxY2))
    instance_destroy();
