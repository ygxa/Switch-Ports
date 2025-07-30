can_collide = function(argument0 = 147)
{
    if (argument0 == 147)
    {
        var wow = (argument0.state == 85 && argument0.sprite_index != spr_cotton_drill) || argument0.state == 95;
        return wow;
    }
    else
    {
        return true;
    }
};
