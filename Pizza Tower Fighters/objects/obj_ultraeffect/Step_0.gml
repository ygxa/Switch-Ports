image_xscale += 0.01;
image_yscale = image_xscale;
image_alpha -= 0.05;

if (image_alpha < 0)
    instance_destroy();
