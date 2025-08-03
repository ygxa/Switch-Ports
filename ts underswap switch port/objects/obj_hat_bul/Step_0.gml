x = number_approach_smooth(x, destX, 0.2, 0.2);
y = number_approach_smooth(y, destY, 0.5, 0.5);

if (fadeTimer > 0)
{
    fadeTimer--;
}
else if (fadeTimer == 0)
{
    if (image_alpha > 0)
        image_alpha -= 0.1;
}
