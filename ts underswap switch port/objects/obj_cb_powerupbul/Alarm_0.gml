image_alpha -= 0.04;

with (obj_battleheart_blue)
{
    cutoff = true;
    canMove = true;
}

if (image_alpha <= 0)
    instance_destroy();

alarm[0] = 1;
