if (global.canmove)
{
    instance_create(obj_freefall_hole);
    
    if (room == rm_ruin19_g2l3)
    {
        var o = instance_create_xy(obj_player.x - 10, obj_player.y + 470, obj_freefall_end);
        o.minX = 0;
        o.maxX = 580;
        o.destroy = true;
        var topSolid = inst_get(111);
        var rightSolid = inst_get(112);
        topSolid.y += 1000;
        rightSolid.y += 1000;
        
        with (o)
        {
            while (collision_line(x, y + 5, x + 20, y - 8, obj_solid, true, true) != -4 || collision_line(x, y - 8, x + 20, y + 5, obj_solid, true, true) != -4)
                y -= 10;
        }
        
        topSolid.y -= 1000;
        rightSolid.y -= 1000;
    }
    else
    {
        var o = instance_create_xy(obj_player.x - 10, obj_player.y + 410, obj_freefall_end);
        o.minX = 0;
        o.maxX = 580;
        o.destroy = true;
    }
}
