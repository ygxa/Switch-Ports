image_xscale = number_approach_smooth(image_xscale, 2, 0.1, 0.02);
image_yscale = number_approach_smooth(image_yscale, 2, 0.1, 0.02);
internalDirection = number_approach_smooth(internalDirection, targetDirection, 0.075, 0.5);

if (erratic)
{
    internalDirection += (random_range(-1, 1) * 4);
    targetDirection += (random_range(-5, 5) * 1.5);
}

if (dir == 3)
    direction = internalDirection - 180;
else
    direction = internalDirection;

if (instance_exists(obj_migospb_target))
{
    direction = point_direction(x, y, obj_migospb_target.x, obj_migospb_target.y);
    
    if (instance_exists(obj_vegroot) || instance_exists(obj_veggun))
        speed = 1.5;
    else
        speed = 3;
    
    if (obj_battleheart.invincibilityTimer != 0)
    {
        if (distance_to_object(obj_battleheart) <= 3)
            event_user(1);
    }
}
else if (specialHoming)
{
    var targX = obj_battleheart.x + (obj_battleheart.sprite_width / 2);
    var targY = obj_battleheart.y + (obj_battleheart.sprite_height / 2);
    
    if (point_distance(x, y, xprevious, yprevious) < 5)
    {
        specialHoming = false;
        direction = point_direction(x, y, targX, targY);
        internalDirection = (dir == 3) ? (direction + 180) : direction;
        targetDirection = internalDirection + random_range(-5, 5);
        speed = 4;
    }
    else
    {
        direction = number_approach_smooth(direction, point_direction(x, y, targX, targY), 0.5, 0.1);
    }
}

image_angle = direction + 90;

if (floor(image_index) == 2)
{
    image_speed = 0;
    image_index = 2;
}

if (y >= (obj_battlemanager.boxY2 - 40))
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
