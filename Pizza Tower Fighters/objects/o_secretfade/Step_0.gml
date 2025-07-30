if (fadein)
    alpha -= 0.1;
else
    alpha += 0.1;

if (alpha > 1.2)
    fadein = true;

if (fadein && alpha < 0)
    instance_destroy();
