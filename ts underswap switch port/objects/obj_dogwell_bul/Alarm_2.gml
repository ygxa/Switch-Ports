x = xstart + shake;
shake = -(shake - sign(shake));

if (shake != 0)
{
    alarm[2] = 1;
}
else
{
    x = xstart;
    shake = 2;
}
