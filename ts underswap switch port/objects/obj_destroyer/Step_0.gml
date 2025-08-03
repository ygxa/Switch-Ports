if (!instance_exists(object))
{
    instance_destroy();
}
else if (time < totalTime)
{
    time++;
}
else
{
    instance_destroy(object);
    instance_destroy();
}
