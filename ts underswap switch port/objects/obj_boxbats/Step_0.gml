if (disappear)
{
    if (image_alpha > 0)
        image_alpha -= 0.1;
    else
        instance_destroy();
    
    exit;
}

xOff = 20 * sin(siner);
distance = number_approach_smooth(distance, 40, 0.2, 1);

with (obj_battlemanager)
{
    boxTranslateY = (other.xOff * 1.5) - other.distance;
    boxTranslateX = other.xOff * 0.5;
}

siner += 0.1;
x = (xstart + xOff) - 30;
y = ystart + (xOff * 0.5);

if (image_alpha < 1)
    image_alpha += 0.1;
