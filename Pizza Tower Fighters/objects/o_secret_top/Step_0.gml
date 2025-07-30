if (fadein)
    alpha -= 0.3;
else
    alpha += 0.2;

if (alpha > 1.2)
    fadein = true;

if (fadein && alpha < 0)
    instance_destroy();
