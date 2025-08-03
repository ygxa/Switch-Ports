canHurt = (image_alpha > 0.2) ? true : false;
image_alpha -= 0.05;

if (image_alpha <= 0)
    instance_destroy();
else
    alarm[1] = 1;
