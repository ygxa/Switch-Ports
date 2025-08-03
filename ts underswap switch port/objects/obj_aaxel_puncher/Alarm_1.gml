vspeed -= 4;

if (vspeed < -10)
{
    alarm[2] = 1;
    vspeed = 0;
}
else
{
    alarm[1] = 1;
}
