x = number_approach_smooth(x, 600, 0.25, 0.5);

if (x != 600)
{
    if (x > obj_bugerpant.x)
    {
        lookDirection = 2;
        obj_bugerpant.lookDirection = 3;
    }
    
    alarm[3] = 1;
}
