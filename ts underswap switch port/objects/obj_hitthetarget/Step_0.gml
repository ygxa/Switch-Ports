event_inherited();

if (borderTop != borderTargetY)
    borderTop = number_approach_smooth(borderTop, borderTargetY, 0.05);

if (soul != -4)
{
    with (soul)
    {
        boundsX = [other.borderLeft + 5, other.borderRight - 21];
        boundsY = [other.borderTop + 5, other.borderBottom - 21];
    }
}

if (gameActive)
    bgAlpha = number_approach_smooth(bgAlpha, 0.5, 0.05);
else
    bgAlpha = number_approach_smooth(bgAlpha, 1, 0.05);

with (obj_sans_date_actor)
{
    var col = global.flavor_sprites ? flavorColor : 16777215;
    image_blend = merge_color(c_black, col, other.bgAlpha);
}

if (gameEnded)
    gameEndedCounter++;
