if (alpha > 0)
{
    alpha -= 0.2;
    offset += 1;
    alarm[1] = 1;
}
else
{
    instance_destroy();
}
