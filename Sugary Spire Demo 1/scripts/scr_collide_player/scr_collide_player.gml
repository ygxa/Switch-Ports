function scr_upslope_player(argument0, argument1, argument2 = 3)
{
    for (var i = argument2; i > 0; i--)
    {
        var _check = true;
        var _z = i - 1;
        
        repeat (i - 1)
        {
            if (!scr_solid_player(argument0, argument1 - _z))
                _check = false;
            
            _z--;
        }
        
        if (scr_solid_player(argument0, argument1) && _check && !scr_solid_player(argument0, argument1 - i))
            return i;
    }
    
    return false;
}

function scr_downslope_player(argument0, argument1, argument2 = 3)
{
    for (var i = 1; i < (argument2 + 1); i++)
    {
        var _check = true;
        var _z = 1;
        
        repeat (i)
        {
            if (scr_solid_player(argument0, argument1 + _z))
                _check = false;
            
            _z++;
        }
        
        if (!scr_solid_player(argument0, argument1) && _check && scr_solid_player(argument0, argument1 + (i + 1)))
            return i;
    }
    
    return false;
}

function scr_collide_player()
{
    grounded = false;
    groundedSlope = false;
    grinding = false;
    
    repeat (abs(vsp))
    {
        if (!scr_solid_player(x, y + sign(vsp)))
        {
            y += sign(vsp);
        }
        else
        {
            vsp = 0;
            break;
        }
    }
    
    repeat (abs(hsp))
    {
        y -= scr_upslope_player(x + sign(hsp), y);
        y += scr_downslope_player(x + sign(hsp), y);
        
        if (!scr_solid_player(x + sign(hsp), y))
        {
            x += sign(hsp);
        }
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    grounded = scr_solid_player(x, y + 1);
    groundedSlope = scr_slope_ext(x, y + 1) && scr_slope_ext(x, (y - bbox_top) + bbox_bottom);
}
