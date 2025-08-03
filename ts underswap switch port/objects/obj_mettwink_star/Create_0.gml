direction = 180 - irandom(30);
image_xscale = 2;
image_yscale = 2;
speed = 5;
time = 0;

if (instance_exists(obj_mettalot_monster))
{
    depth = obj_mettalot_monster.depth - 1;
    image_blend = obj_mettalot_monster.image_blend;
}
