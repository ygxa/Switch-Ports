if (hspeed > 0 && x > (obj_battlemanager.boxX2 + 30))
    instance_destroy();
else if (hspeed < 0 && x < (obj_battlemanager.boxX1 - 30))
    instance_destroy();
else
    image_angle += rotSpeed;
