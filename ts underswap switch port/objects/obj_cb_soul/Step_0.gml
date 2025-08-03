x = xstart + obj_sansdate.x;

if (sinerAmplitude != 0)
    siner += 0.1;

if (x < -sprite_width)
    instance_destroy();
