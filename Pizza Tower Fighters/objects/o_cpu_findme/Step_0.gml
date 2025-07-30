if (instance_exists(cpuboy) && cpuboy.cpu_recovering == true)
{
    var _wally = instance_nearest(x, y, o_parentwall);
    
    if (instance_exists(_wally))
    {
        x = _wally.x;
        y = _wally.y - 5;
    }
}
else
{
    with (follow)
    {
        other.x = x;
        other.y = y + 10;
    }
}

if (!instance_exists(follow))
{
    o_cpu_findme.x = o_spawn.x;
    o_cpu_findme.y = o_spawn.y;
}
