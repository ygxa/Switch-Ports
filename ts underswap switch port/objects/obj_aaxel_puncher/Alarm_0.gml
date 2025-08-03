var targetOffset;

if (instance_exists(obj_moldrickb_squish))
    targetOffset = 150;
else
    targetOffset = 100;

if (y >= (obj_battlemanager.boxY1 - targetOffset))
{
    alarm[1] = 1;
    image_speed = 0.6;
}
else
{
    alarm[0] = 1;
}
