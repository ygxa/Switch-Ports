if (time-- <= 0)
{
    var len = array_length(commands);
    
    for (var i = 0; i < len; i++)
    {
        var curr = commands[i];
        curr[0](curr[1]);
    }
    
    instance_destroy();
}
