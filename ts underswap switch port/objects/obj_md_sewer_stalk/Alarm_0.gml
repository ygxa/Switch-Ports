x += 10;

if (x < currentTarget)
{
    alarm[0] = 1;
}
else
{
    x = currentTarget;
    currentTarget = x + 160;
    
    if (instance_number(obj_trigger_code) <= 1)
        ds_map_set(global.flags, "plot", 24.75);
}
