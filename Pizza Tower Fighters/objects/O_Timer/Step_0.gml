if (timer > 0 && timermin != 0 && !instance_exists(o_youwon))
    timer--;

if (timer == 0)
{
    timermin--;
    timer = 60;
}

if (timermin == 0)
{
    if (!instance_exists(o_youwon))
        instance_create_depth(x, y, -998, o_youwon);
    else
        timefinish--;
    
    if (timefinish == 0)
    {
        o_youwon.alarm[1] = 1;
        o_youwon.alarm[0] = 2;
    }
}
