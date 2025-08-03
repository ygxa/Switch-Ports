timer--;

if (timer <= 0)
    image_alpha -= 0.08;

if (image_alpha <= 0)
    instance_destroy();
else
    image_angle += angler;
