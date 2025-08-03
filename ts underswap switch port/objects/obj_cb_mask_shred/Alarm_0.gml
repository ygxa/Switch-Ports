image_alpha -= 0.2;

if (image_alpha > 0)
    alarm[0] = 1;
else
    instance_destroy();
