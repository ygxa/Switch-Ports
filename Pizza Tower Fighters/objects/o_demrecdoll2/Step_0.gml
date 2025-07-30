if (xprev > x)
    image_xscale = 1;

if (xprev < x)
    image_xscale = -1;

xprev = x;
scr_collision();
