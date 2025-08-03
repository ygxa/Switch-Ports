var imageFrame = floor(image_index);
var inRange = point_distance(x, y, obj_player.x, obj_player.y) <= range;

if (inRange)
{
    if ((shootTimer % throwFreq) == 0)
        var bul = instance_create_xy(x + (sprite_width / 2), y + (sprite_height / 2), obj_ambush_bullet);
    
    shootTimer++;
}

if (patrol && inRange)
{
    image_speed = 0.2;
    var centerX = x + (sprite_width / 2);
    
    if (abs(centerX - obj_player.x) > 4)
    {
        if (obj_player.x < centerX)
            x -= 3;
        else if (obj_player.x > centerX)
            x += 3;
    }
    
    if ((x < upperBound && x > lowerBound) && x != xprevious)
    {
        if (imageFrame != lastImageFrame && (imageFrame == 1 || imageFrame == 3))
            sfx_play(snd_guardstep);
    }
    else
    {
        image_index = 0;
        imageFrame = 0;
        x = xprevious;
    }
}
else
{
    image_speed = 0;
}

if (moveIn)
{
    x = number_approach_linear(x, moveInX, 3);
    y = number_approach_linear(y, moveInY, 3);
    
    if (x != moveInX || y != moveInY)
    {
        image_speed = 0.2;
        
        if (imageFrame != lastImageFrame && (imageFrame == 1 || imageFrame == 3))
            sfx_play(snd_guardstep);
    }
    else
    {
        image_speed = 0;
        moveIn = false;
    }
}

lastImageFrame = imageFrame;
