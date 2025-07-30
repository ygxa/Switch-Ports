if (instance_exists(follow))
{
    with (follow)
    {
        other.x = x;
        other.y = y - other.yoffset;
    }
}
else
{
    instance_destroy();
}
