if (instance_exists(target))
{
    x = target.x;
    y = target.y;
    facing = target.facing;
    image_xscale = sign(facing);
}
else
{
    instance_destroy();
}
