if (alpha < 1)
{
    alpha += 0.1;
    offset += 1;
    alarm[0] = 1;
}
else
{
    alarm[1] = time;
}
