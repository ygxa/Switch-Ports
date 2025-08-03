fade -= 0.1;

if (fade <= 0)
{
    callback();
    instance_destroy();
}
else
{
    alarm[1] = 1;
}
