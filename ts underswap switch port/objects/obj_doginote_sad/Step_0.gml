y += ((sin(siner) * 3) + irandom_range(-1, 1));
x += irandom_range(-1, 1);
siner += 0.3;

if (x > (obj_battlemanager.boxX2 + 60))
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}
