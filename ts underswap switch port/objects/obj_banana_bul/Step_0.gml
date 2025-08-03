if (instance_exists(obj_boogiemen_propeller_atk))
    instance_destroy();

if ((x < obj_battlemanager.boxX1 || x > obj_battlemanager.boxX2 || y < obj_battlemanager.boxY1 || y > obj_battlemanager.boxY2) && !instance_exists(obj_koffink_monster))
    instance_destroy();

if (abs(speed) < 0.05)
{
    speed = 0;
    friction = 0;
    sliding = false;
}

if (image_alpha < 1)
    image_alpha += 0.1;
