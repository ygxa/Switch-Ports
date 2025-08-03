switch (dir)
{
    case 1:
    case 3:
        x = camera_get_view_x(view_camera[0]);
        y = camera_get_view_y(view_camera[0]);
        break;
    
    case 0:
        x = camera_get_view_x(view_camera[0]);
        y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
        break;
    
    case 2:
        x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
        y = camera_get_view_y(view_camera[0]);
        break;
}

var len = array_length(bullets);
var anyLeft = false;

for (var i = 0; i < len; i++)
{
    var b = bullets[i];
    
    if (b != -4 && instance_exists(b))
    {
        anyLeft = true;
        
        if (object != obj_md_house_array_bullet)
        {
            if (dir == 0 || dir == 1)
            {
                if (launched)
                {
                    b.x = number_approach_smooth(b.x, x + 5 + (i * 20), 0.05, 0.5);
                }
                else
                {
                    b.x = x + 5 + (i * 20);
                    b.y = y;
                }
            }
            else if (launched)
            {
                b.y = number_approach_smooth(b.y, y + 5 + (i * 20), 0.05, 0.5);
            }
            else
            {
                b.x = x;
                b.y = y + 5 + (i * 20);
            }
        }
        else if (dir == 0 || dir == 1)
        {
            b.x = x + (i * 20);
            
            if (!launched)
                b.y = y;
        }
        else
        {
            if (!launched)
                b.x = x;
            
            b.y = y + 5 + (i * 20);
        }
    }
}

if (len != 0 && !anyLeft)
    instance_destroy();
