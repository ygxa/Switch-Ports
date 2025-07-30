if (instance_exists(target))
{
    x = target.x;
    y = target.y;
    
    if (target.state != (9 << 0))
        instance_destroy();
}
else
{
    instance_destroy();
}
