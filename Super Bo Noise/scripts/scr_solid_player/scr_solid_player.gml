function scr_solid_player(argument0, argument1) //scr_solid_player
{
    return place_meeting_collision(argument0, argument1);
}

function check_slope_player(argument0) //check_slope_player
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if (image_xscale > 0)
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
            slope = slope_start - (round(m * (object_side - bbox_left)))
            if (other.bbox_bottom >= slope)
                return true;
        }
    }
    return false;
}

