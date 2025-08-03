draw_self();

if (specialAttack && visible && image_alpha != 0 && !fadeIn && image_angle == angleToApproach)
{
    if (armAlpha < 1)
        armAlpha += 0.2;
}
