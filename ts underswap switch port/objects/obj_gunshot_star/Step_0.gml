siner += 15;
sinerDelta += sinerSpeed;
sinerSpeed += sinerGrav;
image_angle += angle;
sinerRad = degtorad(siner);
x = xstart + (sin(sinerRad) * sinerDelta);
y = ystart + (cos(sinerRad) * sinerDelta);
size = 1 + (sinerSpeed / 20);

if (size < 0.2)
    size = 0;

if (sinerSpeed < 0)
    image_alpha -= 0.07;

image_xscale = size;
image_yscale = size;

if (sinerDelta <= 0.5)
    instance_destroy();
