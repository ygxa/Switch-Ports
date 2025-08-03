if (image_alpha < 1)
    image_alpha += 0.1;

switch (state)
{
    case 0:
        var nearest = instance_nearest(x, y, obj_beenard_pollen);
        
        if (nearest == -4)
            break;
        
        if (point_distance(x, y, nearest.x, nearest.y) < 80)
        {
            state = 1;
            image_speed = 1;
            targetScale = 1;
            
            if (irandom(1) == 0)
                targetScale += random(1);
        }
        
        break;
    
    case 1:
        if (image_speed == 1 && floor(image_index) >= (image_number - 1))
        {
            image_speed = 0;
            image_index = image_number - 1;
            targetX = x + irandom_range(-20, 20);
            targetY = y - irandom_range(40, 100);
            alarm[0] = 10;
        }
        
        break;
    
    case 2:
        x = number_approach_smooth(x, targetX, 0.1, 0.5);
        y = number_approach_smooth(y, targetY, 0.1, 0.5);
        
        if (collision_line(xstart, ystart, x, y - (sprite_height * 0.5), obj_battleheart, true, true) != -4)
            event_user(0);
        
        break;
}

image_xscale = number_approach_smooth(image_xscale, targetScale, 0.15, 0.01);
image_yscale = image_xscale;
