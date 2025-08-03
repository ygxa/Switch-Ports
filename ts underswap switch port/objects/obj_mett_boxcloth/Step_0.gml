if (y != obj_battlemanager.boxY1)
{
    y += 0.5;
    yDelta += 0.5;
}

if (yDelta == 2.5)
    image_index = 1;
else if (yDelta == 5)
    image_index = 2;
else if (yDelta == 7.5)
    image_index = 3;
else if (yDelta == 10)
    image_index = 4;
else if (yDelta == 12.5)
    image_index = 5;
else if (yDelta == 15)
    image_index = 6;
else if (yDelta == 17.5)
    image_index = 7;
else if (yDelta == 19.5)
    image_index = 8;

colorMerge = number_approach_smooth(colorMerge, 1, 0.25, 0.01);
image_blend = merge_color(baseColor, #888888, colorMerge);
