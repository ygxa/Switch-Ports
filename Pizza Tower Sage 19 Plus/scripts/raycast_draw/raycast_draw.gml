function raycast_draw(argument0)
{
    var _ray = argument[0];
    
    switch (ds_map_find_value(_ray, "obj") == -4)
    {
        case true:
            draw_set_colour(c_red);
            break;
        
        case false:
            draw_set_colour(c_lime);
            break;
    }
    
    draw_line_width(ds_map_find_value(_ray, "x_origin"), ds_map_find_value(_ray, "y_origin"), ds_map_find_value(_ray, "x"), ds_map_find_value(_ray, "y"), 2);
    draw_set_colour(c_white);
    _ray = undefined;
}
