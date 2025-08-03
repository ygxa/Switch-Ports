if (fadeOut)
    colorMerge = number_approach_smooth(colorMerge, 0, 0.05);

image_blend = merge_color(startColor, destColor, colorMerge);
image_alpha = obj_hitthetarget.bgAlpha;

if (image_index >= 3)
{
    if (obj_dateheart_blue.x < 312)
        image_index = 4;
    else
        image_index = 3;
}
