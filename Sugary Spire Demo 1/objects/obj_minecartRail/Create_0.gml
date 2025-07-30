depth = 4;

can_collide = function(argument0 = 147)
{
    if (argument0 == 147)
    {
        var wow = argument0.state == 98;
        return wow;
    }
    else if (argument0 == 110 || argument0 == 262)
    {
        return true;
    }
    else
    {
        return false;
    }
};
