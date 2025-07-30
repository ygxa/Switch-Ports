condition = function()
{
    return !instance_exists(100123);
};

output = function()
{
    if (instance_exists(100052))
    {
        with (100052)
            Region_active = false;
    }
};
