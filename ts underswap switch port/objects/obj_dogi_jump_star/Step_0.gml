dist += 3.5;
angle += 2.5;
x = xstart + lengthdir_x(dist, angle);
y = ystart + lengthdir_y(dist, angle);
image_angle = angle * 2;

if (dist >= 160)
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
