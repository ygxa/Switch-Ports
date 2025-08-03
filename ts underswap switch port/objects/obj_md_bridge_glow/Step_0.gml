image_xscale += 0.12;
image_yscale += 0.05;
image_alpha -= 0.2;

if (image_alpha <= 0)
    instance_destroy();
